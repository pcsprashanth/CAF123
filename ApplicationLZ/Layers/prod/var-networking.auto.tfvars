resource_group_name = "[__resource_group_name__]"
net_location        = null

virtual_networks = {
  virtualnetwork1 = {
    name                 = "[__virtual_network_name__]"
    address_space        = ["xx.xx.0.0/16"]
    dns_servers          = null
    ddos_protection_plan = null
  },
  virtualnetwork2 = {
    name                 = "jstartvmsecond"
    address_space        = ["xx.xx.0.0/16"]
    dns_servers          = null
    ddos_protection_plan = null
  }
}

vnet_peering = {}

subnets = {
  subnet1 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = "[__virtual_network_name__]"
    name              = "loadbalancer"
    address_prefixes  = ["xx.xx.1.0/24"]
    service_endpoints = ["Microsoft.Sql", "Microsoft.AzureCosmosDB"]
    pe_enable         = false
    delegation        = []
  },
  subnet2 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = "[__virtual_network_name__]"
    name              = "[__pe_snet_name__]"
    address_prefixes  = ["xx.xx.2.0/24"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  },
  subnet3 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = "[__virtual_network_name__]"
    name              = "application"
    address_prefixes  = ["xx.xx.3.0/24"]
    pe_enable         = false
    service_endpoints = ["Microsoft.Sql", "Microsoft.AzureCosmosDB"]
    delegation        = []
  },
  subnet4 = {
    vnet_key          = "virtualnetwork2"
    vnet_name         = "[__virtual_network_name__]"
    name              = "applicationgateway"
    address_prefixes  = ["xx.xx.0.0/24"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  },
  subnet5 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = "[__virtual_network_name__]"
    name              = "AzureFirewallSubnet"
    address_prefixes  = ["xx.xx.4.0/24"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  },
 subnet6 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = "[__virtual_network_name__]"
    name              = "proxy"
    address_prefixes  = ["xx.xx.5.0/24"]
    pe_enable         = true
    service_endpoints = null
    delegation        = []
  },
 subnet7 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = "[__virtual_network_name__]"
    name              = "aks"
    address_prefixes  = ["xx.xx.6.0/24"]
    service_endpoints = null
    pe_enable         = false
    delegation        = []
  },
 subnet8 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = "[__virtual_network_name__]"
    name              = "azfunction1"
    address_prefixes  = ["xx.xx.7.0/24"]
    service_endpoints = null
    pe_enable         = false
        delegation        = [
      {
        name = "delegation",
        service_delegation = [
          {
            name = "Microsoft.Web/serverFarms"
            actions = ["Microsoft.Network/virtualNetworks/subnets/action"] #az network vnet subnet list-available-delegations --resource-group jstart-dep-dev-dep011422 --query "[?serviceName=='Microsoft.Sql/managedInstances']"
          }
        ]
      }
    ]
  },  
 subnet9 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = "[__virtual_network_name__]"
    name              = "sqlmi"
    address_prefixes  = ["xx.xx.8.0/24"]
    service_endpoints = null
    pe_enable         = false
    delegation        = [
      {
        name = "delegation",
        service_delegation = [
          {
            name = "Microsoft.Sql/managedInstances"
            actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"] #az network vnet subnet list-available-delegations --resource-group jstart-dep-dev-dep011422 --query "[?serviceName=='Microsoft.Sql/managedInstances']"
          }
        ]
      }
    ]
  },

 subnet10 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = "[__virtual_network_name__]"
    name              = "appservice"
    address_prefixes  = ["xx.xx.9.0/24"]
    service_endpoints = null
    pe_enable         = false
    delegation        = [
      {
        name = "delegation",
        service_delegation = [
          {
            name = "Microsoft.Web/hostingEnvironments"
            actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"] 
          }
        ]
      }
    ]
  }
  subnet10 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = "[__virtual_network_name__]"
    name              = "appserviceenv"
    address_prefixes  = ["xx.xx.9.0/24"]
    service_endpoints = null
    pe_enable         = false
    delegation        = [
      {
        name = "delegation",
        service_delegation = [
          {
            name = "Microsoft.Web/hostingEnvironments"
            actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"] 
          }
        ]
      }
    ]
  }
}

net_additional_tags = {
  iac          = "Terraform"
  env          = "uat"
  automated_by = ""
}