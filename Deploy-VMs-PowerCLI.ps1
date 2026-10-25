# Infrastructure Automation with PowerCLI
# Author: Kgotso Moyahabo Matotoka
# Purpose: Automate the deployment of 5 VMs from the Content Library Template
# Reference: Section 18 of Portfolio of Evidence (LAB2 Environment)

# 1. Connect to vCenter Server
# SECURITY NOTE: In a real production environment, use Get-Credential or a secure vault.
$vCenterServer = "10.10.10.140" 
$vCenterUser = "KgotsoM@vsphere.local" 
$vCenterPassword = "YOUR_SECURE_PASSWORD" # Password redacted for public repository

Connect-VIServer -Server $vCenterServer -User $vCenterUser -Password $vCenterPassword

# 2. Define Environment Variables (Based on LAB2 Architecture)
$ClusterName = "LAB2"
$VMPrefix = "Web-Auto"
$TemplateName = "Web-Server-Template"
$DatastoreName = "VMFS2"

# 3. Retrieve Template, Datastore, and Cluster
$Template = Get-Template -Name $TemplateName
$Datastore = Get-Datastore -Name $DatastoreName
$Cluster = Get-Cluster -Name $ClusterName

Write-Host "Starting automated deployment of 5 VMs..." -ForegroundColor Green

# 4. Automate Mass Deployment using a For Loop (Thin Provisioning)
for ($i = 4; $i -le 8; $i++) {
    # Formats the name as Web-Auto-04, Web-Auto-05, etc.
    $VMName = "{0}-{1:D2}" -f $VMPrefix, $i 
    
    Write-Host "Deploying $VMName..." -ForegroundColor Cyan
    
    New-VM -Name $VMName -Template $Template -ResourcePool $Cluster -Datastore $Datastore -DiskStorageFormat Thin | Out-Null
    
    Write-Host "$VMName deployed successfully!" -ForegroundColor Yellow
}

Write-Host "Automation Complete! 5 VMs deployed." -ForegroundColor Green

# 5. Cleanup
Disconnect-VIServer -Server * -Force -Confirm:$false
