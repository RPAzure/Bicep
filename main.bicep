@description('Specifies the location for resources.')
param location string = 'canadacentral'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: 'mhc-dev-it-bicep-sa01'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

