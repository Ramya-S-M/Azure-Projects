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

![Create Storage Account](images/create-storage-account.png)  

---

### 2️. Apply a Resource Lock  
- Navigate to the **Storage Account → Locks**.  
- Add a **Read-Only** or **Delete** lock.  

![Apply Resource Lock](images/resource-lock.png)  

---

### 3️. Assign IAM Roles  
- Go to **Storage Account → Access Control (IAM)**.  
- Add role assignment (e.g., *Reader*, *Contributor*, *Storage Blob Data Reader*).  
- Assign to a **user/group/service principal**.  

![Assign IAM Role](images/iam-role.png)  

---

### 4️. Test It  
- Try deleting the **Storage Account** → It should fail because of the lock.  
- Try accessing blobs without the right role → You should see **Access Denied**.  

![Test IAM Lock](images/test-lock.png)  

---

## Final Outcome  
- **Resource Lock** prevents accidental deletion/modification.  
- **IAM Roles** ensure only authorized users can perform specific actions.  
- Together, they provide strong **security + governance** in Azure.  
