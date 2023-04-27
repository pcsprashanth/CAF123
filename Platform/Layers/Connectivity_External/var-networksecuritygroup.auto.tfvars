networking_resource_group = "rg-we-connectivityvnet-external"
virtual_network_name = "vnet-we-connectivityhub-external"

network_security_groups = {
  # nsg1 = {
  #   name                      = "AzureFirewallSubnet-nsg"
  #   tags                      = null
  #   subnet_name               = "AzureFirewallSubnet"
  #   security_rules = [
  #     # {
  #     #   name                                         = "AllowCidrBlockRDPInbound"
  #     #   description                                  = "NSG"
  #     #   priority                                     = 100
  #     #   direction                                    = "Inbound"
  #     #   access                                       = "Allow"
  #     #   protocol                                     = "Tcp"
  #     #   source_port_range                            = "*"
  #     #   destination_port_range                       = "3389"
  #     #   source_address_prefix                        = "xx.xx.xx.xx"
  #     #   destination_address_prefix                   = "*"
  #     # }
  #   ]
  # },
  nsg2 = {
    name                      = "snet-we-connectivityhubvnet-ext-PE-nsg"
    tags                      = null
    subnet_name               = "snet-we-connectivityhubvnet-ext-PE"
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
    name                      = "snet-we-connectivityhubvnet-ext-AppGateway-nsg"
    tags                      = null
    subnet_name               = "snet-we-connectivityhubvnet-ext-AppGateway"
    security_rules = [
      {
        name                                         = "AllowTrafficforAppGW"
        description                                  = "AppGW needs incoming internet traffic on ports 65200 - 65535"
        priority                                     = 100
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "*"
        source_port_range                            = "*"
        destination_port_range                       = "65200-65535"
        source_address_prefix                        = "*"
        destination_address_prefix                   = "*"
        source_port_ranges                           = null
        destination_port_ranges                      = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      },
      {
        name                                         = "AllowHTTPTraffic"
        description                                  = "Allow HTTP traffic"
        priority                                     = 110
        direction                                    = "Inbound"
        access                                       = "Allow"
        protocol                                     = "Tcp"
        source_port_range                            = "*"
        destination_port_range                       = "80"
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
