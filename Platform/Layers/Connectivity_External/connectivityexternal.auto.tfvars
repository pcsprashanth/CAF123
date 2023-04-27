resource_group_name = "rg-we-connectivityvnet-external"
location = "West Europe"
route_tables = {
  route1 = {
    name                          = "snet-we-connectivityhubvnet-appgwrt"
    location                      = "West Europe"
    disable_bgp_route_propagation = "true"
    subnet_name                   = "snet-we-connectivityhubvnet-ext-AppGateway"
    vnet_name                     = "vnet-we-connectivityhub-external"

    routes = [
      {
        name                   = "route-appgw"
        address_prefix         = "xx.xx.xx.0/27"
        next_hop_type          = "VirtualAppliance"
        next_hop_in_ip_address = "xx.xxx.x.4"
        azure_firewall_name    = null
      }
    ]
  }
}
public_ip_name = "pip-we-firewallip"

virtual_network_name = "vnet-we-connectivityhub-external"
 
application_gateway = {
  appgateway1 = {
      application_gateway_name = "agw-we-connectivityhub"
      zones = null
      subnet_name = "snet-we-connectivityhubvnet-ext-AppGateway"
      autoscale_configuration = [{
        min_capacity = 1
        max_capacity = 2
      }]
      backend_address_pool = [
      {
          backend_ip_addresses = ["xx.xx.xx.5"]
      }]
      backend_http_settings = [
      {
        path = "/"
        probe_name = "Http"
      }]
      probe = [
        {
        name = "Http"
        probe_host = "xx.xx.xx.5"
        probe_interval = 30
        probe_protocol = "Http"
        probe_path = "/"
        probe_timeout = 1
        probe_unhealthy_threshold = 2
        }]
    frontend_port = "443"
    firewall_mode = "Prevention"
  }
} 