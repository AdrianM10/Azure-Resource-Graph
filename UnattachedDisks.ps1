# Retrieve a list of unattached disks across all subscriptions

Search-AzGraph -Query "Resources
            | where type =~ 'Microsoft.Compute/disks'
            | where properties.diskState =~ 'Unattached'
            | project id, name, tenantId, location, subscriptionId, resourceGroup, diskInGB = properties.diskSizeGB, diskState = properties.diskState, timeCreated = properties.timeCreated" 
           

