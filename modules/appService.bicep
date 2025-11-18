@description('name of appService')
param appServiceName string 

@description('location')
param location string

@description('name of ASP and fetching the value')
param appServicePlanName string
var appServicePlanId string =  resourceId('Microsoft.Web/serverfarms', appServicePlanName)



resource appService 'Microsoft.Web/sites@2023-12-01' = {
  name: appServiceName
  location: location
  properties: {
    serverFarmId: appServicePlanId
  }
}
