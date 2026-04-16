az login --use-device-code


RESOURCE_GROUP="rg-myapp-cd"
LOCATION="centralindia"
APP_NAME="myapp-ramya"
KEY_VAULT_NAME="kvapp-web-ramya"
APP_PLAN="plan-myapp"

echo $APP_NAME
echo $KEY_VAULT_NAME

echo "Building infrastructure..."
az group create --name $RESOURCE_GROUP --location $LOCATION
az keyvault create --name $KEY_VAULT_NAME --resource-group $RESOURCE_GROUP --enable-rbac-authorization true
az appservice plan create --name $APP_PLAN --resource-group $RESOURCE_GROUP --sku B2 --is-linux
az webapp create --name $APP_NAME --resource-group $RESOURCE_GROUP --plan $APP_PLAN --runtime "PYTHON:3.11"

echo "Building Managed Identity..."
MSI_ID=$(az webapp identity assign --name $APP_NAME --resource-group $RESOURCE_GROUP --query principalId -o tsv)

echo "Granting RBAC role..."
KV_SCOPE=$(az keyvault show --name $KEY_VAULT_NAME --query id -o tsv)
az role assignment create --role "Key Vault Secrets User" --assignee-object-id $MSI_ID --assignee-principal-type ServicePrincipal --scope $KV_SCOPE

echo "Securing the Secret..."
az keyvault secret set --vault-name $KEY_VAULT_NAME --name "DbPassword" --value "MyGrandSecret123!"
SECRET_URI=$(az keyvault secret show --name "DbPassword" --vault-name $KEY_VAULT_NAME --query id -o tsv)
az webapp config appsettings set --name $APP_NAME --resource-group $RESOURCE_GROUP --settings DB_PASSWORD="@Microsoft.KeyVault(SecretUri=$SECRET_URI)"