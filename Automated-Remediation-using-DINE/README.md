<h1 align="center" style="font-size: 50px;"><strong>🚀 Automated-Remediation-using-DINE</strong></h1>

This project demonstrates how to use Azure Policy with the **DeployIfNotExists (DINE)** effect to automatically remediate non-compliant Storage Accounts by enforcing HTTPS-only traffic.

---

📌 What This Project Does?

When a Storage Account is created with `supportsHttpsTrafficOnly = false` (HTTPS disabled), the policy automatically:
1. Detects the non-compliant resource
2. Triggers a remediation task
3. Deploys an ARM template to set `supportsHttpsTrafficOnly = true`
4. Marks the resource as **Compliant**

---

🏗️ Architecture Flow

```
![Flow Diagram]<img src="./Flow%20Diagram.png" width="800"/>
```
---

## 🚀 Step-by-Step Deployment Guide

### Step 1 — Create Policy Definition

1. Go to **Azure Portal → Policy → Definitions → + Policy definition**
2. Set the definition location to your subscription
3. Enter a name e.g. `Enforce HTTPS on Storage Accounts`
4. Paste the JSON from `policy/policy-definition.json` into the Policy rule editor
5. Click **Save**

---

### Step 2 — Create a Non-Compliant Storage Account (for testing)

1. Go to **Storage accounts → + Create**
2. Fill in basics:
   - Resource group: your test RG
   - Name: e.g. `testdinestorage001`
   - Region: Central India
   - Performance: Standard / Redundancy: LRS
3. Go to **Advanced tab**
   - **Uncheck** → *"Require secure transfer for REST API operations"*
   - This sets `supportsHttpsTrafficOnly = false` ← makes it non-compliant
4. Click **Review + Create → Create**

---

### Step 3 — Assign the Policy

1. Go to **Policy → Assignments → + Assign policy**
2. Set **Scope** → your subscription or resource group
3. Select your policy definition
4. Go to **Remediation tab**:
   - ✅ Check **"Create a remediation task"**
5. Go to **Managed Identity tab**:
   - Type: **System assigned managed identity**
   - Location: your region (e.g. Central India)
   - Note the **Principal ID** shown
6. Click **Review + save**

---

### Step 4 — Assign IAM Role to Managed Identity

1. Go to **Subscriptions → Access Control (IAM) → + Add role assignment**
2. **Role tab** → search **Storage Account Contributor** → Next
3. **Members tab**:
   - Assign access to → **User, group, or service principal**
   - Click **+ Select members**
   - Search by the **Principal ID** from Step 3
   - Select it → click **Select**
4. Click **Review + assign → Assign**

> **Note:** Use "User, group, or service principal" if the Managed Identity dropdown shows "No available items" due to ABAC conditions.

---

### Step 5 — Trigger Remediation Task

1. Go to **Policy → Remediation → + New remediation task**
2. Select your policy assignment
3. Click **Remediate**
4. Wait for status to show ✅ **Complete** (takes 3–10 minutes)

---

### Step 6 — Verify Compliance

1. **Policy → Compliance** → confirm your policy shows ✅ **Compliant**
2. **Storage accounts → your storage account → Configuration**
   - *Secure transfer required* → should now show **Enabled** ✅

---

## 📝 Key Concepts

| Concept                      | Description |
|              ---             |          ---|
| **DeployIfNotExists (DINE)** | Policy effect that deploys a resource or configuration when a condition is not met    |
| **Managed Identity**         | Auto-created Azure AD identity tied to the policy    assignment for deployments     |
| **Remediation Task**         | On-demand or auto-triggered job that fixes non-compliant resources        |
| **existenceCondition**       | Defines what "compliant" looks like — if this condition is false, remediation runs |
| **ARM Template**             | The actual fix deployed by the remediation task |
