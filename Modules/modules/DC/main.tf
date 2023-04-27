data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {}

data "azurerm_virtual_machine" "dc1-vm" {
  name                = var.dcvm1
  resource_group_name = var.resource_group_name
}

data "azurerm_virtual_machine" "dc2-vm" {
  name                = var.dcvm2
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "dc1" {
  name         = "pwdc-xxxx01"
  key_vault_id = data.azurerm_key_vault.this.id
}

data "azurerm_key_vault_secret" "secret" {
  name         = "spnclientsecret"
  key_vault_id = data.azurerm_key_vault.this.id
}

data "azurerm_key_vault_secret" "appid" {
  name         = "AppID"
  key_vault_id = data.azurerm_key_vault.this.id
}


output "keyvault" {
  value = data.azurerm_key_vault_secret.dc1.value
}

# Generate Password for AD safe mode administrator
resource "random_password" "ad_safe_mode_administrator_password" {
  length           = 20
  min_upper        = 2
  min_lower        = 2
  min_special      = 2
  numeric          = true
  special          = true
  override_special = "!@#$%"
}

resource "random_password" "ad_admin_password" {
  length           = 20
  min_upper        = 2
  min_lower        = 2
  min_special      = 2
  numeric          = true
  special          = true
  override_special = "!@#$%"
}

resource "random_string" "storage" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_key_vault_secret" "ad_safe_mode_administrator_password" {
  depends_on = [
    random_password.ad_safe_mode_administrator_password
  ]
  name         = "adsafemodeadministratorpassword"
  value        = random_password.ad_safe_mode_administrator_password.result
  key_vault_id = data.azurerm_key_vault.this.id

  lifecycle {
    ignore_changes = [value]
  }
}

/*
resource "azurerm_key_vault_secret" "ad_admin_password" {
  depends_on = [
    random_password.ad_admin_password
  ]
  name         = "adadminpassword"
  value        = random_password.ad_admin_password.result
  key_vault_id = data.azurerm_key_vault.this.id

  lifecycle {
    ignore_changes = [value]
  }
}
*/

resource "azurerm_storage_account" "this" {
  name                     = "dcstorageaccount${random_string.storage.result}"
  resource_group_name      = data.azurerm_virtual_machine.dc1-vm.resource_group_name
  location                 = data.azurerm_virtual_machine.dc1-vm.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "this" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "container"
}

resource "azurerm_virtual_machine_extension" "dc1-vm-extension" {

  name                 = "${var.ad_dc1_name}-vm-active-directory"
  virtual_machine_id   = data.azurerm_virtual_machine.dc1-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  settings             = <<SETTINGS
  {
    "commandToExecute": "powershell.exe -Command \"${local.dc1_powershell_command}\"",
    "commandToExecute": "powershell.exe -Command \"${local.dc1_download_gpo_files}\""
  }
  SETTINGS
}


resource "azurerm_virtual_machine_extension" "dc2-vm-extension" {

  name                 = "${var.ad_dc2_name}-vm-active-directory"
  virtual_machine_id   = data.azurerm_virtual_machine.dc2-vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"
  settings             = <<SETTINGS
  {
    "commandToExecute": "powershell.exe -Command \"${local.dc2_powershell_command}\""
  }
  SETTINGS

  depends_on = [
    azurerm_virtual_machine_extension.dc1-vm-extension
  ]

}
