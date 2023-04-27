# data "azurerm_firewall" "this" {
#   name = var.firewall_name
#   resource_group_name = var.networking_resource_group
# }

data "azurerm_firewall_policy" "fwpolicy" {
  name = var.firewall_policy
  resource_group_name = var.networking_resource_group
}

# - Creates Azure Firewall NAT Rules

# resource "azurerm_firewall_nat_rule_collection" "this" {
#   for_each = coalesce(var.nat_rule_collections, {})

#   resource_group_name = var.networking_resource_group
#   azure_firewall_name = data.azurerm_firewall.this.name

#   name     = each.key
#   priority = each.value["priority"]
#   action   = each.value["action"]

#   dynamic "rule" {
#     for_each = each.value["rules"]
#     content {
#       name        = rule.key
#       description = rule.value.description

#       destination_addresses = [var.public_ip_address]
#       destination_ports     = rule.value.destination_ports
#       protocols             = rule.value.protocols

#       source_addresses = coalesce(rule.value.source_addresses, [])
#       source_ip_groups = coalesce(rule.value.source_ip_groups, [])

#       translated_address = rule.value.translated_address
#       translated_port    = rule.value.translated_port
#     }
#   }
# }

# - Creates Azure Firewall Network Rules

resource "azurerm_firewall_policy_rule_collection_group" "this" {
  for_each = var.firewall_policy_rule_collection_group
  name = each.value["name"]
  priority = each.value["priority"]
  firewall_policy_id = data.azurerm_firewall_policy.fwpolicy.id
  network_rule_collection {
    name = each.value["network_rule_collection_name"]
    priority = each.value["network_rule_collection_priority"]
    action = each.value["network_rule_collection_action"]
    dynamic "rule" {
      for_each = lookup(each.value, "rules")
      content {
        name                  = rule.value.name

        source_addresses      = rule.value.source_addresses
        destination_ports     = rule.value.destination_ports
        destination_addresses = rule.value.destination_addresses
        protocols             = rule.value.protocols
      }
    }
  }
}

# resource "azurerm_firewall_network_rule_collection" "this" {
#   for_each = coalesce(var.network_rule_collections, {})

#   resource_group_name = var.networking_resource_group
#   azure_firewall_name = data.azurerm_firewall.this.name

#   name     = each.key
#   priority = each.value["priority"]
#   action   = each.value["action"]

#   dynamic "rule" {
#     for_each = each.value["rules"]
#     content {
#       name        = rule.key
#       description = rule.value.description

#       protocols        = coalesce(rule.value.protocols, [])
#       source_addresses = coalesce(rule.value.source_addresses, [])
#       source_ip_groups = coalesce(rule.value.source_ip_groups, [])

#       destination_addresses = coalesce(rule.value.destination_addresses, [])
#       destination_ports     = coalesce(rule.value.destination_ports, [])
#       destination_fqdns     = coalesce(rule.value.destination_fqdns, [])
#       destination_ip_groups = coalesce(rule.value.destination_ip_groups, [])
#     }
#   }
# }

# # - Creates Azure Firewall Application Rules

# resource "azurerm_firewall_application_rule_collection" "this" {
#   for_each = coalesce(var.application_rule_collections, {})

#   resource_group_name = var.networking_resource_group
#   azure_firewall_name = data.azurerm_firewall.this.name

#   name     = each.key
#   priority = each.value["priority"]
#   action   = each.value["action"]

#   dynamic "rule" {
#     for_each = each.value["rules"]
#     content {
#       name        = rule.key
#       description = rule.value.description

#       source_addresses = rule.value.source_addresses
#       source_ip_groups = coalesce(rule.value.source_ip_groups, [])
#       fqdn_tags        = lookup(rule.value, "target_fqdns", null) == null && lookup(rule.value, "fqdn_tags", null) != null ? rule.value.fqdn_tags : []
#       target_fqdns     = lookup(rule.value, "fqdn_tags", null) == null && lookup(rule.value, "target_fqdns", null) != null ? rule.value.target_fqdns : []

#       dynamic "protocol" {
#         for_each = lookup(rule.value, "target_fqdns", null) != null && lookup(rule.value, "fqdn_tags", null) == null ? lookup(rule.value, "protocol", []) : []
#         content {
#           port = lookup(protocol.value, "port", null)
#           type = protocol.value.type
#         }
#       }
#     }
#   }
# }
