# Azure Resource Graph query for subscription tags, project subscription name, tenantId and tags associated to a subscription

# Connect to Azure with an authenticated account
Connect-AzAccount

Search-AzGraph -Query "resourceContainers
    | where type == 'microsoft.resources/subscriptions'
    | project name, tenantId, tags"