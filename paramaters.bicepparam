using 'main.bicep'

param location = 'eastus'

param identityName = 'customMI'

param sku = {
  name: 'PremiumV2'
  tier: 'P1v2'
}

param kind = 'linux'

param appServiceName= 'myasp'




