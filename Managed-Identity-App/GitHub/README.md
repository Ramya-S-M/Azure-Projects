# Managed Identity for Secure App Authentication

This project demonstrates how to securely retrieve secrets from **Azure Key Vault** in a Python Flask app using **System Assigned Managed Identity**.

## Architecture
- **Azure App Service (Web App)**
- **Azure Key Vault**
- **System Assigned Managed Identity**
- **Python + Flask**

![Architecture Diagram](https://github.com/Ramya-S-M/Azure-Projects/blob/68c9027472beff4d76d1c98aa3a9b6899a5dfaae/Managed-Identity-App/images/Architecture.png)

## Steps to Reproduce:
### 1️. Create a Key Vault & Secret  

- **What is Azure Key Vault?**  
Azure Key Vault is a cloud service for securely storing and accessing secrets, keys, and certificates.  
Instead of storing sensitive information like passwords in your application code, you can store them in Key Vault and fetch them securely at runtime.  

**What we do here:**  
- Create a Key Vault in the Azure portal.  
- Add a secret (e.g., `Your_Secret_Name`) with your test value. 

![Creation of Azure KeyVault](https://github.com/Ramya-S-M/Azure-Projects/blob/68c9027472beff4d76d1c98aa3a9b6899a5dfaae/Managed-Identity-App/images/keyvault.png)

### 2️. Deploy the Flask Web App to Azure App Service  
- **What is Azure App Service?**  
Azure App Service is a fully managed platform for hosting web applications.  
It supports various languages including Python, and integrates with Managed Identity for secure access to other Azure resources.  

**What we do here:**  
- Create an Azure Web App (Linux or Windows).  
- Deploy the Flask app code using Azure CLI, VS Code, or GitHub Actions.  
  

![Creation of WebApp](https://github.com/Ramya-S-M/Azure-Projects/blob/68c9027472beff4d76d1c98aa3a9b6899a5dfaae/Managed-Identity-App/images/Web-app-output.png)

### 3️. Enable System Assigned Managed Identity  
- **What is a Managed Identity?**  
A Managed Identity is an automatically managed identity in Azure AD that apps can use to authenticate to resources without storing credentials.  

**What we do here:**  
- Go to **Web App → Identity** in the Azure portal.  
- Enable **System Assigned Managed Identity** and save.  


### 4️. Grant Key Vault Access  
- **Why this step?**  
Even though our Web App has a Managed Identity, it still needs permission to read secrets from Key Vault.  

**What we do here:**  
- Go to **Key Vault → Access policies**.  
- Add a policy granting **Get Secret** permissions to the Web App’s Managed Identity.  


### 5️. Set Environment Variables in Azure Web App  
- **Why environment variables?**  
We use environment variables so our app can dynamically read configuration without changing the code.  

**What we do here:**  
- Go to **Web App → Configuration → Application settings**.  
- Add:  
  - `KEY_VAULT_NAME` → your Key Vault name  
  - `SECRET_NAME` → your secret name  

### 6️. Run & Verify  
- Browse to your Web App URL.  

![Output for WebApp](https://github.com/Ramya-S-M/Azure-Projects/blob/68c9027472beff4d76d1c98aa3a9b6899a5dfaae/Managed-Identity-App/images/Web-app-output.png)

### Create Azure Key Vault & Secret
```bash
az keyvault create --name Your_keyvault_name --resource-group Your_resourcegroup_name --location eastus/your_preference
az keyvault secret set --vault-name kv-mi-demo --name Your_Secret_name --value "******"
