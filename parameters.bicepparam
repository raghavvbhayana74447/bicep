using 'main.bicep'

param appServicePlanName = 'myasp74447'

param location = 'eastus'

param resourceGroup= 'RnD-RaghavRG'

@description('details of app service')
param AppService = {
  name: 'myapp${uniqueString(resourceGroup().id)}'
  location: location
  sku: {
    name: 'P1v2'       
    kind: 'linux'     
  }
}

@description('name of the custom managed identity')
param identityName = 'customMI'
