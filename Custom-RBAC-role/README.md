# Custom RBAC Role in Azure – VM Start/Stop without Delete

## 📌 Goal
This project demonstrates how to create a **Custom Role in Azure** that allows a user to **start and stop a Virtual Machine** but restricts them from **deleting it**.  
It’s useful in scenarios where you want to delegate operational control without risking resource deletion.

---

## 🎯 Scenario
You want to give a user permission to **start** and **stop** a VM but ensure they cannot delete the VM or modify other resources.

---

## 🛠 Skills Learned
- Creating **custom RBAC roles** in Azure
- Understanding **role definitions** in JSON
- Assigning roles at **specific scopes** (VM level)
- Testing access with a **test user**

## 🏗️ Project Architecture
          This architecture shows how a custom RBAC role controls VM operations, detailing the permissions flow between Azure AD, the role definition, and the target VM.

![Architecture Diagram](https://github.com/Ramya-S-M/Azure-Projects/blob/a60f2c5a77797e7e1aa476622b41eb737f7cfacd/Custom-RBAC-role/images/Architecture.png)

---

## 🛠️ Step 1: Azure VM Start-Stop
          Here it demonstrates how the custom RBAC role grants a user the ability to start and stop the VM without providing full administrative access.

![Step 1 - VM Start-Stop](https://github.com/Ramya-S-M/Azure-Projects/blob/26cf66e246837882df930d6393b710078475382b/Custom-RBAC-role/images/Start-Stop-VM.png)

---

## 🛠️ Step 2: VM Delete
          This step illustrates how a user with delete permissions in the custom RBAC role can remove the VM resource from Azure.

![Step 2 - VM Delete](https://github.com/Ramya-S-M/Azure-Projects/blob/26cf66e246837882df930d6393b710078475382b/Custom-RBAC-role/images/Delete-VM.png)

---
