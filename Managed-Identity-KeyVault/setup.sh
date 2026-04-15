az login --use-device-code


RG="RG-Secure-Identity"
LOC="centralindia"
RAND=$RANDOM
KV="kv-secure-vault-$RAND"
APP="webapp-secure-$RAND"
PLAN="ServicePlan-Linux"


echo "Building infrastructure..."
az group create --name $RG --location $LOC
az keyvault create --name $KV --resource-group $RG --enable-rbac-authorization true
az appservice plan create --name $PLAN --resource-group $RG --sku S1 --is-linux
az webapp create --name $APP --resource-group $RG --plan $PLAN --runtime "PYTHON:3.11"



echo "Building Managed Identity..."
MSI_ID=$(az webapp identity assign --name $APP --resource-group $RG --query principalId -o tsv)

echo "Granting RBAC role..."
KV_SCOPE=$(az keyvault show --name $KV --query id -o tsv)
az role assignment create --role "Key Vault Secrets User" --assignee-object-id $MSI_ID --assignee-principal-type ServicePrincipal --scope $KV_SCOPE

echo "Securing the Secret..."
az keyvault secret set --vaultname $KV --name "DbPassword" --value "MyGrandSecret123!"

SECRET_URI=$(az keyvault secret show --name "DbPassword" --vault-name $KV --query id -o tsv)

az webapp config appsettings set --name $APP --resource-group $RG \ --settings DB_PASSWORD="@Microsoft.KeyVault(SecretUri=$SECRET_URI)"

echo "Done"
echo "Resource Group: $RG"
echo "Key Vault: $KV"
echo "Web App: $APP"