resource_group_name = "rg-we-idn-dc-01"

windows_vms = {
  DC1 = {
    name                                 = "pwdc01"
    computer_name                        = "PWDC01" #hostname has to be in uppercase letters
    vm_size                              = "Standard_D8s_v3"
    location                             = "westeurope"
    resource_group_name                  = "rg-we-idn-dc-01"
    assign_identity                      = true
    availability_set_key                 = null
    vm_nic_keys                          = ["nic1"]
    zone                                 = "1"
    source_image_reference_offer         = "WindowsServer"          # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer
    source_image_reference_publisher     = "MicrosoftWindowsServer" # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer  
    source_image_reference_sku           = "2019-Datacenter"        # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer 
    source_image_reference_version       = "latest"                 # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer             
    os_disk_name                         = "osdisk1-pwdc01"
    storage_os_disk_caching              = "None"
    managed_disk_type                    = "Premium_LRS"
    disk_size_gb                         = "128"
    write_accelerator_enabled            = null
    recovery_services_vault_name         = "rsv-we-identity"        #"tfex-recovery-vault"
    vm_backup_policy_name                = "policy-we-idn-daily-01" #"tfex-recovery-vault-policy"
    use_existing_disk_encryption_set     = false
    existing_disk_encryption_set_name    = null
    existing_disk_encryption_set_rg_name = null
    customer_managed_key_name            = null
    disk_encryption_set_name             = null
    enable_cmk_disk_encryption           = true # set it to true if you want to enable disk encryption using customer managed key
    enable_automatic_updates             = true
    custom_data_path                     = "//drivesetup.ps1"        #"//script_file.ps1" # Optional
    custom_data_args                     = { region = "westeurope" } #"{ name = "VMandVM", destination = "EASTUS2", version = "1.0" }    
  },
  DC2 = {
    name                                 = "pwdc02"
    computer_name                        = "PWDC02" #hostname has to be in uppercase letters
    vm_size                              = "Standard_D8s_v3"
    location                             = "westeurope"
    resource_group_name                  = "rg-we-idn-dc-01"
    assign_identity                      = true
    availability_set_key                 = null
    vm_nic_keys                          = ["nic2"]
    zone                                 = "2"
    source_image_reference_offer         = "WindowsServer"          # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer
    source_image_reference_publisher     = "MicrosoftWindowsServer" # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer  
    source_image_reference_sku           = "2019-Datacenter"        # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer 
    source_image_reference_version       = "latest"                 # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer             
    os_disk_name                         = "osdisk1-pwdc02"
    storage_os_disk_caching              = "None"
    managed_disk_type                    = "Premium_LRS"
    disk_size_gb                         = "128"
    write_accelerator_enabled            = null
    recovery_services_vault_name         = "rsv-we-identity"        #"tfex-recovery-vault"
    vm_backup_policy_name                = "policy-we-idn-daily-01" #"tfex-recovery-vault-policy"
    use_existing_disk_encryption_set     = false
    existing_disk_encryption_set_name    = null
    existing_disk_encryption_set_rg_name = null
    customer_managed_key_name            = null
    disk_encryption_set_name             = null
    enable_cmk_disk_encryption           = true # set it to true if you want to enable disk encryption using customer managed key
    enable_automatic_updates             = true
    custom_data_path                     = "//drivesetup.ps1"        #"//script_file.ps1" # Optional
    custom_data_args                     = { region = "westeurope" } #"{ name = "VMandVM", destination = "EASTUS2", version = "1.0" }
  },
  # delete AD connect and AD connect 1 after 14 days backup has been removed

  ADconnect = {
    name                                 = "pwadconnect01"
    computer_name                        = "PWADCO01" #hostname has to be in uppercase letters
    vm_size                              = "Standard_D8s_v3"
    location                             = "westeurope"
    resource_group_name                  = "rg-we-idn-dc-01"
    assign_identity                      = true
    availability_set_key                 = null
    vm_nic_keys                          = ["nic3"]
    zone                                 = "1"
    source_image_reference_offer         = "WindowsServer"          # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer
    source_image_reference_publisher     = "MicrosoftWindowsServer" # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer  
    source_image_reference_sku           = "2019-Datacenter"        # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer 
    source_image_reference_version       = "latest"                 # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer             
    os_disk_name                         = "osdisk1-pwadconnect01"
    storage_os_disk_caching              = "ReadWrite"
    managed_disk_type                    = "Premium_LRS"
    disk_size_gb                         = "128"
    write_accelerator_enabled            = null
    recovery_services_vault_name         = "rsv-we-identity"        #"tfex-recovery-vault"
    vm_backup_policy_name                = "policy-we-idn-daily-01" #"tfex-recovery-vault-policy"
    use_existing_disk_encryption_set     = false
    existing_disk_encryption_set_name    = null
    existing_disk_encryption_set_rg_name = null
    customer_managed_key_name            = null
    disk_encryption_set_name             = null
    enable_cmk_disk_encryption           = true # set it to true if you want to enable disk encryption using customer managed key
    enable_automatic_updates             = true
    custom_data_path                     = "//drivesetup.ps1"        #"//script_file.ps1" # Optional
    custom_data_args                     = { region = "westeurope" } #"{ name = "VMandVM", destination = "EASTUS2", version = "1.0" }
  }
  ADconnect1 = {
    name                                 = "pwadconnect02"
    computer_name                        = "PWADCO02" #hostname has to be in uppercase letters
    vm_size                              = "Standard_D8s_v3"
    location                             = "westeurope"
    resource_group_name                  = "rg-we-idn-dc-01"
    assign_identity                      = true
    availability_set_key                 = null
    vm_nic_keys                          = ["nic4"]
    zone                                 = "1"
    source_image_reference_offer         = "WindowsServer"          # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer
    source_image_reference_publisher     = "MicrosoftWindowsServer" # set this to null if you are  using image id from shared image gallery or if you are passing image id to the VM through packer  
    source_image_reference_sku           = "2019-Datacenter"        # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer 
    source_image_reference_version       = "latest"                 # set this to null if you are using image id from shared image gallery or if you are passing image id to the VM through packer             
    os_disk_name                         = "osdisk1-pwadconnect02"
    storage_os_disk_caching              = "ReadWrite"
    managed_disk_type                    = "Premium_LRS"
    disk_size_gb                         = "128"
    write_accelerator_enabled            = null
    recovery_services_vault_name         = "rsv-we-identity"        #"tfex-recovery-vault"
    vm_backup_policy_name                = "policy-we-idn-daily-01" #"tfex-recovery-vault-policy"
    use_existing_disk_encryption_set     = false
    existing_disk_encryption_set_name    = null
    existing_disk_encryption_set_rg_name = null
    customer_managed_key_name            = null
    disk_encryption_set_name             = null
    enable_cmk_disk_encryption           = true # set it to true if you want to enable disk encryption using customer managed key
    enable_automatic_updates             = true
    custom_data_path                     = "//drivesetup.ps1"        #"//script_file.ps1" # Optional
    custom_data_args                     = { region = "westeurope" } #"{ name = "VMandVM", destination = "EASTUS2", version = "1.0" }
  }
}

