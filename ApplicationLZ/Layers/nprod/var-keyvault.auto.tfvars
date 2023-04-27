kv_rg_name = "rg-we-lznprd-dummy"

key_vault_name                  = "kv-we-lznprd-01"
enabled_for_deployment          = true
enabled_for_disk_encryption     = true
enabled_for_template_deployment = true
soft_delete_retention_days      = 7
purge_protection_enabled        = true
# enable_rbac_authorization       = true
sku_name                        = "standard"
secrets                         = {}
access_policies = {
  # "accesspolicy1" = {
  #   certificate_permissions = [ "Get","List","Set" ]
  #   group_names = []
  #   key_permissions = [ "Get","List","Set" ]
  #   object_ids = "fa38bda3-a8e6-421e-a37b-39fa582d3648"
  #   secret_permissions = [ "Get","List","Set" ]
  #   storage_permissions = []
  #   user_principal_names = []
  # }
}
network_acls                    = null

# The value below is REQUIRED when using MSI rather than SPN. 
msi_object_id = "06738023-c888-427d-a517-5c01a330d17c"

kv_additional_tags = {
  pe_enable    = true
  iac          = "Terraform"
  env          = "nprod"
  automated_by = ""
}