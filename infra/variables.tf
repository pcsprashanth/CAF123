# Use variables to customize the deployment

variable "root_id" {
  type    = string
  default = "mg-itaudev"
}

 
variable "root_name" {
  type    = string
  default = "Itaudev"
}

##### Subscription #######

# variable "subscriptions" {
#  type = map(object({
#    subscription_name = string
#    alias             = string
#    workload          = string
#    tags              = map(string)
#  }))
# }

 

variable "subscription_scope" {
  type        = string
  default     = "/subscriptions/25229114-2ec3-4b44-bb5b-649a554894bc"
  }