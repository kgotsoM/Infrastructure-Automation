# Enterprise-Grade vSphere 8 Lab Environment & Automation Portfolio

**Author:** Kgotso Moyahabo Matotoka  
**Certification:** VMware Cloud Foundation 9.0 Administrator (2V0-17.25)  
**Environment:** LAB2 (Simulated Production vSphere 8 / ESXi Environment)  

## 1. Business Specification & Architecture
This repository contains the documentation and automation scripts for an enterprise-grade, multi-tier vSphere 8 lab environment, designed to replicate real-world production standards. 
* **Architecture:** Designed a 4-host HA/DRS cluster with Anti-Affinity rules to eliminate single points of failure.
* **Networking:** Configured Distributed Switches (vDS), VLAN segmentation, LACP, NetFlow (port 2055), and NIOC v3 to guarantee 1 Gbps for the Database tier.
* **Storage Strategy:** Implemented Thin Provisioning for Web/App tiers and Thick Eager Zeroed for the Database tier to optimize I/O performance, following VMware production best practices.

## 2. Infrastructure Automation (PowerCLI)
Transitioned from manual GUI deployments to Infrastructure as Code (IaC) principles within the lab.
* **The Script:** `Deploy-VMs-PowerCLI.ps1` automates the deployment of 5 virtual machines (Web-Auto-04 to 08) from a Content Library template using a `for` loop.
* **The Result:** Reduced deployment time from ~15 minutes per VM to seconds, ensuring 100% configuration consistency and zero configuration drift.

## 3. Troubleshooting & Error Handling
Documented and resolved complex technical challenges within the simulated environment:
* **vDS Version Incompatibility:** Recreated the vDS using version 7.0.0 to match host capabilities.
* **Management Network Isolation:** Recovered hosts that lost connection to vCenter by migrating vmk0 adapters from default VLAN 0 to the correct Management VLAN 10.
* **Template Cloning Error:** Resolved a "Failed to Quiesce" error by gracefully shutting down the guest OS to ensure a clean file system state before cloning.

## 4. Repository Contents
* **`Kgotso_Moyahabo_Matotoka_Portfolio_of_Evidence.pdf`**: The complete, official portfolio documenting the architecture, configuration, and troubleshooting of the LAB2 environment.
* **`Deploy-VMs-PowerCLI.ps1`**: The sanitized PowerShell script used for automated mass VM deployment in the lab.

## 5. Testing & Documentation
* All configurations were rigorously tested in the lab environment, including vMotion live migration validation and vDS Health Checks.
* Comprehensive documentation and SOPs were produced to agreed industry standards, demonstrating readiness for enterprise production environments.

---
*Prepared for BBD Graduate Programme Application*
