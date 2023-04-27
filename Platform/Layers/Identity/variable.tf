variable "root_id" {
  type    = string
  default = "mg"
}

variable "root_name" {
  type    = string
  default = "mg-root"
}

# #############################################################################
# Variables - Resource Groups
# #############################################################################
# -
# - Resource Group
# -
variable "resource_groups" {
  description = "Resource groups"
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  default = {}
}

#########################################
#network 
variable "resource_group_name" {
  type        = string
  description = "Specifies the name of the resource group in which to create the Azure Network Base Infrastructure Resources."
}

variable "net_location" {
  type        = string
  description = "Network resources location if different than the resource group's location."
  default     = "westeurope"
}

variable "net_additional_tags" {
  type        = map(string)
  description = "Additional Network resources tags, in addition to the resource group tags."
  default     = {}
}

# -
# - Virtual Network
# -
variable "virtual_networks" {
  description = "The virtal networks with their properties."
  type = map(object({
    name          = string
    address_space = list(string)
    dns_servers   = list(string)
    ddos_protection_plan = object({
      id     = string
      enable = bool
    })
  }))
  default = {}
}

# -
# - Virtual Network Peering
# -
variable "vnet_peering" {
  type = map(object({
    #shared_subscription = string
    destination_vnet_name                 = string
    destination_vnet_rg                   = string
    remote_destination_virtual_network_id = string
    #remote_source_virtual_network_id = string
    source_vnet_name             = string
    source_vnet_rg               = string
    allow_forwarded_traffic      = bool
    allow_virtual_network_access = bool
    allow_gateway_transit        = bool
    use_remote_gateways          = bool
  }))
  description = "Specifies the map of objects for vnet peering."
  default     = {}
}

variable "destination_vnet_subscription_id" {
  type        = string
  description = "Specifies the destination virtual network subscription id."
  default     = "2e736eaf-c07f-456a-a546-42832fba978d"
}

# -
# - Subnet object
# -
variable "subnets" {
  description = "The virtal networks subnets with their properties."
  type = map(object({
    name              = string
    vnet_key          = string
    vnet_name         = string
    address_prefixes  = list(string)
    pe_enable         = bool
    service_endpoints = list(string)
    delegation = list(object({
      name = string
      service_delegation = list(object({
        name    = string
        actions = list(string)
      }))
    }))
  }))
  default = {}
}

########################################################

### Network Security Groups####

variable "nsg_additional_tags" {
  type        = map(string)
  description = "Additional Network Security Group resources tags, in addition to the resource group tags."
  default     = {}
}

