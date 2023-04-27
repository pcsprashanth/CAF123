variable "conditional_access" {
  description = "Name of the Conditional access policy"
  type = map(object({
    display_name = string
    state        = string
    included_applications = list(string)
    excluded_applications = list(string)
    included_locations = list(string)
    excluded_locations = list(string)
    included_platforms = list(string)
    excluded_platforms = list(string)
    # excluded_user_principal_names = list(string)
    # included_user_principal_names = list(string)
    included_users = list(string)
    excluded_users = list(string)
    included_roles = list(string)
    excluded_roles = list(string)
    included_groups = list(string)
    excluded_groups = list(string)
    client_app_types = list(string)
    user_risk_levels = list(string)
    sign_in_risk_levels = list(string)
    built_in_controls = list(string)
    operator = string
    sign_in_frequency = number
    sign_in_frequency_period = string
  }))
}
