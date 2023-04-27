variable "root_id" {
  type    = string
  default = "testkarni"
}

variable "root_name" {
  type    = string
  default = "testkarni"
}
variable "deploy_management_resources" {
  type    = bool
  default = true
}

variable "log_retention_in_days" {
  type    = number
  default = 180
}

variable "security_alerts_email_address" {
  type    = string
  default = "abcc@abc.com" # Replace this value with your own email address.
}

variable "management_resources_location" {
  type    = string
  default = "West Europe"
}

variable "management_resources_tags" {
  type = map(string)
  default = {
    demo_type = "deploy_management_resources_custom"
  }
}

