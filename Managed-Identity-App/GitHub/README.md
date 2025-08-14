# Managed Identity for Secure App Authentication

This project demonstrates how to securely retrieve secrets from **Azure Key Vault** in a Python Flask app using **System Assigned Managed Identity**.

## Architecture
- **Azure App Service (Web App)**
- **Azure Key Vault**
- **System Assigned Managed Identity**
- **Python + Flask**

## Steps to Reproduce:
### 1️. Create a Key Vault & Secret  
- In **Azure Portal**, create a Key Vault.  
- Add a secret (e.g., `Your_Secret_name`) with your test value.  

### 2️. Deploy the Flask Web App to Azure App Service  
- Create an Azure Web App (Linux or Windows).  
- Deploy your Flask app code (via Azure CLI, VS Code, or GitHub Actions).  

### 3️. Enable System Assigned Managed Identity  
- Go to **Web App → Identity**.  
- Enable **System Assigned Managed Identity** → Save.  

### 4️. Grant Key Vault Access  
- Go to **Key Vault → Access policies**.  
- Add a policy giving **Get Secret** permission to the Web App’s Managed Identity.  

### 5️. Set Environment Variables in Azure Web App  
- Go to **Configuration → Application settings**.  
- Add:
  - `KEY_VAULT_NAME` → your Key Vault name  
  - `SECRET_NAME` → your secret name  

### 6️. Run & Verify  
- Browse to your Web App URL.  


### Create Azure Key Vault & Secret
```bash
az keyvault create --name Your_keyvault_name --resource-group Your_resourcegroup_name --location eastus/your_preference
az keyvault secret set --vault-name kv-mi-demo --name Your_Secret_name --value "******"
