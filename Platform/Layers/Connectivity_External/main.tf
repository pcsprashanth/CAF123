# Get the current client configuration from the AzureRM provider.
# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# Management Group.

data "azurerm_client_config" "core" {}

# Obtain client configuration from the "connectivity" provider

data "azurerm_client_config" "connectivity" {
  provider = azurerm.connectivity
}

# Declare the Azure landing zones Terraform module
# and provide a base configuration.

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "3.0.0"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm.connectivity
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name
  library_path   = "./lib"
  deploy_core_landing_zones = false

  deploy_connectivity_resources    = var.deploy_connectivity_resources
  subscription_id_connectivity     = data.azurerm_client_config.connectivity.subscription_id
  configure_connectivity_resources = local.configure_connectivity_resources

}


####### additional resources #####

module "azurefirewallrules" {
  source                    = "../../../modules/azurefirewallrules"
  networking_resource_group = var.networking_resource_group
  firewall_policy_rule_collection_group = var.firewall_policy_rule_collection_group
  firewall_policy = var.firewall_policy
  depends_on = [
    module.enterprise_scale
  ]
}

module "networksecuritygroup" {
  source                    = "../../../modules/networksecuritygroup"
  resource_group_name       = "rg-we-connectivityvnet-external"
  nsg_additional_tags       = var.nsg_additional_tags
  network_security_groups   = var.network_security_groups
  networking_resource_group = var.networking_resource_group
  virtual_network_name      = var.virtual_network_name
  net_location =  var.connectivity_resources_location
  depends_on = [
    module.enterprise_scale
  ]
}

module "routetable" {
  source = "../../../modules/routetable"
  resource_group_name = var.resource_group_name
  route_tables = var.route_tables
  depends_on = [
    module.enterprise_scale
  ]
 }

module "ApplicationGateway"{
  source = "../../../modules/ApplicationGateway"
  resource_group_name = var.resource_group_name
  application_gateway =var.application_gateway  
  virtual_network_name      = var.virtual_network_name 
  location = var.location
  public_ip_name = var.public_ip_name
  depends_on = [
    module.enterprise_scale
  ]
}

module "keyvault" {
  source = "../../../modules/keyvault"
  kv_rg_name = var.kv_rg_name
  key_vault_name = var.key_vault_name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  # enable_rbac_authorization       = var.enable_rbac_authorization
  msi_object_id = var.msi_object_id
  sku_name                        = var.sku_name
  kv_additional_tags = var.kv_additional_tags
}