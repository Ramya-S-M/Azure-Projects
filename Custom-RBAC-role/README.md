# Custom RBAC Role in Azure – VM Start/Stop without Delete

## 📌 Goal
Learn how to create a custom Azure RBAC role that allows starting and stopping a Virtual Machine, but **does not** allow deleting it.

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
"actions": [
    "Microsoft.Compute/virtualMachines/powerOff/action",
    "Microsoft.Compute/virtualMachines/deallocate/action",
    "Microsoft.Compute/virtualMachines/restart/action",
    "Microsoft.Compute/virtualMachines/start/action"
]

 
 ### 2. Images
 