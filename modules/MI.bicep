param identityName string
param location string 

resource userAssignedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2025-01-31-preview' = {
  name: identityName
  location: location
}
output identityId string = userAssignedIdentity.id
