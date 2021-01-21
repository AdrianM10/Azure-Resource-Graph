# Azure Resource Graph query for unattached disks

# Connect to Azure with an authenticated account
Connect-AzAccount

Search-AzGraph -Query "Resources
            | where type =~ 'Microsoft.Compute/disks'
            | where properties.diskState =~ 'Unattached'
            | project name, resourceGroup, subscriptionId, location, tenantId"
           

