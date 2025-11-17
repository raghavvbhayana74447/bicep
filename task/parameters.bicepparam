using 'main.bicep'

param appServicePlanName= ''
param location = 'eastus'


@description('details of app services')
param AppService = {
  name: 'desired-name'
  location: location
  sku: {
    name: appServicePlanName
    kind: ['linux','windows']
  }
}

@description('name of the custom managed identitty')
param identityName = 'customMi'
