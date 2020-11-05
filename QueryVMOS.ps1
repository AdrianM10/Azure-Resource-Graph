//Query VM's by OS Type across all subscriptions

Search-AzGraph -Query "Resources
| where type =~ 'Microsoft.Compute/virtualMachines'
| where properties.storageProfile.imageReference.sku =~ '16.04-LTS'"
