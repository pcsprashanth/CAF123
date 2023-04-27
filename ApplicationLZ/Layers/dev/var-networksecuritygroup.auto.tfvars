resource_group_name = "[__resource_group_name__]"

network_security_groups = {
  nsg1 = {
    name                      = "nsg1"
    tags                      = { log_workspace = "[__log_analytics_workspace__]" }
    subnet_ids                  = ["/subscriptions/[__subscription_id__]/resourceGroups/[__networking_resource_group_name__]/providers/Microsoft.Network/virtualNetworks/[__virtual_network_name__]/subnets/loadbalancer"]
   
    security_rules = [
      {
        name                                         = "nsg"
        description                                  = "NSG"
        priority                                     = 101
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "*"
        source_address_prefixes                      = null
        destination_address_prefix                   = "*"
        destination_address_prefixes                 = null
        source_application_security_group_names      = null
        destination_application_security_group_names = null
      }
    ]
  },
  nsg2 = {
    name                      = "nsgsqlmi"
    tags                      = { }
    subnet_ids               = ["/subscriptions/[__subscription_id__]/resourceGroups/[__networking_resource_group_name__]/providers/Microsoft.Network/virtualNetworks/[__virtual_network_name__]/subnets/sqlmi"]

    security_rules = [
      {
        name                                         = "management"
        description                                  = "sql mi management nsg rules"
        priority                                     = 1100
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = null
        destination_port_ranges                      = ["9000", "9003", "1438", "1440", "1452"]
        source_address_prefix                        = "SqlManagement"
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.0.1.0/24" # Replace this address prefix with your SQL MI subnet address prefix
        destination_address_prefixes                 = null
        source_application_security_group_names      = null 
        destination_application_security_group_names = null 
      },
      {
        name                                         = "micorpnetsaw"
        description                                  = "corpnetsaw"
        priority                                     = 1110
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = null
        destination_port_ranges                      = ["9000","9003","1440"]
        source_address_prefix                        = "CorpNetSaw"
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.0.1.0/24" # Replace this address prefix with your SQL MI subnet address prefix
        destination_address_prefixes                 = null
        source_application_security_group_names      = null 
        destination_application_security_group_names = null 
      },
      {
        name                                         = "corpnetpublic"
        description                                  = "corpnetsaw"
        priority                                     = 1120
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = null
        destination_port_ranges                      = ["9000","9003"]
        source_address_prefix                        = "CorpNetPublic"
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.0.1.0/24" # Replace this address prefix with your SQL MI subnet address prefix
        destination_address_prefixes                 = null
        source_application_security_group_names      = null 
        destination_application_security_group_names = null 
      },
      {
        name                                         = "misubnet"
        description                                  = "mi subnet rules"
        priority                                     = 1200
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.0.1.0/24" # Replace this address prefix with your SQL MI subnet address prefix
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.0.1.0/24" # Replace this address prefix with your SQL MI subnet address prefix
        destination_address_prefixes                 = null
        source_application_security_group_names      = null 
        destination_application_security_group_names = null 
      },
      {
        name                                         = "health_probe"
        description                                  = "mi subnet rules"
        priority                                     = 1300
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "AzureLoadBalancer" 
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.0.1.0/24" # Replace this address prefix with your SQL MI subnet address prefix
        destination_address_prefixes                 = null
        source_application_security_group_names      = null 
        destination_application_security_group_names = null 
      },
      {
        name                                         = "management_outbound"
        description                                  = "mi subnet rules"
        priority                                     = 1100
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "TCP"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = null
        destination_port_ranges                      = ["443", "12000"]
        source_address_prefix                        = "10.0.1.0/24" # Replace this address prefix with your SQL MI subnet address prefix
        source_address_prefixes                      = null
        destination_address_prefix                   = "AzureCloud" 
        destination_address_prefixes                 = null
        source_application_security_group_names      = null 
        destination_application_security_group_names = null 
      },
      {
        name                                         = "mi_subnet_outbound"
        description                                  = "mi subnet rules"
        priority                                     = 1200
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        source_port_ranges                           = null
        destination_port_range                       = "*"
        destination_port_ranges                      = null
        source_address_prefix                        = "10.0.1.0/24" # Replace this address prefix with your SQL MI subnet address prefix
        source_address_prefixes                      = null
        destination_address_prefix                   = "10.0.1.0/24" # Replace this address prefix with your SQL MI subnet address prefix
        destination_address_prefixes                 = null
        source_application_security_group_names      = null 
        destination_application_security_group_names = null 
      },
    ]
  }
}

nsg_additional_tags = {
  iac          = "Terraform"
  env          = "dev"
  automated_by = ""
}