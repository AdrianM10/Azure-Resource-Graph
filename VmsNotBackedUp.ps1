# Azure Resource Graph query for VM's that don't have backups enabled

# Connect to Azure with an authenticated account
Connect-AzAccount

Search-AzGraph -Query "advisorresources
	| where type == 'microsoft.advisor/recommendations'
	| where properties['category'] == 'Security'
	| where properties.shortDescription.solution == 'Azure Backup should be enabled for virtual machines'
	| project VM_Name = tostring(properties.impactedValue), resourceGroup, tenantId, Recommendation = tostring(properties.shortDescription.solution)" 
