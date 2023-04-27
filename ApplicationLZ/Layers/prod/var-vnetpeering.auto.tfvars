#resource_group_name =  "[__resource_group_name__]"

vnet_peering = {
  peer1 = {
    destination_vnet_name                 = "jstartvmsecond"
    destination_vnet_rg                   = "jstart-vm-dev-07232021" #"[__resource_group_name__]"
    remote_destination_virtual_network_id = "/subscriptions/[__subscription_id__]/resourceGroups/jstart-vm-dev-07232021/providers/Microsoft.Network/virtualNetworks/jstartvmsecond"
    source_vnet_name                      = "virtualnetwork1"
    source_vnet_rg                        = "jstart-vm-dev-07162021mt" #"[__resource_group_name__]"
    remote_source_virtual_network_id      = "/subscriptions/[__subscription_id__]/resourceGroups/jstart-vm-dev-07162021mt/providers/Microsoft.Network/virtualNetworks/virtualnetwork1"
    allow_forwarded_traffic               = true
    allow_virtual_network_access          = true
    allow_gateway_transit                 = false
    use_remote_gateways                   = false
  }
}

destination_vnet_subscription_id = "[__subscription_id__]"
