# -
# - VNet Peering
# -
#locals {
  #networking_state_exists = length(values(data.terraform_remote_state.networking.outputs)) == 0 ? false : true
#}

# data "azurerm_virtual_network" "destination" {
#   provider            = azurerm.shared_subscription
#   for_each            = var.vnet_peering
#   name                = each.value["destination_vnet_name"]
#   resource_group_name = each.value["destination_vnet_rg"]
# }

resource "azurerm_virtual_network_peering" "source_to_destination" {
  for_each                     = var.vnet_peering
  name                         = format("%s-to-%s", each.value["source_vnet_name"], each.value["destination_vnet_name"])
  resource_group_name          = each.value["source_vnet_rg"]
  remote_virtual_network_id    = each.value ["remote_destination_virtual_network_id"]
  virtual_network_name         = each.value["source_vnet_name"]
  allow_forwarded_traffic      = coalesce(lookup(each.value, "allow_forwarded_traffic"), true)
  allow_virtual_network_access = coalesce(lookup(each.value, "allow_virtual_network_access"), true)
  allow_gateway_transit        = coalesce(lookup(each.value, "allow_gateway_transit"), false)
  use_remote_gateways          = coalesce(lookup(each.value, "use_remote_gateways"), false)

  lifecycle {
    ignore_changes = [remote_virtual_network_id]
  }
}
/*
resource "azurerm_virtual_network_peering" "destination_to_source" {
  provider                     = azurerm.shared_subscription
  for_each                     = var.vnet_peering
  name                         = format("%s-to-%s", each.value["destination_vnet_name"], each.value["source_vnet_name"])
  resource_group_name          = each.value["destination_vnet_rg"]
  remote_virtual_network_id    = each.value["remote_source_virtual_network_id"]
  virtual_network_name         = each.value["destination_vnet_name"]
  allow_forwarded_traffic      = coalesce(lookup(each.value, "allow_forwarded_traffic"), true)
  allow_virtual_network_access = coalesce(lookup(each.value, "allow_virtual_network_access"), true)
  allow_gateway_transit        = coalesce(lookup(each.value, "allow_gateway_transit"), false)
  use_remote_gateways          = coalesce(lookup(each.value, "use_remote_gateways"), false)
}

data "terraform_remote_state" "networking" {
 backend = "remote"
 config = {
    organization = "hashicorp"
    workspaces = {
      name = "networking"
    }
}
}
data "azurerm_virtual_network" "source" {
  for_each            = local.networking_state_exists == false ? var.vnet_peering : {}
  name                = each.value["source_vnet_name"]
  resource_group_name = each.value["source_vnet_rg"]
}

resource "azurerm_virtual_network_peering" "destination_internal_to_source" {
  #provider                     = azurerm.sub-arc712-con-02
  for_each                     = var.vnet_peering
  name                         = format("%s-to-%s", each.value["destination_vnet_name"], each.value["source_vnet_name"])
  resource_group_name          = each.value["destination_vnet_rg"]
  #remote_virtual_network_id    = each.value["remote_source_virtual_network_id"]
  remote_virtual_network_id    = lookup(data.azurerm_virtual_network.source, each.key)["id"]
  virtual_network_name         = each.value["destination_vnet_name"]
  allow_forwarded_traffic      = coalesce(lookup(each.value, "allow_forwarded_traffic"), true)
  allow_virtual_network_access = coalesce(lookup(each.value, "allow_virtual_network_access"), true)
  allow_gateway_transit        = coalesce(lookup(each.value, "allow_gateway_transit"), false)
  use_remote_gateways          = coalesce(lookup(each.value, "use_remote_gateways"), false)
}
resource "azurerm_virtual_network_peering" "destination_external_to_source" {
  #provider                     = azurerm.each.value["shared_subscription"]
  provider                     = azurerm.sub-arc712-con-01
  for_each                     = var.vnet_peering
  name                         = format("%s-to-%s", each.value["destination_vnet_name"], each.value["source_vnet_name"])
  resource_group_name          = each.value["destination_vnet_rg"]
  remote_virtual_network_id    = lookup(data.azurerm_virtual_network.source, each.key)["id"]
  virtual_network_name         = each.value["destination_vnet_name"]
  allow_forwarded_traffic      = coalesce(lookup(each.value, "allow_forwarded_traffic"), true)
  allow_virtual_network_access = coalesce(lookup(each.value, "allow_virtual_network_access"), true)
  allow_gateway_transit        = coalesce(lookup(each.value, "allow_gateway_transit"), false)
  use_remote_gateways          = coalesce(lookup(each.value, "use_remote_gateways"), false)
}

*/