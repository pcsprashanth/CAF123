networking_resource_group = "rg-we-connectivityvnet-internal"
virtual_network_name = "vnet-we-connectivityhub-internal"

network_security_groups = {
  nsg1 = {
    name                      = "snet-we-connectivityhubvnet-int-ado-self-hosted-nsg"
    tags                      = null
    subnet_name               = "snet-we-connectivityhubvnet-int-ado-self-hosted"
    security_rules = [
      # {
      #   name                                         = "AllowCidrBlockRDPInbound"
      #   description                                  = "NSG"
      #   priority                                     = 100
      #   direction                                    = "Inbound"
      #   access                                       = "Allow"
      #   protocol                                     = "Tcp"
      #   source_port_range                            = "*"
      #   destination_port_range                       = "3389"
      #   source_address_prefix                        = "xx.xx.xx.xx"
      #   destination_address_prefix                   = "*"
      # }
    ]
  },
  nsg2 = {
    name                      = "snet-we-connectivityhubvnet-int-PE-nsg"
    tags                      = null
    subnet_name               = "snet-we-connectivityhubvnet-int-PE"
    security_rules = [
      # {
      #   name                                         = "AllowCidrBlockRDPInbound"
      #   description                                  = "NSG"
      #   priority                                     = 100
      #   direction                                    = "Inbound"
      #   access                                       = "Allow"
      #   protocol                                     = "Tcp"
      #   source_port_range                            = "*"
      #   destination_port_range                       = "3389"
      #   source_address_prefix                        = "xx.xx.xx.xx"
      #   destination_address_prefix                   = "*"
      # }
    ]
  },
    nsg3 = {
    name                      = "AzureBastionSubnet-nsg"
    tags                      = null
    subnet_name               = "AzureBastionSubnet"
    security_rules = [
      {
        name                                         = "AllowHttpsInbound"
        description                                  = "Allow HTTPS traffic"
        priority                                     = 100
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        destination_port_range                       = "443"
        source_address_prefix                        = "Internet"
        destination_address_prefix                   = "*"
        source_port_ranges                           = null
        destination_port_ranges                      = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      },
      {
        name                                         = "AllowGatewayManagerInbound"
        description                                  = "AllowGatewayManagerInbound"
        priority                                     = 110
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        destination_port_range                       = "443"
        source_address_prefix                        = "GatewayManager"
        destination_address_prefix                   = "*"
        source_port_ranges                           = null
        destination_port_ranges                      = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      },
      {
        name                                         = "AllowAzureLoadBalancerInbound"
        description                                  = "AllowAzureLoadBalancerInbound"
        priority                                     = 120
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        destination_port_range                       = "443"
        source_address_prefix                        = "AzureLoadBalancer"
        destination_address_prefix                   = "*"
        source_port_ranges                           = null
        destination_port_ranges                      = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      },
      {
        name                                         = "AllowBastionHostCommunicationIn"
        description                                  = "AllowBastionHostCommunicationIn"
        priority                                     = 130
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        destination_port_ranges                       = ["8080","5701"]
        source_address_prefix                        = "VirtualNetwork"
        destination_address_prefix                   = "VirtualNetwork"
        source_port_ranges                           = null
        destination_port_range                      = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      },
      {
        name                                         = "DenyAllInBound"
        description                                  = "DenyAllInBound"
        priority                                     = 1000
        direction                                    = "Inbound"
        access                                       = "Deny"
        protocol                                     = "*"
        source_port_range                            = "*"
        destination_port_ranges                       = null
        source_address_prefix                        = "*"
        destination_address_prefix                   = "*"
        source_port_ranges                           = null
        destination_port_range                      = "*"
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      },
      {
        name                                         = "AllowSshRDPOutbound"
        description                                  = "AllowSshRDPOutbound"
        priority                                     = 100
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        destination_port_ranges                       = ["22","3389"]
        source_address_prefix                        = "*"
        destination_address_prefix                   = "VirtualNetwork"
        source_port_ranges                           = null
        destination_port_range                      = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      },
      {
        name                                         = "AllowAzureCloudOutbound"
        description                                  = "AllowAzureCloudOutbound"
        priority                                     = 110
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        destination_port_range                       = "443"
        source_address_prefix                        = "*"
        destination_address_prefix                   = "AzureCloud"
        source_port_ranges                           = null
        destination_port_ranges                      = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      },
      {
        name                                         = "AllowBastionCommunicationOut"
        description                                  = "AllowBastionCommunicationOut"
        priority                                     = 120
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        destination_port_ranges                       = ["8080","5701"]
        source_address_prefix                        = "VirtualNetwork"
        destination_address_prefix                   = "VirtualNetwork"
        source_port_ranges                           = null
        destination_port_range                      = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      },
      {
        name                                         = "AllowGetSessionInformation"
        description                                  = "AllowGetSessionInformation"
        priority                                     = 130
        direction                                    = "Outbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        destination_port_range                       =  null
        source_address_prefix                        = "*"
        destination_address_prefix                   = "Internet"
        source_port_ranges                           = null
        destination_port_ranges                      = ["80","443"]
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      },
      {
        name                                         = "DenyAllOutBound"
        description                                  = "DenyAllOutBound"
        priority                                     = 1000
        direction                                    = "Outbound"
        access                                       = "Deny"
        protocol                                     = "*"
        source_port_range                            = "*"
        destination_port_range                       = "*"
        source_address_prefix                        = "*"
        destination_address_prefix                   = "*"
        source_port_ranges                           = null
        destination_port_ranges                      = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      }
    ]
  },
}

nsg_additional_tags = {
  iac          = "Terraform"
  env          = "prod"
  automated_by = ""
}
