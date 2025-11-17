@description('location')
param location string 

param appServicePlanName string 
param AppService object 

module managedIdentity '../modules/MI.bicep' = {
  name: 'customMI'
  params: {
    identityName: 'customMI'
    location: location
  }
}
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'asp-${uniqueString(resourceGroup().id)}'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
  identity:{
    type: 'SystemAssigned'
    userAssignedIdentities: {
      '$userAssignedIdentity.name': {}
    }
  }
}
resource appService 'Microsoft.Web/sites@2024-04-01' {
  name: 'myAppService'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
  identity:{
    type: 'SystemAssigned'
    userAssignedIdentities: {
      '$userAssignedIdentity.name': {}
    }
  }
}
