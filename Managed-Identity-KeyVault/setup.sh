# Azure Login
az login --use-device-code

# Setting the Correct Subscription
az account set --subscription 8544ad7e-b415-4aa9-9a13-e91359c79aef

# To confirm if it is set correctly
az account show --query "{name:name, id:id, state:state}" --output table

# Setting the Variables
RESOURCE_GROUP="rg-keyvault-project"
LOCATION="centralindia"
APP_NAME="webapp-ramya-kv"
PLAN_NAME="plan-ramya-kv"
KEY_VAULT_NAME="kv-ramya-webapp"

# Verify all the variables which are set
echo "RG=$RESOURCE_GROUP | APP=$APP_NAME | KV=$KEY_VAULT_NAME"

# Creating resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Creating AppService Plan
az appservice plan create --name $PLAN_NAME --resource-group $RESOURCE_GROUP --sku B1 --is-linux

# Creating WebApp
az webapp create --name $APP_NAME --resource-group $RESOURCE_GROUP --plan $PLAN_NAME --runtime "NODE:20-lts"

# Creating KeyVault with RBAC enabled
az keyvault create --name $KEY_VAULT_NAME --resource-group $RESOURCE_GROUP --location $LOCATION --sku standard --enable-rbac-authorization true

# Giving Admin access to Ourselves
MY_USER_ID=$(az ad signed-in-user show --query id --output tsv)

# Getting KeyVault resource ID
KV_ID=$(az keyvault show --name $KEY_VAULT_NAME --resource-group $RESOURCE_GROUP --query id --output tsv)

# Granting KeyVault role for Ourselves first
az role assignment create --assignee $MY_USER_ID --role "Key Vault Administrator" --scope $KV_ID

# Verify
echo "MY_USER_ID=$MY_USER_ID"
echo "KV_ID=$KV_ID"

# Storing secret
az keyvault secret set --vault-name $KEY_VAULT_NAME --name "MyDbConnectionString" --value "Server=myserver.database.windows.net;Database=mydb;User=ramya;"

# Verify
az keyvault secret list --vault-name $KEY_VAULT_NAME --output table

# Enable System-Assigned MI
az webapp identity assign --name $APP_NAME --resource-group $RESOURCE_GROUP

# Save App Identiy as variable
APP_IDENTITY=$(az webapp identity show --name $APP_NAME --resource-group $RESOURCE_GROUP --query principalId --output tsv)

# Verify
echo "App identity: $APP_IDENTITY"

# Grant role for WebApp
az role assignment create --assignee $APP_IDENTITY --role "Key Vault Secrets User" --scope $KV_ID

# Add KeyVault reference to App settings
az webapp config appsettings set --name $APP_NAME --resource-group $RESOURCE_GROUP --settings DB_CONNECTION_STRING="@Microsoft.KeyVault(VaultName=${KEY_VAULT_NAME};SecretName=MyDbConnectionString)" APP_ENV="production" APP_NAME_LABEL="Ramya Key Vault Demo"

# Restart WebApp
az webapp restart --name $APP_NAME --resource-group $RESOURCE_GROUP

# Check KeyVault reference status
az webapp config appsettings list --name $APP_NAME --resource-group $RESOURCE_GROUP --query "[?name=='DB_CONNECTION_STRING']" --output table