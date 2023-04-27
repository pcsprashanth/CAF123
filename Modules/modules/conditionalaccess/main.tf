# data "azuread_users" "excludedusers" {
#   for_each = var.conditional_access
#   user_principal_names = lookup(each.value, "excluded_user_principal_names",null)
# }

# data "azuread_users" "includedusers" {
#   for_each = var.conditional_access
#   user_principal_names = lookup(each.value, "included_user_principal_names",null)
# }

resource "azuread_conditional_access_policy" "this" {
  for_each = var.conditional_access

  display_name = each.value["display_name"]
  state        = each.value["state"]
  conditions {
    applications {
      included_applications = lookup(each.value, "included_applications", ["all"])
      excluded_applications = lookup(each.value, "excluded_applications", null)
    }
    locations {
      included_locations = lookup(each.value, "included_locations", ["All"])
      excluded_locations = lookup(each.value, "excluded_locations", null)
    }
    platforms {
      included_platforms = lookup(each.value, "included_platforms", ["all"])
      excluded_platforms = lookup(each.value, "excluded_platforms", null)
    }
    users {
      # included_users = lookup(each.value, "included_user_principal_names",null) == null ? lookup(each.value, "included_users", null) : lookup(data.azuread_users.includedusers, each.key)["object_ids"] 
      included_users = lookup(each.value, "included_users", ["All"])
      # excluded_users = lookup(each.value, "excluded_user_principal_names",null) == null ? lookup(each.value, "excluded_users", null) : lookup(data.azuread_users.excludedusers, each.key)["object_ids"] 
      excluded_users = lookup(each.value, "excluded_users",null)
      included_roles = lookup(each.value, "included_roles", null)
      excluded_roles = lookup(each.value, "excluded_roles", null)
      included_groups = lookup(each.value, "included_groups", null)
      excluded_groups = lookup(each.value, "excluded_groups", null)
    }
    client_app_types = lookup(each.value, "client_app_types", ["all"])
    user_risk_levels = lookup(each.value, "user_risk_levels", null)
    sign_in_risk_levels = lookup(each.value, "sign_in_risk_levels", null)
  }
  grant_controls {
    built_in_controls = lookup(each.value, "built_in_controls", ["unknownFutureValue"])
    operator          = lookup(each.value, "operator", "OR")
  }
  session_controls {
    sign_in_frequency        = lookup(each.value, "sign_in_frequency", 0)
    sign_in_frequency_period = lookup(each.value, "sign_in_frequency_period", "hours")
  }
}