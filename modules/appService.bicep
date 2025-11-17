param location string = 'eastus'
param appserviceAppName string = 'myapp${uniqueString(resourceGroup().id)}'
@allowed([
  'prod'
  'nonprod'
])
param environmentType string 
var appServicePlanName string = 'Custom-ASP7447'
var appServicePlanSkuName = (environmentType == 'prod') ? 'P2v3' : 'F1'

resource appServicePlan 'Microsoft.Web/serverfarms@2024-11-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSkuName
    kind: 'Linux'
  }
}
resource appServiceApp 'Microsoft.Web/sites@2024-11-01' = {
  name: appserviceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
output appServiceAppHostName string = appServiceApp.properties.defaultHostName
