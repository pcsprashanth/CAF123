resource_group_name = "rg-we-connectivityvnet-internal"
route_tables = {
  route1 = {
    name                          = "snet-we-connectivityhubvnet-Internalrt"
    location = "West Europe"
    disable_bgp_route_propagation = "true"
    subnet_name                   = "snet-we-connectivityhubvnet-int-PE"
    vnet_name                     = "vnet-we-connectivityhub-internal"
    # networking_resource_group = "rg-core-sea-prod-build-01"

    routes = [
      {
        name                   = "route-internal"
        address_prefix         = "0.0.0.0/0"
        next_hop_type          = "VirtualAppliance"
        next_hop_in_ip_address = "xx.xx.1.4"
        azure_firewall_name    = null
      },
      {
        name                   = "route-external"
        address_prefix         = "xx.xxx.x.0/22"
        next_hop_type          = "VirtualAppliance"
        next_hop_in_ip_address = "xx.xxx.x.4"
        azure_firewall_name    = null
      }
    ]
  }
}