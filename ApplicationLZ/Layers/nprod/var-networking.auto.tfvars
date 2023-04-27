resource_group_name = "rg-we-lznprd-dummy"
net_location        = null

virtual_networks = {
  virtualnetwork1 = {
    name                 = "vnet-we-lznprd-dummy"
    address_space        = ["xx.xx.xx.0/24"]
    dns_servers          = ["DNS server IP(s)"]
    ddos_protection_plan = null
  }
  
}

vnet_peering = {}

subnets = {
  subnet1 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null 
    name              = "snet-we-lznprd-FE"
    address_prefixes  = ["xx.xx.xx.0/27"]
    service_endpoints = null
    pe_enable         = false
    delegation        = []
  },
  subnet2 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null 
    name              = "snet-we-lznprd-DB"
    address_prefixes  = ["xx.xx.xx.32/27"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  },
  subnet3 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null 
    name              = "snet-we-lznprd-PE"
    address_prefixes  = ["xx.xx.xx.64/27"]
    pe_enable         = false
    service_endpoints = null
    delegation        = []
  },
    subnet4 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = null 
    name              = "snet-we-lznprd-MW"
    address_prefixes  = ["xx.xx.xx.96/27"]
    pe_enable         = false
    service_endpoints = null
    delegation        = []
  }
}

net_additional_tags = {
  iac = "Terraform"
  env = "nprod"
}