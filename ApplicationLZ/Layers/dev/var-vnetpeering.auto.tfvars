#resource_group_name =  "[__resource_group_name__]"

vnet_peering = {
  peerInternal = {
    #shared_subscription                   = sub-con-02
    destination_vnet_name                 = "vnet-we-connectivityhub-internal"
    destination_vnet_rg                   = "rg-we-connectivityvnet-internal" #"[__resource_group_name__]"
    remote_destination_virtual_network_id = "/subscriptions/xxxxxxxxxxxxxxxxxxxxxxxx/resourceGroups/rg-we-connectivityvnet-internal/providers/Microsoft.Network/virtualNetworks/vnet-we-connectivityhub-internal"
    source_vnet_name                      = "spoke1"
    source_vnet_rg                        = "app1"
   #remote_source_virtual_network_id      = module.networking.map_vnets.virtualnetwork1.id
    allow_forwarded_traffic               = true
    allow_virtual_network_access          = true
    allow_gateway_transit                 = true
    use_remote_gateways                   = true
  }
  peerExternal = {
    #shared_subscription                   = sub-con-01
    destination_vnet_name                 = "vnet-we-connectivityhub-externalternal"
    destination_vnet_rg                   = "rg-we-connectivityvnet-external" #"[__resource_group_name__]"
    remote_destination_virtual_network_id = "/subscriptions/xxxxxxxxxxxxxxxxxxxxxxxx/resourceGroups/rg-we-connectivityvnet-external/providers/Microsoft.Network/virtualNetworks/vnet-we-connectivityhub-external"
    source_vnet_name                      = "spoke1"
    source_vnet_rg                        = "app1" #"[__resource_group_name__]"
    #remote_source_virtual_network_id      = module.networking.map_vnets.virtualnetwork1.id
    allow_forwarded_traffic               = true
    allow_virtual_network_access          = true
    allow_gateway_transit                 = false
    use_remote_gateways                   = false
  }
}

/*
destination_vnet_subscription_id = {
  #Internal = {
    #subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxx"
  #}
  sub-con-01 = {
    subscription_id ="xxxxxxxxxxxxxxxxxxxxxxxx"
  }
}

vnet_peering = {
  peer1 = {
    destination_vnet_name        = "jstartvmsecond"
    destination_vnet_rg          = "jumpstart-windows-vm-eastus2"
    source_vnet_name             = "jstartvmfirst"
    source_vnet_rg               = "jumpstart-windows-vm-eastus2"
    allow_forwarded_traffic      = true
    allow_virtual_network_access = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }
}
*/
#destination_vnet_subscription_id = "xxxxxxxxxxxxxxxxxxxxxxxx"
