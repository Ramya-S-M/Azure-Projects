<h1 align="center" style="font-size: 50px;">🚀 Hub-Spoke Network Topology</h1>

This project demonstrates a secure and scalable Hub-Spoke network architecture in Microsoft Azure, designed based on real enterprise patterns.

\---

📌 **Architecture Overview**

This architecture consists of:

* 1 Hub "Virtual Network"
* 3 Spoke "Virtual Networks"
* "Virtual Machines (VMs)" deployed in each spoke
* "Network Security Groups (NSG)" for traffic filtering
* "User Defined Routes (UDR)" for forced tunneling
* "Azure Firewall" for centralized traffic inspection
* "Azure Bastion" for secure VM access
* "VPN Gateway" for hybrid connectivity
* "Azure Monitor (Log Analytics)" for monitoring

\---

🧱 Architecture Diagram

![Hub-Spoke-Architecture]<img src="./Hub-Spoke-Network-Topology/Hub-Spoke-Architecture.png" width="900"/>

\---

🧩 Components Used

🔷 Hub VNet:
* Azure Bastion (secure VM access)
* Azure Firewall (central traffic control)
* VPN Gateway (on-prem connectivity)

🔷 Spoke VNets
* Virtual Machines (VMs)
* Network Security Groups (NSG)
* User Defined Routes (UDR)

🔷 Monitoring
Azure Monitor
Log Analytics Workspace

\---

🔁 Traffic Flow

🌐 Internet Traffic (Forced Tunneling): *Spoke VM → UDR → Azure Firewall → Internet*
All outbound traffic from Spoke VNets is routed through Azure Firewall.

🔐 Secure Access (Bastion): User → *Azure Bastion → VM (Private IP)*
* No public IPs used
* Secure browser-based access

🌍 Hybrid Connectivity (VPN): *On-Prem Network → VPN Gateway → Hub → Spokes*

📊 Monitoring Flow: *Firewall / VPN / VMs → Azure Monitor (Log Analytics)*

\---

💡 Key Learnings

\- NSG controls subnet/VM-level access

\- Firewall provides centralized traffic inspection

\- UDR enables forced routing of traffic

\- Bastion eliminates need for public IPs

\- Hub acts as central control point

\- Monitoring is essential for visibility and debugging

\---

🎯 Conclusion

This project demonstrates a secure and scalable Azure Hub-Spoke architecture with centralized traffic control using Azure Firewall and UDR-based routing. It ensures secure VM access through Azure Bastion and supports hybrid connectivity via VPN Gateway. The design highlights key networking concepts such as VNet peering, NSG-based security, and forced tunneling. Overall, it reflects a real-world enterprise architecture focused on security, control, and observability.











