variable "networking_resource_group" {
  type        = string
  description = "The name of the resource group in which to create the Firewall."
}

variable "firewall_policy" {
  type        = string
  description = "Specifies the name of the Firewall."
}

# - Variables - Firewall NAT rules

# variable "nat_rule_collections" {
#   type = map(object({
#     name = string
#     priority = number                   # Specifies the priority of the rule collection. Possible values are between 100 - 65000.
#     action   = string                   # Specifies the action the rule will apply to matching traffic. Possible values are Dnat and Snat.
#     rules = map(object({                # Specifies the name of the rule.
#       description        = string       # Specifies a description for the rule.
#       destination_ports  = list(string) # A list of destination ports.
#       protocols          = list(string) # A list of protocols. Possible values are Any, ICMP, TCP and UDP. If action is Dnat, protocols can only be TCP and UDP.
#       source_addresses   = list(string) # A list of source IP addresses and/or IP ranges.
#       source_ip_groups   = list(string) # A list of source IP Group IDs for the rule.
#       translated_address = string       # The address of the service behind the Firewall.
#       translated_port    = number       # The port of the service behind the Firewall.

#     }))
#   }))
#   description = "(Optional) List of DNAT or SNAT rules for the Azure Firewall:<br></br><ul><li>nat_rule_collection `map.key`: (Required) Name of the NAT Rule Collection which must be unique within the Firewall. </li><li>`priority`: (Required) Provide the priority of the rule collection. Allowed values are [`100`..`65000`]. </li><li>`action`: (Required) Provide the action the rule will apply to matching traffic. Allowed values are [`Dnat`, `Snat`]. </li><li>`rule`: (Required) One or more `rule` blocks as defined below. </li><li>rule `map.key`: (Required) Name of the rule.</li><li>`description`: (Optional) Provide a description for the rule. </li><li>`destination_ports`: (Required) A list of destination ports. Must be in [1, 64000].</li><li>`protocols`: (Required) A list of protocols. Possible values are `Any`, `ICMP`, `TCP` and `UDP`. If action is `Dnat`, protocols can only be `TCP` and `UDP`. </li><li>`source_addresses`: (Optional) A list of source IP addresses and/or IP ranges. </li><li>`source_ip_groups`: (Optional) A list of source IP groups. </li><li>`translated_address`: (Required) The address of the service behind the Firewall. </li><li>`translated_port`: (Required) The port of the service behind the Firewall."
#   default     = {}
# }

# variable "public_ip_address" {
#   type        = string
#   description = "A list of destination IP addresses and/or IP ranges."
# }

#- Variables Firewall Network rules

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

# variable "network_rule_collections" {
#   type = map(object({
#     name = string
#     priority = number                 # Specifies the priority of the rule collection. Possible values are between 100 - 65000.
#     action   = string                 # Specifies the action the rule will apply to matching traffic. Possible values are Allow and Deny.
#     rules = map(object({              # Specifies the name of the rule.
#       description      = string       # Specifies a description for the rule.
#       source_addresses = list(string) # A list of source IP addresses and/or IP ranges.
#       source_ip_groups = list(string) # A list of source IP Group IDs for the rule.
#       protocols        = list(string) #  A list of protocols. Possible values are Any, ICMP, TCP and UDP. If action is Dnat, protocols can only be TCP and UDP.

#       destination_ports     = list(string) # A list of destination ports.
#       destination_addresses = list(string) # Either a list of destination IP addresses and/or IP ranges, or a list of destination Service Tags.
#       destination_ip_groups = list(string) # A list of destination IP Group IDs for the rule.
#       destination_fqdns     = list(string) # A list of destination FQDNS for the rule.
#     }))
#   }))
#   description = "(Optional) List of the Network rule collections for the Azure Firewall:<br></br><ul><li>network_rule_collection `map.key`: (Required) Name of the Network Rule Collection which must be unique within the Firewall. </li><li>`priority`: (Required) Provide the priority of the rule collection. Allowed values are [`100`..`65000`]. </li><li>`action`: (Required) Provide the action the rule will apply to matching traffic. Allowed values are [`Allow`, `Deny`]. </li><li>`rule`: (Required) One or more `rule` blocks as defined below. </li><li>rule `map.key`: (Required) Name of the rule.</li><li>`description`: (Optional) Provide a description for the rule. </li><li>`source_addresses`: (Required) A list of source IP addresses and/or IP ranges. </li><li>`source_ip_groups`: (Optional) A list of IP Group IDs for the rule. </li><li>`destination_ports`: (Required) A list of destination ports. </li><li>`destination_addresses`: (Optional) Either a list of destination IP addresses and/or IP ranges, or a list of destination Service Tags. </li><li>`destination_ip_groups`: (Optional) A list of destination IP Group IDs for the rule.</li><li>`destination_fqdns`: (Optional) A list of destination FQDNS for the rule. DNS Proxy must be enabled.</li><li>`protocols`: (Required) A list of protocols. Possible values are [Any, ICMP, TCP, UDP]."
#   default     = {}
# }

#- Variables Firewall Application rules

# variable "application_rule_collections" {
#   type = map(object({
#     name = string
#     priority = number                 # Specifies the priority of the rule collection. Possible values are between 100 - 65000.
#     action   = string                 # Specifies the action the rule will apply to matching traffic. Possible values are Allow and Deny.
#     rules = map(object({              # Specifies the name of the rule.
#       description      = string       # Specifies a description for the rule.
#       source_addresses = list(string) # A list of source IP addresses and/or IP ranges.
#       source_ip_groups = list(string) # A list of source IP Group IDs for the rule.
#       fqdn_tags        = list(string) # A list of FQDN tags. Possible values are AppServiceEnvironment, AzureBackup, AzureKubernetesService, HDInsight, MicrosoftActiveProtectionService, WindowsDiagnostics, WindowsUpdate and WindowsVirtualDesktop.
#       target_fqdns     = list(string) # A list of FQDNs.
#       protocol = list(object({
#         port = number # Specify a port for the connection.
#         type = string # Specifies the type of connection. Possible values are Http, Https and Mssql.
#       }))
#     }))
#   }))
#   description = "(Optional) List of Application rules for the Azure Firewall:<br></br><ul><li>application_rule_collection `map.key`: (Required) Name of the Application Rule Collection which must be unique within the Firewall. </li><li>`priority`: (Required) Provide the priority of the rule collection. Allowed values are between `100` - `65000`. </li><li>`action`: (Required) Provide the action the rule will apply to matching traffic. Allowed values are `Allow` and `Deny`. </li><li>`rule`: (Required) One or more `rule` blocks as defined below. </li><li>rule `map.key`: (Required) Name of the rule.</li><li>`description`: (Optional) Provide a description for the rule. </li><li>`source_addresses`: (Optional) A list of source IP addresses and/or IP ranges. </li><li>`source_ip_groups`: (Optional) A list of source IP Group IDs for the rule. </li><li>`fqdn_tags`: (Optional) A list of FQDN tags. Allowed values are `AppServiceEnvironment`, `AzureBackup`, `AzureKubernetesService`, `HDInsight`, `MicrosoftActiveProtectionService`, `WindowsDiagnostics`, `WindowsUpdate` and `WindowsVirtualDesktop`. </li><li>`target_fqdns`: (Optional) A list of FQDNs. </li><li>`protocol`: (Optional) One or more protocol blocks as defined below. <br></br></li><li>`port`: (Required) Specify a port for the connection. </li><li>`type`: (Required) Specifies the type of connection. Possible values are `Http`, `Https` and `Mssql`."
#   default     = {}
# }
