<h1 align="center"><strong>🚀 **My Web App — Azure CI/CD with GitHub Actions**</strong></h1>



A Node.js web app deployed to Azure App Service using GitHub Actions for continuous deployment and deployment slots for zero-downtime releases.



\---



**Architecture**





GitHub (push to main)

&#x20;   ↓

GitHub Actions workflow

&#x20;   ↓ build + test

Azure App Service — Staging slot

&#x20;   ↓ verify + swap

Azure App Service — Production



!\[Architecture Diagram](Architecture-CiCd.png)



\---



**What this project covers**



\- Azure App Service deployment (Linux, Node.js 20)

\- Deployment slots (staging + production)

\- GitHub Actions CI/CD pipeline

\- Zero-downtime slot swap

\- Publish profile authentication via GitHub secrets



\---



**How the pipeline works?**



1\. Push code to `main` branch

2\. GitHub Actions triggers (only when `My-Web-App/\\\*\\\*` files change)

3\. Installs Node.js dependencies

4\. Deploys to Azure staging slot

5\. Manual verification of staging URL

6\. Slot swap → production (zero downtime)



\---



**Setup steps:**



**1. Azure resources needed**

\- Resource Group

\- App Service Plan (B1 or higher — required for slots)

\- Web App (Node.js 20 LTS, Linux)

\- Deployment slot named `staging`



**2. GitHub secret required**

|                    Secret name                             |                            Value                                 |

|                          ---                                      |                               ---                                  |

| *`AZURE\\\_WEBAPP\\\_PUBLISH\\\_PROFILE` | XML content from staging slot publish profile* |



**3. Update the workflow**

In `.github/workflows/deploy-my-web-app.yml` change:



*yaml*

AZURE\\\_WEBAPP\\\_NAME: *your-app-name-here*


\---



**Live URLs**

\- Production: *`https://your-app.azurewebsites.net`*

\- Staging: *`https://your-app-staging.azurewebsites.net`*



\---



**Key learnings**

* `.github/workflows/` must be at the repo root — GitHub only looks here
* Download publish profile from the \*\*staging slot\*\*, not the main app
* Free (F1) plan does not support deployment slots — use B1 minimum
* `paths:` filter in workflow prevents unnecessary runs for other projects in the repo

