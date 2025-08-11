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

---

## 📝 Steps

### 1. Prepare the Custom Role JSON
Include only the required actions:
```json
{
  "Name": "VM Start Stop Operator - No Delete",
  "IsCustom": true,
  "Description": "Can start and stop VM but cannot delete it",
  "Actions": [
    "Microsoft.Compute/virtualMachines/start/action",
    "Microsoft.Compute/virtualMachines/deallocate/action",
    "Microsoft.Compute/virtualMachines/restart/action"
  ],
  "NotActions": [
    "Microsoft.Compute/virtualMachines/delete"
  ],
  "AssignableScopes": [
    "/subscriptions/{subscription-id}"
  ]
}

---

## 🏗️ Project Architecture

![Architecture Diagram](https://github.com/Ramya-S-M/Azure-Projects/blob/a60f2c5a77797e7e1aa476622b41eb737f7cfacd/Custom-RBAC-role/images/Architecture.png)

---

## 🛠️ Step 1: Azure VM Start-Stop

![Step 1 - VM Start-Stop](https://github.com/Ramya-S-M/Azure-Projects/blob/26cf66e246837882df930d6393b710078475382b/Custom-RBAC-role/images/Start-Stop-VM.png)

---

## 🛠️ Step 2: VM Delete

![Step 2 - VM Delete](https://github.com/Ramya-S-M/Azure-Projects/blob/26cf66e246837882df930d6393b710078475382b/Custom-RBAC-role/images/Delete-VM.png)

---
 