# -
# - Network Security Group object
# -
variable "network_security_groups" {
  type = map(object({
    name = string
    tags = map(string)
    # subnet_key                = string
    subnet_name = string
    # networking_resource_group = string
    security_rules = list(object({
      name                         = string
      description                  = string
      protocol                     = string
      direction                    = string
      access                       = string
      priority                     = number
      source_address_prefix        = string
      source_address_prefixes      = list(string)
      destination_address_prefix   = string
      destination_address_prefixes = list(string)
      source_port_range            = string
      source_port_ranges           = list(string)
      destination_port_range       = string
      destination_port_ranges      = list(string)
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

############################
# keyvault
############################

variable "kv_rg_name" {
  type        = string
  description = "The name of the resource group in which to create the Key Vault"
  default     = ""
}

variable "kv_additional_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    pe_enable = true
  }
}

variable "msi_object_id" {
  type        = string
  description = "The object id of the MSI used by the ADO agent"
  default     = null
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

# -
# - Recover Services Vault
# -
variable "rsv_additional_tags" {
  type        = map(string)
  description = "Additional Recovery Services Vault resources tags, in addition to the resource group tags"
  default     = {}
}

variable "recovery_services_vaults" {
  type = map(object({
    name                = string # (Required) Specifies the name of the Recovery Services Vault.
    sku                 = string # (Required) Sets the vault's SKU. Possible values include: Standard, RS0.
    soft_delete_enabled = bool   # (Optional) Is soft delete enable for this Vault? Defaults to true.
    policy_name         = string
    backup_settings = object({
      frequency = string # (Required) Sets the backup frequency. Must be either Daily orWeekly.
      time      = string # (Required) The time of day to perform the backup in 24hour format.
      weekdays  = string # (Optional) The days of the week to perform backups on and weekdays should be seperated by ','(comma).
    })
    retention_settings = object({
      daily   = number # (Required) The number of daily backups to keep. Must be between 1 and 9999
      weekly  = string # count:weekdays and weekdays should be seperated by ','(comma)
      monthly = string # count:weekdays:weeks and weekdays & weeks should be seperated by ','(comma)
      yearly  = string # count:weekdays:weeks:months and weekdays, weeks & months should be seperated by ','(comma)
    })
  }))
  description = "Map of recover services vaults properties"
  default     = {}
}

# variable backup_policy {
#   description = "Configures the Policy backup frequency, times & days as documented in the backup block below."
#   type = object({
#     frequency = string
#     time      = string
#   })
#   default = {
#     frequency = "Daily"
#     time      = "23:00"
#   }
# }

# variable retention_daily_policy {
#   description = "Configures the policy daily retention. Required when backup frequency is Daily. Must be between 7 and 9999."
#   type = object({
#     count = number
#   })
#   default = null
# }

# variable retention_weekly_policy {
#   description = "Configures the policy weekly retention. Required when backup frequency is Weekly."
#   type = object({
#     count    = number
#     weekdays = list(string)
#   })
#   default = null
# }

# variable retention_monthly_policy {
#   description = "Configures the policy monthly retention."
#   type = object({
#     count    = number
#     weekdays = list(string)
#     weeks    = list(string)
#   })
#   default = null
# }

# variable retention_yearly_policy {
#   description = "Configures the policy yearly retention"
#   type = object({
#     count    = number
#     weekdays = list(string)
#     weeks    = list(string)
#     months   = list(string)
#   })
#   default = null
# }

########################################################

##windowsvirtualmachine

variable "vm_additional_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default = {
    monitor_enable = true
  }
}

# -
# - Windows VM's
# -

variable "windows_vms" {
  type = map(object({
    name                                 = string
    computer_name                        = string
    vm_size                              = string
    zone                                 = string
    location                             = string
    assign_identity                      = bool
    availability_set_key                 = string
    vm_nic_keys                          = list(string)
    source_image_reference_publisher     = string
    source_image_reference_offer         = string
    source_image_reference_sku           = string
    source_image_reference_version       = string
    os_disk_name                         = string
    storage_os_disk_caching              = string
    managed_disk_type                    = string
    disk_size_gb                         = number
    write_accelerator_enabled            = bool
    recovery_services_vault_name         = string
    vm_backup_policy_name                = string
    use_existing_disk_encryption_set     = bool
    existing_disk_encryption_set_name    = string
    existing_disk_encryption_set_rg_name = string
    enable_cmk_disk_encryption           = bool
    customer_managed_key_name            = string
    disk_encryption_set_name             = string
    enable_automatic_updates             = bool
    custom_data_path                     = string
    custom_data_args                     = map(string)
    location                             = string
    resource_group_name                  = string

  }))
  description = "Map containing Windows VM objects"
  default     = {}
}

variable "windows_vm_nics" {
  type = map(object({
    name                           = string
    subnet_name                    = string
    vnet_name                      = string
    networking_resource_group      = string
    lb_backend_pool_names          = list(string)
    lb_nat_rule_names              = list(string)
    app_security_group_names       = list(string)
    app_gateway_backend_pool_names = list(string)
    internal_dns_name_label        = string
    enable_ip_forwarding           = bool
    enable_accelerated_networking  = bool
    dns_servers                    = list(string)
    location                       = string
    resource_group_name            = string

    nic_ip_configurations = list(object({
      name      = string
      static_ip = string
    }))
  }))
  description = "Map containing Windows VM NIC objects"
  default     = {}
}

variable "administrator_user_name" {
  type        = string
  description = "Specifies the name of the local administrator account"
  default     = "Administrator"
}

# -
# - Availability Sets
# -
variable "availability_sets" {
  type = map(object({
    name                         = string
    platform_update_domain_count = number
    platform_fault_domain_count  = number
    location                     = string
    resource_group_name          = string
  }))
  description = "Map containing availability set configurations"
  default     = {}
}


# -
# - Diagnostics Extensions
# -
variable "diagnostics_sa_name" {
  type        = string
  description = "The name of diagnostics storage account"
  default     = null
}

variable "kv_role_assignment" {
  type        = bool
  description = "Grant VM MSI Reader Role in KV resource?"
  default     = false
}

variable "self_role_assignment" {
  type        = bool
  description = "Grant VM MSI Reader Role in VM resource ?"
  default     = false
}

# -
# - Managed Disks
# -
variable "managed_data_disks" {
  type = map(object({
    disk_name                 = string
    vm_key                    = string
    location                  = string
    resource_group_name       = string
    lun                       = string
    storage_account_type      = string
    disk_size                 = number
    caching                   = string
    write_accelerator_enabled = bool
    create_option             = string
    os_type                   = string
    source_resource_id        = string
    location                  = string
    resource_group_name       = string
  }))
  description = "Map containing storage data disk configurations"
  default     = {}
}

############################
# 
############################ 
variable "ackey" {
  description = "Not required if MSI is used to authenticate to the SA where state file is"
  default     = null
}
variable "source_image_reference_publisher" {
  type    = string
  default = "MicrosoftWindowsServer"
}

variable "source_image_reference_offer" {
  type    = string
  default = "WindowsServer"
}

variable "source_image_reference_sku" {
  type    = string
  default = "2016-Datacenter"
}

variable "source_image_reference_version" {
  type    = string
  default = "latest"
}

# domain controller variables

variable "dcvm1" {
  type = string
  description = "name of first DC vm"
}
variable "dcvm2" {
  type = string
  description = "name of first DC vm"
}
variable "storage_container_name" {
  type = string
}

# active directory domain name
variable "ad_domain_name" {
  type        = string
  description = "This variable defines the name of Active Directory domain, for example kopicloud.local"
}

# active directory domain NetBIOS name
variable "ad_domain_netbios_name" {
  type        = string
  description = "This variable defines the NETBIOS name of Active Directory domain, for example kopicloud"
}

# local administrator username
variable "ad_admin_username" {
  type        = string
  description = "The username associated with the local administrator account on the virtual machine"
}

variable "ad_dc1_name" {
  type        = string
  description = "This variable defines the name of AD Domain Controller 1"
}

# domain controller 2name
variable "ad_dc2_name" {
  type        = string
  description = "This variable defines the name of AD Domain Controller 2"
}

# active directory domain mode
variable "ad_domain_mode" {
  type        = string
  description = "This variable defines the mode of Active Directory domain and forest functional level"
  default     = "WinThreshold" # Windows Server 2016
}

variable "ad_username" {
  type = string
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