windows_vm_nics = {
  nic1 = {
    name                           = "nic1-pwdc01"
    subnet_name                    = "snet-we-idn-DC"
    location                       = "westeurope"
    resource_group_name            = "rg-we-idn-dc-01"
    vnet_name                      = null
    networking_resource_group      = "[__networking_resoure_group_name__]"
    lb_backend_pool_names          = null
    lb_nat_rule_names              = null
    app_security_group_names       = null
    app_gateway_backend_pool_names = null
    internal_dns_name_label        = null
    enable_ip_forwarding           = null # set it to true if you want to enable IP forwarding on the NIC
    enable_accelerated_networking  = null # set it to true if you want to enable accelerated networking
    dns_servers                    = null
    nic_ip_configurations = [
      {
        static_ip = "xx.xx.xx.4"
        name      = "privateip-we-idn-pwdc01"
      }
    ]
  },
  nic2 = {
    name                           = "nic1-pwdc02"
    subnet_name                    = "snet-we-idn-DC"
    location                       = "westeurope"
    resource_group_name            = "rg-we-idn-dc-01"
    vnet_name                      = null
    networking_resource_group      = "[__networking_resoure_group_name__]"
    lb_backend_pool_names          = null
    lb_nat_rule_names              = null
    app_security_group_names       = null
    app_gateway_backend_pool_names = null
    internal_dns_name_label        = null
    enable_ip_forwarding           = null # set it to true if you want to enable IP forwarding on the NIC
    enable_accelerated_networking  = null # set it to true if you want to enable accelerated networking
    dns_servers                    = null
    nic_ip_configurations = [
      {
        static_ip = "xx.xx.xx.5"
        name      = "privateip-we-idn-pwdc02"
      }
    ]
  },
  nic3 = {
    name                           = "nic1-pwadconnect01"
    subnet_name                    = "snet-we-idn-DC"
    location                       = "westeurope"
    resource_group_name            = "rg-we-idn-dc-01"
    vnet_name                      = null
    networking_resource_group      = "[__networking_resoure_group_name__]"
    lb_backend_pool_names          = null
    lb_nat_rule_names              = null
    app_security_group_names       = null
    app_gateway_backend_pool_names = null
    internal_dns_name_label        = null
    enable_ip_forwarding           = null # set it to true if you want to enable IP forwarding on the NIC
    enable_accelerated_networking  = null # set it to true if you want to enable accelerated networking
    dns_servers                    = null
    nic_ip_configurations = [
      {
        static_ip = "xx.xx.xx.6"
        name      = "privateip-we-idn-pwadconnect01"
      }
    ]
  }
  nic4 = {
    name                           = "nic1-pwadconnect02"
    subnet_name                    = "snet-we-idn-AAD-connect"
    location                       = "westeurope"
    resource_group_name            = "rg-we-idn-dc-01"
    vnet_name                      = null
    networking_resource_group      = "[__networking_resoure_group_name__]"
    lb_backend_pool_names          = null
    lb_nat_rule_names              = null
    app_security_group_names       = null
    app_gateway_backend_pool_names = null
    internal_dns_name_label        = null
    enable_ip_forwarding           = null # set it to true if you want to enable IP forwarding on the NIC
    enable_accelerated_networking  = null # set it to true if you want to enable accelerated networking
    dns_servers                    = null
    nic_ip_configurations = [
      {
        static_ip = "xx.xx.xx.36"
        name      = "privateip-we-idn-pwadconnect02"
      }
    ]
  }
}

