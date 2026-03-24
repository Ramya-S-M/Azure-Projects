**# 🚀 Azure 3-Tier Architecture**



This project demonstrates a \*\*traditional 3-tier architecture deployed in Microsoft Azure\*\* using Virtual Machines, Load Balancer, and Private Endpoint.



\---



**## 📌 Architecture Overview**



A 3-tier architecture divides the application into three layers:



1\. \*\*Web Tier (Presentation Layer)\*\*

2\. \*\*App Tier (Business Logic Layer)\*\*

3\. \*\*Data Tier (Database Layer)\*\*



This design improves \*\*scalability, security, and maintainability\*\*.



\---



**## 🏗️ Architecture Flow**



\---



**## ☁️ Azure Services Used**



\- Azure Virtual Network (VNet)

\- Network Security Groups (NSG)

\- Azure Application Gateway (WAF)

\- Azure Load Balancer (Public \& Internal)

\- Virtual Machines (Web \& App Tier)

\- Azure Bastion (Secure Access)

\- Azure SQL / MySQL (Database Tier)

\- Private Endpoint

\- Azure Storage Account



\---



**## 🧱 Architecture Components**



**### 🔹 Web Tier**

\- Hosted on Virtual Machines

\- Handles user requests

\- Connected to Public Load Balancer



**### 🔹 App Tier**

\- Processes business logic

\- Connected via Internal Load Balancer



**### 🔹 Database Tier**

\- Stores application data

\- Secured using Private Endpoint



\---



**## 🔐 Security Features**



\- NSG rules applied on all subnets

\- Private Endpoint for DB access

\- Azure Bastion for secure VM login

\- No direct internet access to backend tiers



\---



**## 📂 Project Structure**



Azure-3-Tier-Architecture

├── README.md

└── 3-tier-screenshots



\---



**## 📸 Screenshots**



All deployment screenshots are available inside:



