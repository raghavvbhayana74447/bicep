using 'main.bicep'

param appServicePlanName = 'myasp74447'

param location = 'eastus'



@description('details of app service')
param AppService = {
  name: 'myapp74447'
  location: location
  sku: {
    name: 'P1v2'       
    kind: 'linux'     
  }
}

@description('name of the custom managed identity')
param identityName = 'customMI'


