variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to the Application Gateway should exist. Changing this forces a new resource to be created."
  }
variable "location"{
  type = string
}

variable "public_ip_name" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "application_gateway" {
  type = map(object({
    application_gateway_name = string
    zones = list(string)
    subnet_name               = string
    autoscale_configuration =list(object({
      min_capacity = number
      max_capacity = number
    }))
    backend_address_pool =list(object({
      backend_ip_addresses = list(string)
    }))

    backend_http_settings = list(object({
      
      path                  = string
    probe_name = string
      
      }))

    # gateway_ip_configuration = list(object({
    # gateway_ip_configuration_subnet_id = string
    # }))

  probe = list(object({
    name = string
    probe_host = string
    probe_interval = number
    probe_protocol = string
    probe_path = string
    probe_timeout = number
    probe_unhealthy_threshold = string
   
  }))
    
    frontend_port = string
     
    firewall_mode = string
  }))
}
