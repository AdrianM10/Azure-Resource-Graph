# Azure Resource Graph query for VM's that don't have backups enabled

# Connect to Azure with an authenticated account
Connect-AzAccount

Search-AzGraph -Query "advisorresources
	| where type == 'microsoft.advisor/recommendations'
	| where properties.impactedField == 'Microsoft.Compute/virtualMachines'
	| where properties.shortDescription.solution =~ 'Enable virtual machine backup to protect your data from corruption and accidental deletion'
	| project VM_Name = tostring(properties.impactedValue), Category = tostring(properties.category), resourceGroup, subscriptionId, tenantId"
