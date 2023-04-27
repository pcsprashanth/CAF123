

vnet_peering = {
  peerInternal = {
    destination_vnet_name                 = "vnet-we-connectivityhub-internal"
    destination_vnet_rg                   = "rg-we-connectivityvnet-internal" #"[__resource_group_name__]"
    remote_destination_virtual_network_id = "/subscriptions/xxxxxxxxxxxxxxxxxxxxxxxx/resourceGroups/rg-we-connectivityvnet-internal/providers/Microsoft.Network/virtualNetworks/vnet-we-connectivityhub-internal"
    source_vnet_name                      = "vnet-we-idn-domaincontroller"
    source_vnet_rg                        = "rg-we-idn-vnet"
    allow_forwarded_traffic               = true
    allow_virtual_network_access          = true
    allow_gateway_transit                 = false
    use_remote_gateways                   = false
  }
  peerExternal = {
    destination_vnet_name                 = "vnet-we-connectivityhub-external"
    destination_vnet_rg                   = "rg-we-connectivityvnet-external" #"[__resource_group_name__]"
    remote_destination_virtual_network_id = "/subscriptions/xxxxxxxxxxxxxxxxxxxxxxxx/resourceGroups/rg-we-connectivityvnet-external/providers/Microsoft.Network/virtualNetworks/vnet-we-connectivityhub-external"
    source_vnet_name                      = "vnet-we-idn-domaincontroller"
    source_vnet_rg                        = "rg-we-idn-vnet" #"[__resource_group_name__]"    
    allow_forwarded_traffic               = true
    allow_virtual_network_access          = true
    allow_gateway_transit                 = false
    use_remote_gateways                   = false
  }
}


