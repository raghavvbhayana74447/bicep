@description('location')
param location string 

@description('sku info')
param sku object 

@description('kind of ASP')
param kind string 

@description('name of ASP')
param AspName string



resource appServicePlan 'Microsoft.Web/serverfarms@2024-11-01' = {
  kind: kind
  location: location
  name: AspName
  sku: {
        name: sku.name
        tier: sku.tier 
      }
  }

output appServicePlanId string = appServicePlan.id
