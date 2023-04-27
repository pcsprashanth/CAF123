# Define variables
variable "vnet_peering" {
  type = map(object({
    #shared_subscription = string
    destination_vnet_name        = string
    destination_vnet_rg          = string
    remote_destination_virtual_network_id = string
    #remote_source_virtual_network_id = string
    source_vnet_name             = string
    source_vnet_rg               = string
    allow_forwarded_traffic      = bool
    allow_virtual_network_access = bool
    allow_gateway_transit        = bool
    use_remote_gateways          = bool
  }))
  description = "Specifies the map of objects for vnet peering."
  default     = {}
}
/*
variable "destination_vnet_subscription_id" {
  type        = list(string)
  description = "Specifies the destination virtual network subscription id."
  #default     = n
}
*/
variable "remote_virtual_network_id" {
  type        = string
  description = "Specifies the destination virtual network subscription id."
  
}
