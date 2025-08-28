# Secure Azure Storage Account with Private Endpoint

## Architecture
This project demonstrates how to securely access an **Azure Storage Account** using a **Private Endpoint**.  
The architecture consists of:  
- **Azure Storage Account** with **public network access disabled**.  
- **Private Endpoint** to enable access only from within a Virtual Network.  
- **Private DNS Zone** to ensure proper name resolution for the storage account.  
- **Virtual Machine (VM)** inside the same VNet for testing secure access.  

![Architecture Diagram](https://github.com/Ramya-S-M/Azure-Projects/blob/690fbb40ff4466b9faec4f755b8eee81374f73be/Storage%20Account%20with%20Private%20Endpoint/storage%20account%20private%20endpoint.png)

---

## Steps to Reproduce

### Step 1: Create a Virtual Network
**What is a Virtual Network (VNet)?**  
A VNet is the fundamental building block for private networking in Azure.  
It allows secure communication between Azure resources.  

**What we do here:**  
- Create a new VNet with at least one Subnet.  
- This subnet will host the VM and the Private Endpoint.  

![VNet Creation](https://github.com/Ramya-S-M/Azure-Projects/blob/690fbb40ff4466b9faec4f755b8eee81374f73be/Storage%20Account%20with%20Private%20Endpoint/Vnet.png)

---

### Step 2: Create a Storage Account
**What is an Azure Storage Account?**  
An Azure Storage Account provides cloud storage for blobs, files, queues, and tables.  
By default, storage accounts can be accessed publicly, but we disable that and use Private Endpoint for secure access.  

**What we do here:**  
- Go to Azure Portal → *Storage Accounts* → **Create**.  
- Choose Resource Group, Region, and Storage Type = **Blob**.  
- Set **Public Network Access = Disabled**.


![Storage Account Creation](https://github.com/Ramya-S-M/Azure-Projects/blob/690fbb40ff4466b9faec4f755b8eee81374f73be/Storage%20Account%20with%20Private%20Endpoint/Storage-Account.png)

---

### Step 3: Configure Private Endpoint
**What is a Private Endpoint?**  
A Private Endpoint assigns a private IP to your resource, ensuring it is accessible only inside your VNet.  

**What we do here:**  
- Navigate to **Storage Account → Networking → Private Endpoint**.  
- Create a new Private Endpoint for **Blob service**.  
- Attach it to the VNet + Subnet.  

![Private Endpoint Creation](https://github.com/Ramya-S-M/Azure-Projects/blob/690fbb40ff4466b9faec4f755b8eee81374f73be/Storage%20Account%20with%20Private%20Endpoint/Private-Endpoint.png)

---

### Step 5: Deploy a Virtual Machine
**What is the role of the VM?**  
We deploy a VM inside the same VNet to test secure connectivity to the Storage Account.  

**What we do here:**  
- Create a Windows or Linux VM inside the same VNet.  
- Use this VM to run validation commands.  

![VM Creation](https://github.com/Ramya-S-M/Azure-Projects/blob/690fbb40ff4466b9faec4f755b8eee81374f73be/Storage%20Account%20with%20Private%20Endpoint/Virtual-Machine.png)

---

### Step 6: Verification

![Output](https://github.com/Ramya-S-M/Azure-Projects/blob/690fbb40ff4466b9faec4f755b8eee81374f73be/Storage%20Account%20with%20Private%20Endpoint/SSH-Output.png)
