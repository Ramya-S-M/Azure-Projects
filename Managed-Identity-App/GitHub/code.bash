### Create Azure Key Vault & Secret
```bash
az keyvault create --name Your_keyvault_name --resource-group Your_resourcegroup_name --location eastus/your_preference
az keyvault secret set --vault-name kv-mi-demo --name Your_Secret_name --value "******"