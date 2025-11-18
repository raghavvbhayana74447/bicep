param location string
param identityName string 
param sku object 
param kind string 
param appServiceName string 
var aspName = 'AspName${uniqueString(resourceGroup().id)}'

module managedIdentity 'modules/Managed_Identity.bicep' = {
  params: {
    location: location
    identityName: identityName
  }
}

module appServicePlan 'modules/ASP.bicep' = { 
  params: {
    AspName: 'AspName'
    kind: kind
    location: location
    sku: {
      name: sku.name
      tier: sku.tier
    }
  }
}

module appService 'modules/appService.bicep' = {
  params:{
    appServiceName: appServiceName
    location: location
    appServicePlanName: aspName
  }
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${resourceId('Microsoft.ManagedIdentity/userAssignedIdentities', identityName)}': {}
    }
}
}


