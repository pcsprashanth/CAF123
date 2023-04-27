variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the NSGs."
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

############################
# State File
############################ 
variable ackey {
  description = "Not required if MSI is used to authenticate to the SA where state file is"
  default     = null
}