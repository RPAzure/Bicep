param location string = resourceGroup().location

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: 'bicepsa01'
  location: location
  sku: { 
name: 'Standard_LRS'
  }
  kind: 'StorageV2'
properties: {
  accessTier: 'Hot'
}
}
