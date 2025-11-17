using 'main.bicep'

param appServicePlanName = 'myasp74447'

param location = 'eastus'

@description('details of app service')
param AppService = {
  name: 'desired-name'
  location: location
  sku: {
    name: 'P1v2'       // Valid SKU name
    kind: 'linux'      // Single value (not array)
  }
}

@description('name of the custom managed identity')
param identityName = 'customMI'
