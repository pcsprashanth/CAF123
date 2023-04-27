data "azurerm_subscription" "config" {}

module "resourcegroup" {
  source = "../../../modules/resourcegroup"
  resource_groups = var.resource_groups  
}

######################################################3

module "networking" {
  source = "../../../modules/networking"
  resource_group_name      = "app1"
  net_additional_tags      = var.net_additional_tags
  virtual_networks         = var.virtual_networks
  subnets                  = var.subnets
  depends_on = [
      module.resourcegroup
    ]
}

module "vnetpeering" {
  source = "../../../modules/vnetpeering"
  vnet_peering                  = var.vnet_peering  
  remote_virtual_network_id  = ""
     
  depends_on = [
    module.networking
  ]
}

module "windowsvirtualmachine" {
    source = "../../../modules/windowsvirtualmachine"
    resource_group_name                  = var.resource_group_name
    windows_vms                          = var.windows_vms
    windows_vm_nics                      = var.windows_vm_nics
    managed_data_disks                   = var.managed_data_disks
    vm_additional_tags                   = var.vm_additional_tags
    administrator_user_name              = var.administrator_user_name
    source_image_reference_offer         = "WindowsServer"          # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer
    source_image_reference_publisher     = "MicrosoftWindowsServer" # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer  
    source_image_reference_sku           = "2016-Datacenter"        # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer 
    source_image_reference_version       = "latest"        
    subnet                               = module.networking.map_subnets.subnet1.id
    key_vault_id                         = var.key_vault_id
    key_vault_name                       = var.key_vault_name
    soft_delete_retention_days = var.soft_delete_retention_days      
    depends_on = [
     module.networking 
    ]
}