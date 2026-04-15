az login --use-device-code


RG="RG-Secure-Identity"
LOC="centralindia"
KV="kv-secure-vault-$($Get-Random)"
APP="webapp-secure-$($Get-Random)"
PLAN="ServicePlan-Linux"


echo "Building infrastructure..."
az group create --name $RG --location $LOC

az keyvault create --name $KV --resource-group $RG --enable-rbac-authorization true

az appservice plan create --name $PLAN --resource-group $RG --sku Standard S1 --is-linux

az webapp create --name $APP --resource-group $RG --plan $PLAN --runtime "DOTNET|10"



echo "Building Managed Identity..."
MSI_ID=$(az webapp identity assign --name $APP --resource-group $RG --query principalId -o tsv)

echo "Granting RBAC role..."
KV_SCOPE=$(az keyvault show --name $KV --query id -o tsv)
az role assignment create --role "Key Vault Secrets User" --assignee $MSI_ID --scope $KV_SCOPE

echo "Securing the Secret..."
az keyvault secret set --vaultname $KV --name "DbPassword" --value "MyGrandSecret123!"

SECRET_URI=$(az keyvault secret show --name "DbPassword" --vault-name $KV --query id -o tsv)

az webapp config appsettings set --name $APP --resource-group $RG \ --settings DB_PASSWORD="@Microsoft.keyvault(SecretUri=$SECRET_URI)"