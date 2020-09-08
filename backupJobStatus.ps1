# Azure Resource Graph query for backup jobs status (Virtual Machines)
# Connect to Azure with an authenticated account
Connect-AzAccount

# Edit where todatetime(properties.startTime) {TimeRange} to specify time range
# Edit properties.status =~ InProgress / Failed / Completed

Search-AzGraph -Query "RecoveryServicesResources
| where type =~ 'microsoft.recoveryservices/vaults/backupjobs'
| where properties.backupManagementType =~ 'AzureIaasVM'
| where todatetime(properties.startTime) > ago (1d)
| where properties.status =~ 'InProgress'" 