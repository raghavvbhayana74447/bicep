param location string
param identityName string 


resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2025-01-31-preview' = {
  location: location
  name: identityName 
}


output managedIdentityId string = managedIdentity.id 
