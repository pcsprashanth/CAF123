variable "root_id" {
  type    = string
  default = "mg"
}

variable "root_name" {
  type    = string
  default = "mg-root"
}

variable "deploy_connectivity_resources" {
  type    = bool
  default = true
}

variable "connectivity_resources_location" {
  type    = string
  default = "westeurope"
}

variable "connectivity_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_connectivity_resources_custom"
    CostCenter = "Shared Infrastructure"
    CostType = ""
    CostCategory = ""
    Project = "Cloud Data Center"
  }
}
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Route Tables."
}

# -
# - Route Table object
# -
variable "route_tables" {
  type = map(object({
    name                          = string
    location                      = string
    disable_bgp_route_propagation = bool
    subnet_name                   = string
    vnet_name                     = string
    routes = list(object({
      name                   = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = string
      azure_firewall_name    = string
    }))
  }))
  description = "The route tables with their properties."
  default     = {}
}

variable "subnet_route_table_associations" {
  type = map(object({
    name                          = string
    disable_bgp_route_propagation = bool
    subnet_name                   = string
    routes = list(object({
      name                   = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = string
      azure_firewall_name    = string
    }))
  }))
  description = "The route tables with their properties."
  default     = {}
}

variable "route_table_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}

variable "subnet_ids" {
  type        = map(string)
  description = "A map of subnet id's"
  default     = {}
}

variable "firewall_private_ips_map" {
  type        = map(string)
  description = "Specifies the Map of Azure Firewall Private Ip's"
  default     = {}
}
variable "public_ip_name" {
  type = string
}

variable "location"{
    type = string
  }

variable "application_gateway" {
  type = map(object({
    application_gateway_name = string
    zones = list(string)
    subnet_name               = string
    autoscale_configuration =list(object({
    min_capacity = number
    max_capacity = number
  }))
  
    backend_address_pool =list(object({
    backend_ip_addresses = list(string)
  }))

    backend_http_settings = list(object({
     
    path             = string
    probe_name = string
  }))

  #   gateway_ip_configuration = list(object({
  #  gateway_ip_configuration_subnet_id = string
  # }))

  probe = list(object({
    name = string
    probe_host = string
    probe_interval = number
    probe_protocol = string
    probe_path = string
    probe_timeout = number
    probe_unhealthy_threshold = string
   
  }))
    
    frontend_port = string
     
    firewall_mode = string
  }))
}

############################
# keyvault
############################

variable "kv_rg_name" {
  type        = string
  description = "The name of the resource group in which to create the Key Vault"
}

variable "kv_additional_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    pe_enable = true
  }
}

variable "msi_object_id" {
  type = string
  description = "The object id of the MSI used by the ADO agent"
  default = null
}

variable "key_vault_name" {
  type        = string
  description = "Specifies the name of the Key Vault"
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Allow Virtual Machines to retrieve certificates stored as secrets from the key vault."
  default     = null
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Allow Disk Encryption to retrieve secrets from the vault and unwrap keys."
  default     = null
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Allow Resource Manager to retrieve secrets from the key vault."
  default     = null
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Min is 7 days, maximum is 90 days"
  default     = 7
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Allow purge_protection be enabled for this Key Vault"
  default     = true
}

# variable "enable_rbac_authorization" {
#   type = bool
#   default = true
# }

variable "sku_name" {
  type        = string
  description = "The name of the SKU used for the Key Vault. The options are: `standard`, `premium`."
  default     = "standard"
}

variable "network_acls" {
  type = object({
    bypass                     = string       # (Required) Specifies which traffic can bypass the network rules. Possible values are AzureServices and None.
    default_action             = string       # (Required) The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny.
    ip_rules                   = list(string) # (Optional) One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault.
    virtual_network_subnet_ids = list(string) # (Optional) One or more Subnet ID's which should be able to access this Key Vault.
  })
  description = "Specifies values for Key Vault network access"
  default     = null
}

########################
# Key Vault Serets
########################
variable "secrets" {
  type        = map(string)
  description = "A map of secrets for the Key Vault"
  default     = {}
}

########################
# Key Vault Access Policy
########################
variable "access_policies" {
  type = map(object({
    group_names             = list(string)
    object_ids              = list(string)
    user_principal_names    = list(string)
    certificate_permissions = list(string)
    key_permissions         = list(string)
    secret_permissions      = list(string)
    storage_permissions     = list(string)
  }))
  description = "A map of access policies for the Key Vault"
  default     = {}
}

############################
# State File
############################ 
variable ackey {
  description = "Not required if MSI is used to authenticate to the SA where state file is"
  default     = null
}

# -
# - Network Security Group object
# -
variable "network_security_groups" {
  type = map(object({
    name                      = string
    tags                      = map(string)
    # subnet_key                = string
    subnet_name               = string
    # networking_resource_group = string
    security_rules = list(object({
      name                                         = string
      description                                  = string
      protocol                                     = string
      direction                                    = string
      access                                       = string
      priority                                     = number
      source_address_prefix                        = string
      source_address_prefixes                      = list(string)
      destination_address_prefix                   = string
      destination_address_prefixes                 = list(string)
      source_port_range                            = string
      source_port_ranges                           = list(string)
      destination_port_range                       = string
      destination_port_ranges                      = list(string)
    }))
  }))
  description = "The network security groups with their properties."
  default     = {}
}

variable "networking_resource_group" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "nsg_additional_tags" {
  type        = map(string)
  description = "Additional Network Security Group resources tags, in addition to the resource group tags."
  default     = {}
}

variable "net_location" {
  type        = string
  description = "Network resources location if different than the resource group's location."
  default     = "westeurope"
}

#################### AZ Firewall ####################

variable "firewall_policy" {
  type        = string
  description = "Specifies the name of the Firewall."
}

variable "firewall_policy_rule_collection_group" {
  type = map(object({
    name = string
    priority = number
    network_rule_collection_name = string
    network_rule_collection_priority = number                 # Specifies the priority of the rule collection. Possible values are between 100 - 65000.
    network_rule_collection_action   = string                 # Specifies the action the rule will apply to matching traffic. Possible values are Allow and Deny.
      rules = list(object({
        name                  = string
        source_addresses      = list(string)
        destination_ports     = list(string)
        destination_addresses = list(string)
        protocols             = list(string)
      }))
  }))
  description = "(Optional) List of the Network rule collections for the Azure Firewall:<br></br><ul><li>network_rule_collection `map.key`: (Required) Name of the Network Rule Collection which must be unique within the Firewall. </li><li>`priority`: (Required) Provide the priority of the rule collection. Allowed values are [`100`..`65000`]. </li><li>`action`: (Required) Provide the action the rule will apply to matching traffic. Allowed values are [`Allow`, `Deny`]. </li><li>`rule`: (Required) One or more `rule` blocks as defined below. </li><li>rule `map.key`: (Required) Name of the rule.</li><li>`description`: (Optional) Provide a description for the rule. </li><li>`source_addresses`: (Required) A list of source IP addresses and/or IP ranges. </li><li>`source_ip_groups`: (Optional) A list of IP Group IDs for the rule. </li><li>`destination_ports`: (Required) A list of destination ports. </li><li>`destination_addresses`: (Optional) Either a list of destination IP addresses and/or IP ranges, or a list of destination Service Tags. </li><li>`destination_ip_groups`: (Optional) A list of destination IP Group IDs for the rule.</li><li>`destination_fqdns`: (Optional) A list of destination FQDNS for the rule. DNS Proxy must be enabled.</li><li>`protocols`: (Required) A list of protocols. Possible values are [Any, ICMP, TCP, UDP]."
  default     = {}
}