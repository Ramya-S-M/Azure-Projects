# Azure Resource Lock + IAM Policy Enforcement  

This project demonstrates how to secure Azure resources using **Resource Locks** (to prevent accidental deletion/modification) and **IAM (RBAC Policies)** to enforce access control.  

- **Resource Locks** prevent accidental or unauthorized changes to critical resources such as Storage Accounts, Virtual Machines, or Resource Groups. Locks can be set to:
  - **Read-Only** → Prevents changes but allows read operations.  
  - **Delete** → Prevents accidental deletion of the resource.  

- **Azure IAM (Role-Based Access Control)** ensures that users and applications have **only the permissions they need** to perform their jobs. By assigning least-privilege roles like *Reader*, *Contributor*, or *Storage Blob Data Reader*, you can enforce strong access governance.  

By combining **Resource Locks** and **IAM Policies**, we can:  
- Prevent costly mistakes such as deleting production resources.  
- Enforce security best practices through role-based permissions.  
- Strengthen overall governance and compliance within Azure environments. 

---

## Steps to Reproduce  

### 1️. Create Resource Group & Storage Account  
- In Azure Portal, create a **Resource Group**.  
- Inside the Resource Group, create a **Storage Account**.  

![Create Storage Account](https://github.com/Ramya-S-M/Azure-Projects/blob/09adfe465354821440ecd8f604c38c9de7c97fe0/Resource%20Lock%20%2B%20IAM%20Policy/Storage%20Account.png)  

---

### 2️. Apply a Resource Lock  
- Navigate to the **Storage Account → Locks**.  
- Add a **Read-Only** or **Delete** lock.  

![Apply Resource Lock](https://github.com/Ramya-S-M/Azure-Projects/blob/09adfe465354821440ecd8f604c38c9de7c97fe0/Resource%20Lock%20%2B%20IAM%20Policy/Resource%20Lock.png)  

---

### 3️. Assign IAM Roles  
- Go to **Storage Account → Access Control (IAM)**.  
- Add role assignment (e.g., *Reader*, *Contributor*, *Storage Blob Data Reader*).  
- Assign to a **user/group/service principal**.  

![Assign IAM Role](https://github.com/Ramya-S-M/Azure-Projects/blob/09adfe465354821440ecd8f604c38c9de7c97fe0/Resource%20Lock%20%2B%20IAM%20Policy/IAM%20roles.png)  

---

### 4️. Test It  
- Try deleting the **Storage Account** → It should fail because of the lock.  
- Try accessing blobs without the right role → You should see **Access Denied**.  

![Test IAM Lock](https://github.com/Ramya-S-M/Azure-Projects/blob/09adfe465354821440ecd8f604c38c9de7c97fe0/Resource%20Lock%20%2B%20IAM%20Policy/Test%20User.png)

---
