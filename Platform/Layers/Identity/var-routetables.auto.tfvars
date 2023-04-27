# resource_group_name = "rg-we-idn-vnet"
route_tables = {
  route1 = {
    name                          = "snet-we-connectivityhubvnet-dcrt"
    location = "West Europe"
    disable_bgp_route_propagation = "true"
    subnet_name                   = "snet-we-idn-DC"
    vnet_name                     = "vnet-we-idn-domaincontroller"
    routes = [
      {
        name                   = "route-internal"
        address_prefix         = "0.0.0.0/0"
        next_hop_type          = "VirtualAppliance"
        next_hop_in_ip_address = "xx.xx.1.4"
        azure_firewall_name    = null
      }
    ]
  }
}