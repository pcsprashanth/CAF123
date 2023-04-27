resource_group_name = "[__resource_group_name__]"
net_location        = null

virtual_networks = {
  virtualnetwork1 = {
    name                 = "vnet-we-idn-domaincontroller"
    address_space        = ["xx.xx.xx.0/24"]
    dns_servers          = ["DNS SERVER IPS"]
    ddos_protection_plan = null
  }

}

vnet_peering = {}

subnets = {
  subnet1 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null #jstartvmssfirst
    name              = "snet-we-idn-DC"
    address_prefixes  = ["xx.xx.xx.0/27"]
    service_endpoints = []
    pe_enable         = false
    delegation        = []
  },
  subnet2 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null #jstartvmssfirst
    name              = "snet-we-idn-AAD-connect"
    address_prefixes  = ["xx.xx.xx.32/27"]
    service_endpoints = []
    pe_enable         = false
    delegation        = []
  },
  subnet3 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null #jstartvmssfirst
    name              = "snet-we-idn-PE"
    address_prefixes  = ["xx.xx.xx.64/27"]
    service_endpoints = []
    pe_enable         = false
    delegation        = []
  },
}

net_additional_tags = {
  iac = "Terraform"
  env = "DEV"
}