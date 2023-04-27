variable "dcvm1" {
  type = string
  description = "name of first DC vm"
}
variable "dcvm2" {
  type = string
  description = "name of first DC vm"
}
variable "resource_group_name" {
  type = string
}
variable "key_vault_name" {
  type = string
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

# active directory domain mode
variable "ad_domain_mode" {
  type        = string
  description = "This variable defines the mode of Active Directory domain and forest functional level"
  default     = "WinThreshold" # Windows Server 2016
}

# local administrator username
variable "ad_admin_username" {
  type        = string
  description = "The username associated with the local administrator account on the virtual machine"
}

# domain controller 1 name
variable "ad_dc1_name" {
  type        = string
  description = "This variable defines the name of AD Domain Controller 1"
}

# domain controller 2name
variable "ad_dc2_name" {
  type        = string
  description = "This variable defines the name of AD Domain Controller 2"
}

variable "ad_username" {
  type = string
}

