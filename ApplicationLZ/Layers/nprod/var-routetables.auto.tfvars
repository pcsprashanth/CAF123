resource_group_name = "rg-we-lznprd-dummy"
route_tables = {
  route1 = {
    name                          = "snet-we-connectivityhubvnet-workloadrt"
    location = "West Europe"
    disable_bgp_route_propagation = "true"
    subnet_name                   = "snet-we-lznprd-FE"
    vnet_name                     = "vnet-we-lznprd-dummy"
    # networking_resource_group = "rg-core-sea-prod-build-01"

    routes = [
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