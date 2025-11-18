@description('location')
param location string 

param appServicePlanName string 
param AppService object  // Optional, used if you want to define the App Service properties dynamically
param identityName string

module managedIdentity '../modules/MI.bicep' = {
  name: 'customMI'
  params: {
    identityName: identityName
    location: location
  }
}

// Construct resource ID statically using known identityName param
var managedIdentityResourceId = resourceId('Microsoft.ManagedIdentity/userAssignedIdentities', identityName)

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'P1v2' 
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${managedIdentityResourceId}': {}
    }
  }
}

resource appService 'Microsoft.Web/sites@2024-04-01' = {
  name: 'myAppService'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${managedIdentityResourceId}': {}
    }
  }
}
