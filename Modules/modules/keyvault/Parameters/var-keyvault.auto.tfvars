kv_rg_name = "[__resource_group_name__]"

name                            = "[__key_vault_name__]"
enabled_for_deployment          = null
enabled_for_disk_encryption     = null
enabled_for_template_deployment = null
soft_delete_retention_days      = 7
purge_protection_enabled        = true
sku_name                        = "standard"
secrets                         = {}
access_policies                 = {}
network_acls                    = null

# The value below is REQUIRED when using MSI rather than SPN. 
msi_object_id = "[__msi_object_id__]"

kv_additional_tags = {
  pe_enable    = true
  iac          = "Terraform"
  env          = "uat"
  automated_by = ""
}