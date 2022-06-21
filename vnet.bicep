param location string = resourceGroup().location

var virtualNetworkName = 'bicep-vnet'
var subnet1Name = 'bicepSub-1'
var subnet2Name = 'bicepSub-2'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.171.0.0/24'
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: '10.171.0.0/26'
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: '10.171.0.64/26'
        }
      }
    ]
  }

  resource subnet1 'subnets' existing = {
    name: subnet1Name
  }

  resource subnet2 'subnets' existing = {
    name: subnet2Name
  }
}

output subnet1ResourceId string = virtualNetwork::subnet1.id
output subnet2ResourceId string = virtualNetwork::subnet2.id