administrator_user_name = "dcadmin"
diagnostics_sa_name     = null

managed_data_disks = {
  "disk1" = {
    disk_name                 = "datadisk1-pwdc01"
    vm_key                    = "DC1"
    lun                       = 0
    storage_account_type      = "Standard_LRS"
    disk_size                 = "128"
    caching                   = "None"
    write_accelerator_enabled = false
    create_option             = null
    os_type                   = null
    source_resource_id        = null
    location                  = "westeurope"
    resource_group_name       = "rg-we-idn-dc-01"
  },
  "disk2" = {
    disk_name                 = "datadisk1-pwdc02"
    vm_key                    = "DC2"
    lun                       = 0
    storage_account_type      = "Standard_LRS"
    disk_size                 = "128"
    caching                   = "None"
    write_accelerator_enabled = false
    create_option             = null
    os_type                   = null
    source_resource_id        = null
    location                  = "westeurope"
    resource_group_name       = "rg-we-idn-dc-01"
  },
  # "disk3" = {
  #   disk_name                 = "datadisk1-pwadconnect01"
  #   vm_key                    = "ADconnect"
  #   lun                       = 0
  #   storage_account_type      = "Standard_LRS"
  #   disk_size                 = "128"
  #   caching                   = "None"
  #   write_accelerator_enabled = false
  #   create_option             = null
  #   os_type                   = null
  #   source_resource_id        = null
  #   location                       = "westeurope"
  #   resource_group_name            = "rg-we-idn-dc-01"
  # }, 
  "disk4" = {
    disk_name                 = "datadisk1-pwadconnect02"
    vm_key                    = "ADconnect1"
    lun                       = 0
    storage_account_type      = "Standard_LRS"
    disk_size                 = "128"
    caching                   = "None"
    write_accelerator_enabled = false
    create_option             = null
    os_type                   = null
    source_resource_id        = null
    location                  = "westeurope"
    resource_group_name       = "rg-we-idn-dc-01"
  },
}

vm_additional_tags = {
  iac            = "Terraform"
  env            = "dc-prod"
  automated_by   = ""
  monitor_enable = true
}