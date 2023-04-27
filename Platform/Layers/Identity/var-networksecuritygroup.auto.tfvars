resource_group_name       = "[__resource_group_name__]"
networking_resource_group = "rg-we-idn-vnet"
virtual_network_name      = "vnet-we-idn-domaincontroller"
net_location              = null

network_security_groups = {
  nsg1 = {
    name        = "snet-we-idn-domaincontroller-DC-nsg"
    tags        = null
    subnet_name = "snet-we-idn-DC"
    # subnet_key                = "subnet1"
    # networking_resource_group = "rg-we-idn-vnet"
    security_rules = [
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
      {
        name                         = "ADPingtoDCInbound"
        description                  = "ADPingtoDCInbound"
        priority                     = 220
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Icmp"
        source_port_range            = "*"
        destination_port_range       = "*"
        source_address_prefixes      = null
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefix        = "*"
        destination_address_prefixes = null
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
        destination_address_prefixes = null
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefix   = "*"
      }
      /*
      {
        name                         = "AD53DNSTCPDC1Inbound"
        description                  = "AD53DNSTCPDC1Inbound"
        priority                     = 151
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosTCPDC1Inbound1"
        description                  = "AD88KerberosTCPDC1Inbound1"
        priority                     = 161
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD135RPCTCPDC1Inbound1"
        description                  = "AD135RPCTCPDC1Inbound1"
        priority                     = 173
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "135"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPTCPDC1Inbound"
        description                  = "AD389LDAPTCPDC1Inbound"
        priority                     = 181
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD445SMBTCPDC1Inbound"
        description                  = "AD445SMBTCPDC1Inbound"
        priority                     = 191
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "445"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD49152-65535TCPDC1Inbound1"
        description                  = "AD49152-65535TCPDC1Inbound1"
        priority                     = 201
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD49152-65535UDPDC1Inbound1"
        description                  = "AD49152-65535UDPDC1Inbound1"
        priority                     = 211
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "ADPingtoDC-1Inbound"
        description                  = "ADPingtoDC-1Inbound"
        priority                     = 221
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Icmp"
        source_port_range            = "*"
        destination_port_range       = "*"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD53DNSUDP-DC1Outbound"
        description                  = "AD53DNSUDP-DC1Outbound"
        priority                     = 151
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosTCPDC1Outbound1"
        description                  = "AD88KerberosTCPDC1Outbound1"
        priority                     = 161
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD135RPCTCPDC1Outbound"
        description                  = "AD135RPCTCPDC1Outbound"
        priority                     = 171
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "135"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPTCPDC1Outbound"
        description                  = "AD389LDAPTCPDC1Outbound"
        priority                     = 181
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD445SMBTCPDC1Outbound"
        description                  = "AD445SMBTCPDC1Outbound"
        priority                     = 191
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "445"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD49152-65535TCPDC1Outbound"
        description                  = "AD49152-65535TCPDC1Outbound"
        priority                     = 201
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD49152-65535UDPDC1Outbound"
        description                  = "AD49152-65535UDPDC1Outbound"
        priority                     = 211
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "ADPingtoDC-1Outbound"
        description                  = "ADPingtoDC-1Outbound"
        priority                     = 221
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Icmp"
        source_port_range            = "*"
        destination_port_range       = "*"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD53DNSTCPDC2Inbound"
        description                  = "AD53DNSTCPDC2Inbound"
        priority                     = 152
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosTCPDC2Inbound1"
        description                  = "AD88KerberosTCPDC2Inbound1"
        priority                     = 162
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD135RPCTCPDC2Inbound"
        description                  = "AD135RPCTCPDC2Inbound"
        priority                     = 172
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "135"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPTCPDC2Inbound"
        description                  = "AD389LDAPTCPDC2Inbound"
        priority                     = 182
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD445SMBTCPDC2Inbound"
        description                  = "AD445SMBTCPDC2Inbound"
        priority                     = 192
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "445"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD49152-65535TCPDC2Inbound1"
        description                  = "AD49152-65535TCPDC2Inbound1"
        priority                     = 202
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD49152-65535UDPDC2Inbound"
        description                  = "AD49152-65535UDPDC2Inbound"
        priority                     = 212
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "ADPingtoDC-2Inbound"
        description                  = "ADPingtoDC-2Inbound"
        priority                     = 222
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Icmp"
        source_port_range            = "*"
        destination_port_range       = "*"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD53DNSUDPDC2Outbound"
        description                  = "AD53DNSUDPDC2Outbound"
        priority                     = 152
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosTCPDC2Outbound1"
        description                  = "AD88KerberosTCPDC2Outbound1"
        priority                     = 162
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD135RPCTCPDC2Outbound"
        description                  = "AD135RPCTCPDC2Outbound"
        priority                     = 172
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "135"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPTCPDC2Outbound"
        description                  = "AD389LDAPTCPDC2Outbound"
        priority                     = 182
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD445SMBTCPDC2Outbound"
        description                  = "AD445SMBTCPDC2Outbound"
        priority                     = 192
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "445"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD49152-65535TCPDC2Outbound"
        description                  = "AD49152-65535TCPDC2Outbound"
        priority                     = 202
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD49152-65535UDPDC2Outbound"
        description                  = "AD49152-65535UDPDC2Outbound"
        priority                     = 212
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "ADPingtoDC-2Outbound"
        description                  = "ADPingtoDC-2Outbound"
        priority                     = 222
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Icmp"
        source_port_range            = "*"
        destination_port_range       = "*"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD53DNSTCPDC1Inbound1"
        description                  = "AD53DNSTCPDC1Inbound1"
        priority                     = 101
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD53DNSUDP-DC1Inbound"
        description                  = "AD53DNSUDP-DC1Inbound"
        priority                     = 111
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosTCPDC1Inbound2"
        description                  = "AD88KerberosTCPDC1Inbound2"
        priority                     = 121
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosUDPDC1Inbound"
        description                  = "AD88KerberosUDPDC1Inbound"
        priority                     = 131
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD123W32TimeUDPDC1Inbound"
        description                  = "AD123W32TimeUDPDC1Inbound"
        priority                     = 141
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "123"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD135RPCTCPDC1Inbound"
        description                  = "AD135RPCTCPDC1Inbound"
        priority                     = 153
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "135"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD137-138NetLogonUDPDC1Inbound"
        description                  = "AD137-138NetLogonUDPDC1Inbound"
        priority                     = 163
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "137-138"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD139NetLogonTCPDC1Inbound"
        description                  = "AD139NetLogonTCPDC1Inbound"
        priority                     = 171
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "139"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPTCPDC1Inbound1"
        description                  = "AD389LDAPTCPDC1Inbound1"
        priority                     = 183
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPUDPDC1Inbound"
        description                  = "AD389LDAPUDPDC1Inbound"
        priority                     = 193
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD445SMBTCPDC1Inbound1"
        description                  = "AD445SMBTCPDC1Inbound1"
        priority                     = 203
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "445"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD464KerberosAuthenticationTCPDC1Inbound"
        description                  = "AD464KerberosAuthenticationTCPDC1Inbound"
        priority                     = 213
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "464"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD464KerberosAuthenticationUDPDC1Inbound"
        description                  = "AD464KerberosAuthenticationUDPDC1Inbound"
        priority                     = 223
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "464"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD636LDAPSSLTCPDC1Inbound"
        description                  = "AD636LDAPSSLTCPDC1Inbound"
        priority                     = 231
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "636"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD3268-3269LDAPGCTCPDC1Inbound"
        description                  = "AD3268-3269LDAPGCTCPDC1Inbound"
        priority                     = 241
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "3268-3269"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD49152-65535TCPDC1Inbound"
        description                  = "AD49152-65535TCPDC1Inbound"
        priority                     = 251
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD49152-65535UDPDC1Inbound"
        description                  = "AD49152-65535UDPDC1Inbound"
        priority                     = 261
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "ADPingtoDC-1Inbound1"
        description                  = "ADPingtoDC-1Inbound1"
        priority                     = 271
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Icmp"
        source_port_range            = "*"
        destination_port_range       = "*"
        source_address_prefix        = "xx.xx.xx.4"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD53DNSTCPDC1Outbound"
        description                  = "AD53DNSTCPDC1Outbound"
        priority                     = 101
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD53DNSUDPDC1Outbound"
        description                  = "AD53DNSUDPDC1Outbound"
        priority                     = 111
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosTCPDC1Outbound"
        description                  = "AD88KerberosTCPDC1Outbound"
        priority                     = 121
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosUDPDC1Outbound"
        description                  = "AD88KerberosUDPDC1Outbound"
        priority                     = 131
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD123W32TimeUDPDC1Outbound"
        description                  = "AD123W32TimeUDPDC1Outbound"
        priority                     = 141
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "123"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD135RPCTCPDC1Outbound1"
        description                  = "AD135RPCTCPDC1Outbound1"
        priority                     = 153
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "135"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD137-138NetLogonUDPDC1Outbound"
        description                  = "AD137-138NetLogonUDPDC1Outbound"
        priority                     = 163
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "137-138"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD139NetLogonTCPDC1Outbound"
        description                  = "AD139NetLogonTCPDC1Outbound"
        priority                     = 173
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "139"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPTCPDC1Outbound1"
        description                  = "AD389LDAPTCPDC1Outbound1"
        priority                     = 183
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPUDPDC1Outbound"
        description                  = "AD389LDAPUDPDC1Outbound"
        priority                     = 193
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD445SMBTCPDC1Outbound1"
        description                  = "AD445SMBTCPDC1Outbound1"
        priority                     = 203
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "445"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD464KerberosAuthenticationenticationTCPDC1Outbound"
        description                  = "AD464KerberosAuthenticationenticationTCPDC1Outbound"
        priority                     = 213
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "464"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD464KerberosAuthenticationenticationUDPDC1Outbound"
        description                  = "AD464KerberosAuthenticationenticationUDPDC1Outbound"
        priority                     = 223
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "464"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD636LDAPSSLTCPDC1Outbound"
        description                  = "AD636LDAPSSLTCPDC1Outbound"
        priority                     = 231
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "636"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.4"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD53DNSTCPDC2Inbound1"
        description                  = "AD53DNSTCPDC2Inbound1"
        priority                     = 102
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD53DNSUDPDC2Inbound"
        description                  = "AD53DNSUDPDC2Inbound"
        priority                     = 112
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosTCPDC2Inbound"
        description                  = "AD88KerberosTCPDC2Inbound"
        priority                     = 122
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosUDPDC2Inbound"
        description                  = "AD88KerberosUDPDC2Inbound"
        priority                     = 132
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD123W32TimeUDPDC2Inbound"
        description                  = "AD123W32TimeUDPDC2Inbound"
        priority                     = 142
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "123"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD135RPCTCPDC2Inbound1"
        description                  = "AD135RPCTCPDC2Inbound1"
        priority                     = 154
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "135"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD137-138NetLogonUDPDC2Inbound"
        description                  = "AD137-138NetLogonUDPDC2Inbound"
        priority                     = 164
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "137-138"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD139NetLogonTCPDC2Inbound"
        description                  = "AD139NetLogonTCPDC2Inbound"
        priority                     = 174
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "139"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPTCPDC2Inbound1"
        description                  = "AD389LDAPTCPDC2Inbound1"
        priority                     = 184
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPUDPDC2Inbound"
        description                  = "AD389LDAPUDPDC2Inbound"
        priority                     = 194
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD445SMBTCPDC2Inbound1"
        description                  = "AD445SMBTCPDC2Inbound1"
        priority                     = 204
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "445"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD464KerberosAuthenticationenticationTCPDC2Inbound"
        description                  = "AD464KerberosAuthenticationenticationTCPDC2Inbound"
        priority                     = 214
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "464"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD464KerberosAuthenticationenticationUDPDC2Inbound"
        description                  = "AD464KerberosAuthenticationenticationUDPDC2Inbound"
        priority                     = 225
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "464"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD636LDAPSSLTCPDC2Inbound"
        description                  = "AD636LDAPSSLTCPDC2Inbound"
        priority                     = 232
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "636"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD3268-3269LDAPGCTCPDC2Inbound"
        description                  = "AD3268-3269LDAPGCTCPDC2Inbound"
        priority                     = 242
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "3268-3269"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD49152-65535TCPDC2Inbound"
        description                  = "AD49152-65535TCPDC2Inbound"
        priority                     = 252
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD49152-65535UDPDC2Inbound1"
        description                  = "AD49152-65535UDPDC2Inbound1"
        priority                     = 262
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "49152-65535"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "ADPingtoDC-2Inbound1"
        description                  = "ADPingtoDC-2Inbound1"
        priority                     = 272
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Icmp"
        source_port_range            = "*"
        destination_port_range       = "*"
        source_address_prefix        = "xx.xx.xx.5"
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD53DNSTCPDC2Outbound"
        description                  = "AD53DNSTCPDC2Outbound"
        priority                     = 102
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD53DNSUDPDC2Outbound1"
        description                  = "AD53DNSUDPDC2Outbound1"
        priority                     = 112
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "53"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosTCPDC2Outbound"
        description                  = "AD88KerberosTCPDC2Outbound"
        priority                     = 122
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD88KerberosUDPDC2Outbound"
        description                  = "AD88KerberosUDPDC2Outbound"
        priority                     = 132
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "88"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD123W32TimeUDPDC2Outbound"
        description                  = "AD123W32TimeUDPDC2Outbound"
        priority                     = 142
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "123"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD135RPCTCPDC2Outbound1"
        description                  = "AD135RPCTCPDC2Outbound1"
        priority                     = 154
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "135"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD137-138NetLogonUDPDC2Outbound"
        description                  = "AD137-138NetLogonUDPDC2Outbound"
        priority                     = 164
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "137-138"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD139NetLogonTCPDC2Outbound"
        description                  = "AD139NetLogonTCPDC2Outbound"
        priority                     = 174
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "139"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPTCPDC2Outbound1"
        description                  = "AD389LDAPTCPDC2Outbound1"
        priority                     = 184
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD389LDAPUDPDC2Outbound"
        description                  = "AD389LDAPUDPDC2Outbound"
        priority                     = 194
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "389"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD445SMBTCPDC2Outbound1"
        description                  = "AD445SMBTCPDC2Outbound1"
        priority                     = 204
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "445"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD464KerberosAuthenticationenticationTCPDC2Outbound"
        description                  = "AD464KerberosAuthenticationenticationTCPDC2Outbound"
        priority                     = 214
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "464"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD464KerberosAuthenticationenticationUDPDC2Outbound"
        description                  = "AD464KerberosAuthenticationenticationUDPDC2Outbound"
        priority                     = 225
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Udp"
        source_port_range            = "*"
        destination_port_range       = "464"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },
      {
        name                         = "AD636LDAPSSLTCPDC2Outbound"
        description                  = "AD636LDAPSSLTCPDC2Outbound"
        priority                     = 232
        direction                    = "Outbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        destination_port_range       = "636"
        source_address_prefix        = "*"
        destination_address_prefix   = "xx.xx.xx.5"
        source_port_ranges           = null
        destination_port_ranges      = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      },*/
      # // client to DC
      # {
      #   name                         = "AD53DNSUDPDCInbound"
      #   description                  = "AD53DNSUDPDCInbound"
      #   priority                     = 150
      #   direction                    = "Inbound"
      #   access                       = "Allow"
      #   protocol                     = "Udp"
      #   source_port_range            = "*"
      #   destination_port_range       = "53"
      #   source_address_prefixes      = ["DNS SERVER IPS"]
      #   destination_address_prefix   = "*"
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefix        = null
      #   destination_address_prefixes = null
      # },
      # {
      #   name                         = "AD88KerberosTCPDCInbound"
      #   description                  = "AD88KerberosTCPDCInbound"
      #   priority                     = 160
      #   direction                    = "Inbound"
      #   access                       = "Allow"
      #   protocol                     = "Tcp"
      #   source_port_range            = "*"
      #   destination_port_range       = "88"
      #   source_address_prefixes      = ["DNS SERVER IPS"]
      #   destination_address_prefix   = "*"
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefix        = null
      #   destination_address_prefixes = null
      # },
      # {
      #   name                         = "AD135RPCTCPDCInbound"
      #   description                  = "AD135RPCTCPDCInbound"
      #   priority                     = 170
      #   direction                    = "Inbound"
      #   access                       = "Allow"
      #   protocol                     = "Tcp"
      #   source_port_range            = "*"
      #   destination_port_range       = "135"
      #   source_address_prefixes      = ["DNS SERVER IPS"]
      #   destination_address_prefix   = "*"
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefix        = null
      #   destination_address_prefixes = null
      # },
      # {
      #   name                         = "AD389LDAPTCPDCInbound"
      #   description                  = "AD389LDAPTCPDCInbound"
      #   priority                     = 180
      #   direction                    = "Inbound"
      #   access                       = "Allow"
      #   protocol                     = "Tcp"
      #   source_port_range            = "*"
      #   destination_port_range       = "389"
      #   source_address_prefixes      = ["DNS SERVER IPS"]
      #   destination_address_prefix   = "*"
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefix        = null
      #   destination_address_prefixes = null
      # },
      # {
      #   name                         = "AD445SMBTCPDCInbound"
      #   description                  = "AD445SMBTCPDCInbound"
      #   priority                     = 190
      #   direction                    = "Inbound"
      #   access                       = "Allow"
      #   protocol                     = "Tcp"
      #   source_port_range            = "*"
      #   destination_port_range       = "445"
      #   source_address_prefixes      = ["DNS SERVER IPS"]
      #   destination_address_prefix   = "*"
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefix        = null
      #   destination_address_prefixes = null
      # },
      # {
      #   name                         = "AD4915265535TCPDCInbound"
      #   description                  = "AD4915265535TCPDCInbound"
      #   priority                     = 200
      #   direction                    = "Inbound"
      #   access                       = "Allow"
      #   protocol                     = "Tcp"
      #   source_port_range            = "*"
      #   destination_port_range       = "49152-65535"
      #   source_address_prefixes      = ["DNS SERVER IPS"]
      #   destination_address_prefix   = "*"
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefix        = null
      #   destination_address_prefixes = null
      # },
      # {
      #   name                         = "AD4915265535UDPDCInbound"
      #   description                  = "AD4915265535UDPDCInbound"
      #   priority                     = 210
      #   direction                    = "Inbound"
      #   access                       = "Allow"
      #   protocol                     = "Udp"
      #   source_port_range            = "*"
      #   destination_port_range       = "49152-65535"
      #   source_address_prefixes      = ["DNS SERVER IPS"]
      #   destination_address_prefix   = "*"
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefix        = null
      #   destination_address_prefixes = null
      # },
      # {
      #   name                         = "ADPingtoDCInbound"
      #   description                  = "ADPingtoDCInbound"
      #   priority                     = 220
      #   direction                    = "Inbound"
      #   access                       = "Allow"
      #   protocol                     = "Icmp"
      #   source_port_range            = "*"
      #   destination_port_range       = "*"
      #   source_address_prefixes      = ["DNS SERVER IPS"]
      #   destination_address_prefix   = "*"
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefix        = null
      #   destination_address_prefixes = null
      # },
      # {
      #   name                         = "AD53DNSUDPDCOutbound"
      #   description                  = "AD53DNSUDPDCOutbound"
      #   priority                     = 151
      #   direction                    = "Outbound"
      #   access                       = "Allow"
      #   protocol                     = "Udp"
      #   source_port_range            = "*"
      #   destination_port_range       = "53"
      #   source_address_prefix        = "*"
      #   destination_address_prefixes = ["DNS SERVER IPS"]
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefixes      = null
      #   destination_address_prefix   = null
      # },
      # {
      #   name                         = "AD88KerberosTCPDCOutbound"
      #   description                  = "AD88KerberosTCPDCOutbound"
      #   priority                     = 161
      #   direction                    = "Outbound"
      #   access                       = "Allow"
      #   protocol                     = "Tcp"
      #   source_port_range            = "*"
      #   destination_port_range       = "88"
      #   source_address_prefix        = "*"
      #   destination_address_prefixes = ["DNS SERVER IPS"]
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefixes      = null
      #   destination_address_prefix   = null
      # },
      # {
      #   name                         = "AD135RPCTCPDCOutbound"
      #   description                  = "AD135RPCTCPDCOutbound"
      #   priority                     = 171
      #   direction                    = "Outbound"
      #   access                       = "Allow"
      #   protocol                     = "Tcp"
      #   source_port_range            = "*"
      #   destination_port_range       = "135"
      #   source_address_prefix        = "*"
      #   destination_address_prefixes = ["DNS SERVER IPS"]
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefixes      = null
      #   destination_address_prefix   = null
      # },
      # {
      #   name                         = "AD389LDAPTCPDCOutbound"
      #   description                  = "AD389LDAPTCPDCOutbound"
      #   priority                     = 181
      #   direction                    = "Outbound"
      #   access                       = "Allow"
      #   protocol                     = "Tcp"
      #   source_port_range            = "*"
      #   destination_port_range       = "389"
      #   source_address_prefix        = "*"
      #   destination_address_prefixes = ["DNS SERVER IPS"]
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefixes      = null
      #   destination_address_prefix   = null
      # },
      # {
      #   name                         = "AD445SMBTCPDCOutbound"
      #   description                  = "AD445SMBTCPDCOutbound"
      #   priority                     = 191
      #   direction                    = "Outbound"
      #   access                       = "Allow"
      #   protocol                     = "Tcp"
      #   source_port_range            = "*"
      #   destination_port_range       = "445"
      #   source_address_prefix        = "*"
      #   destination_address_prefixes = ["DNS SERVER IPS"]
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefixes      = null
      #   destination_address_prefix   = null
      # },
      # {
      #   name                         = "AD4915265535TCPDCOutbound"
      #   description                  = "AD4915265535TCPDCOutbound"
      #   priority                     = 201
      #   direction                    = "Outbound"
      #   access                       = "Allow"
      #   protocol                     = "Tcp"
      #   source_port_range            = "*"
      #   destination_port_range       = "49152-65535"
      #   source_address_prefix        = "*"
      #   destination_address_prefixes = ["DNS SERVER IPS"]
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefixes      = null
      #   destination_address_prefix   = null
      # },
      # {
      #   name                         = "AD4915265535UDPDCOutbound"
      #   description                  = "AD4915265535UDPDCOutboun"
      #   priority                     = 211
      #   direction                    = "Outbound"
      #   access                       = "Allow"
      #   protocol                     = "Udp"
      #   source_port_range            = "*"
      #   destination_port_range       = "49152-65535"
      #   source_address_prefix        = "*"
      #   destination_address_prefixes = ["DNS SERVER IPS"]
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefixes      = null
      #   destination_address_prefix   = null
      # },
      # {
      #   name                         = "ADPingtoDCOutbound"
      #   description                  = "ADPingtoDCOutbound"
      #   priority                     = 221
      #   direction                    = "Outbound"
      #   access                       = "Allow"
      #   protocol                     = "Icmp"
      #   source_port_range            = "*"
      #   destination_port_range       = "*"
      #   source_address_prefix        = "*"
      #   destination_address_prefixes = ["DNS SERVER IPS"]
      #   source_port_ranges           = null
      #   destination_port_ranges      = null
      #   source_address_prefixes      = null
      #   destination_address_prefix   = null
      # }
    ]
  },

  nsg2 = {
    name = "snet-we-idn-domaincontroller-ADconnect-nsg"
    tags = null
    # subnet_key                = "subnet2"
    subnet_name               = "snet-we-idn-AAD-connect"
    networking_resource_group = "rg-we-idn-vnet"
    security_rules = [
      {
        name                         = "BastionInbound"
        description                  = "NSG"
        priority                     = 101
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        source_address_prefix        = "xx.xx.3.0/25"
        destination_port_ranges      = ["3389", "22"]
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_range       = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      }
    ]
  },
  nsg3 = {
    name = "snet-we-idn-domaincontroller-PE-nsg"
    tags = null
    # subnet_key                = "subnet3"
    subnet_name               = "snet-we-idn-PE"
    networking_resource_group = "rg-we-idn-vnet"
    security_rules = [
      {
        name                         = "BastionInbound"
        description                  = "NSG"
        priority                     = 101
        direction                    = "Inbound"
        access                       = "Allow"
        protocol                     = "Tcp"
        source_port_range            = "*"
        source_address_prefix        = "xx.xx.3.0/25"
        destination_port_ranges      = ["3389", "22"]
        destination_address_prefix   = "*"
        source_port_ranges           = null
        destination_port_range       = null
        source_address_prefixes      = null
        destination_address_prefixes = null
      }
    ]
  },
}

nsg_additional_tags = {
  iac          = "Terraform"
  env          = "prod"
  automated_by = ""
}
