# Retrieve a list of unattached disks across all subscriptions 

Search-AzGraph -Query "Resources
            | where type =~ 'Microsoft.Compute/disks'
            | where properties.diskState =~ 'Unattached'
            | project name, resourceGroup, subscriptionId, location, tenantId
           

