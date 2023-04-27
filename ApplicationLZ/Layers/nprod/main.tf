data "azurerm_subscription" "config" {}

module "resourcegroup" {
  source = "../../../modules/resourcegroup"
  resource_groups = var.resource_groups
}

module "networking" {
source                   = "../../../modules/networking"
resource_group_name      = var.resource_group_name
net_additional_tags      = var.net_additional_tags
virtual_networks         = var.virtual_networks
subnets                  = var.subnets
#vnet_peering             = var.vnet_peering
#net_location             = var.net_location
depends_on = [
    module.resourcegroup
  ]
}

module "vnetpeering" {
  source          = "../../../modules/vnetpeering"
  vnet_peering                  = var.vnet_peering  
  remote_virtual_network_id  = ""
  depends_on = [
    module.networking
  ]
}

module "networksecuritygroup" {
  source                    = "../../../modules/networksecuritygroup"
  resource_group_name       = var.resource_group_name
  nsg_additional_tags       = var.nsg_additional_tags
  network_security_groups   = var.network_security_groups
  networking_resource_group = var.networking_resource_group
  virtual_network_name      = var.virtual_network_name
  depends_on = [
      module.networking
    ]
}

module "routetable" {
  source = "../../../modules/routetable"
  resource_group_name = var.resource_group_name
  route_tables = var.route_tables
  depends_on = [
    module.networking
  ]
}

module "keyvault" {
  source = "../../../modules/keyvault"
  kv_rg_name                      = var.kv_rg_name
  key_vault_name                  = var.key_vault_name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  # enable_rbac_authorization       = var.enable_rbac_authorization
  msi_object_id = var.msi_object_id
  sku_name                        = var.sku_name
  kv_additional_tags = var.kv_additional_tags
  depends_on = [
      module.resourcegroup
    ]
}

module "windowsvirtualmachine" {
    source          = "../../../modules/windowsvirtualmachine"
    resource_group_name                  = var.resource_group_name
    windows_vms                          = var.windows_vms
    windows_vm_nics                      = var.windows_vm_nics
    managed_data_disks                   = var.managed_data_disks
    vm_additional_tags                   = var.vm_additional_tags
    administrator_user_name              = var.administrator_user_name
    source_image_reference_offer         = "WindowsServer"          # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer
    source_image_reference_publisher     = "MicrosoftWindowsServer" # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer  
    source_image_reference_sku           = "2019-Datacenter"        # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer 
    source_image_reference_version       = "latest"        
    key_vault_name                         = var.key_vault_name  
    networking_resource_group = var.networking_resource_group
    virtual_network_name      = var.virtual_network_name  
    depends_on = [
     module.networking,
     module.keyvault,
    ]
}