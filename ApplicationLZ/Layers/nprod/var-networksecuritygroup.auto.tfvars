networking_resource_group = "rg-we-lznprd-dummy"
virtual_network_name = "vnet-we-lznprd-dummy"
net_location        = null

network_security_groups = {
  nsg1 = {
    name                      = "snet-we-lznprd-FE-nsg"
    tags                      = null
    subnet_name               = "snet-we-lznprd-FE"
    security_rules = [
      {
        name = "BastionInbound"
        description = "NSG"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        source_address_prefix = "xx.xx.3.0/25"
        destination_port_ranges = ["3389", "22"]
        destination_address_prefix = "*"
        source_port_ranges =  null
        destination_port_range = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      },
      {
        name                         = "BastionInbound"
        description                  = "NSG"
        priority                     = 100
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        source_address_prefix        = "xx.xx.3.0/25"
        destination_port_ranges      = ["3389", "22"]
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_range      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      // client to DC
      {
        name                         = "AD53DNSUDPDCInbound"
        description                  = "AD53DNSUDPDCInbound"
        priority                     = 150
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefixes      = ["DNS server IP(s)"]
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefix        = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosTCPDCInbound"
        description                  = "AD88KerberosTCPDCInbound"
        priority                     = 160
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefixes      = ["DNS server IP(s)"]
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefix        = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD135RPCTCPDCInbound"
        description                  = "AD135RPCTCPDCInbound"
        priority                     = 170
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "135"
        source_address_prefixes      = ["DNS server IP(s)"]
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefix        = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPTCPDCInbound"
        description                  = "AD389LDAPTCPDCInbound"
        priority                     = 180
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefixes      = ["DNS server IP(s)"]
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefix        = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD445SMBTCPDCInbound"
        description                  = "AD445SMBTCPDCInbound"
        priority                     = 190
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "445"
        source_address_prefixes      = ["DNS server IP(s)"]
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefix        = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD4915265535TCPDCInbound"
        description                  = "AD4915265535TCPDCInbound"
        priority                     = 200
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefixes      = ["DNS server IP(s)"]
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefix        = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD4915265535UDPDCInbound"
        description                  = "AD4915265535UDPDCInbound"
        priority                     = 210
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefixes      = ["DNS server IP(s)"]
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefix        = null
        destination_address_prefixes = null
      },
      {
        name                         = "ADPingtoDCInbound"
        description                  = "ADPingtoDCInbound"
        priority                     = 220
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Icmp"
        source_port_range            = "*"
        destination_port_range       = "*"
        source_address_prefixes      = ["DNS server IP(s)"]
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefix        = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD53DNSUDPDCOutbound"
        description                  = "AD53DNSUDPDCOutbound"
        priority                     = 151
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "*"
        destination_address_prefixes = ["DNS server IP(s)"]
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefix   = null
      },
      {
        name                         = "AD88KerberosTCPDCOutbound"
        description                  = "AD88KerberosTCPDCOutbound"
        priority                     = 161
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "*"
        destination_address_prefixes = ["DNS server IP(s)"]
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefix   = null
      },
      {
        name                         = "AD135RPCTCPDCOutbound"
        description                  = "AD135RPCTCPDCOutbound"
        priority                     = 171
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "135"
        source_address_prefix        = "*"
        destination_address_prefixes = ["DNS server IP(s)"]
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefix   = null
      },
      {
        name                         = "AD389LDAPTCPDCOutbound"
        description                  = "AD389LDAPTCPDCOutbound"
        priority                     = 181
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "*"
        destination_address_prefixes = ["DNS server IP(s)"]
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefix   = null
      },
      {
        name                         = "AD445SMBTCPDCOutbound"
        description                  = "AD445SMBTCPDCOutbound"
        priority                     = 191
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "445"
        source_address_prefix        = "*"
        destination_address_prefixes = ["DNS server IP(s)"]
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefix   = null
      },
      {
        name                         = "AD4915265535TCPDCOutbound"
        description                  = "AD4915265535TCPDCOutbound"
        priority                     = 201
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "*"
        destination_address_prefixes = ["DNS server IP(s)"]
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefix   = null
      },
      {
        name                         = "AD4915265535UDPDCOutbound"
        description                  = "AD4915265535UDPDCOutboun"
        priority                     = 211
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "*"
        destination_address_prefixes = ["DNS server IP(s)"]
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefix   = null
      },
      {
        name                         = "ADPingtoDCOutbound"
        description                  = "ADPingtoDCOutbound"
        priority                     = 221
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Icmp"
        source_port_range            = "*"
        destination_port_range       = "*"
        source_address_prefix        = "*"
        destination_address_prefixes = ["DNS server IP(s)"]
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefix   = null
      }
    ]
  },
  nsg2 = {
    name                      = "snet-we-lznprd-DB-nsg"
    tags                      = null
    subnet_name               = "snet-we-lznprd-DB"
    security_rules = [
      {
        name = "BastionInbound"
        description = "NSG"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        source_address_prefix = "xx.xx.3.0/25"
        destination_port_ranges = ["3389", "22"]
        destination_address_prefix = "*"
        source_port_ranges =  null
        destination_port_range = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      }
    ]
  },
    nsg3 = {
    name                      = "snet-we-lznprd-PE-nsg"
    tags                      = null
    subnet_name               = "snet-we-lznprd-PE"
    security_rules = [
      {
        name = "BastionInbound"
        description = "NSG"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        source_address_prefix = "xx.xx.3.0/25"
        destination_port_ranges = ["3389", "22"]
        destination_address_prefix = "*"
        source_port_ranges =  null
        destination_port_range = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      }
    ]
  },
    nsg4 = {
    name                      = "snet-we-lznprd-MW-nsg"
    tags                      = null
    subnet_name               = "snet-we-lznprd-MW"
    security_rules = [
      {
        name = "BastionInbound"
        description = "NSG"
        priority = 100
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        source_address_prefix = "xx.xx.3.0/25"
        destination_port_ranges = ["3389", "22"]
        destination_address_prefix = "*"
        source_port_ranges =  null
        destination_port_range = null
        source_address_prefixes                      = null
        destination_address_prefixes                 = null
      }
    ]
  },
}

nsg_additional_tags = {
  iac          = "Terraform"
  env          = "nprod"
  automated_by = ""
}
