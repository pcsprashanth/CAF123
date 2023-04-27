/*
resource_group_name = "[__resource_group_name__]"
#tenantId            = "[__tenant_id__]"

storage_accounts = {
  sa1 = {
    name                     = "[__storage_account_name__]"
    sku                      = ""
    account_kind             = null
    access_tier              = null
    assign_identity          = true
    cmk_enable               = true
    min_tls_version          = ""
    large_file_share_enabled = false
    is_hns_enabled           = false
    network_rules = {
     bypass                     = ["None"]
      default_action             = "Deny"
      ip_rules                   = null
      virtual_network_subnet_ids = ["/subscriptions/[__ado_subscription_id__]/resourceGroups/[__ado_resource_group_name__]/providers/Microsoft.Network/virtualNetworks/[__ado_vnet_name__]/subnets/[__ado_agent_subnet_name__]"]
    }
  }
}

containers = {
  container1 = {
    name                  = ""
    storage_account_name  = "[__storage_account_name__]"
    container_access_type = null
  }
}

# blobs = {
#   blob1 = {
#     name                   = ""
#     storage_account_name   = ""
#     storage_container_name = ""
#     type                   = "Block"
#     size                   = null
#     content_type           = null
#     source_uri             = null
#     metadata               = {}
#   }
# }

# queues = {
#   queue1 = {
#     name                 = ""
#     storage_account_name = ""
#   }
# }

# file_shares = {
#   share1 = {
#     name                 = ""
#     storage_account_name = ""
#     quota                = "512"
#   }
# }

# tables = {
#   table1 = {
#     name                 = ""
#     storage_account_name = ""
#   }
# }

# ado_private_endpoints = {
#   ape1 = {
#     name          = ""
#     resource_name = ""
#     group_ids     = ["blob"]
#     dns_zone_name = ""
#   },
#   ape2 = {
#     name          = ""
#     resource_name = ""
#     group_ids     = ["file"]
#     dns_zone_name = ""
#   },
#   ape3 = {
#     name          = ""
#     resource_name = ""
#     group_ids     = [""]
#     dns_zone_name = ""
#   },
#   ape4 = {
#     name          = ""
#     resource_name = ""
#     group_ids     = [""]
#     dns_zone_name = ""
#   }
# }


ado_resource_group_name = "[__ado_resource_group_name__]"
ado_vnet_name           = "[__ado_vnet_name__]"
ado_subnet_name         = "[__ado_subnet_name__]"
ado_subnet_id           = "/subscriptions/[__ado_subscription_id__]/resourceGroups/[__ado_resource_group_name__]/providers/Microsoft.Network/virtualNetworks/[__ado_vnet_name__]/subnets/[__ado_subnet_name__]"
ado_subscription_id     = "[__ado_subscription_id__]"
key_vault_name          = "[__key_vault_name__]"
key_vault_id            = "/subscriptions/[__subscription_id__]/resourceGroups/[__resource_group_name__]/providers/Microsoft.KeyVault/vaults/[__key_vault_name__]"

sa_additional_tags = {
  iac          = "Terraform"
  env          = "nprod"
  automated_by = "ms"
}
*/