data "azurerm_resource_group" "this" {
  name  = var.resource_group_name
}

data "azurerm_subnet" "this" {
  for_each             = var.application_gateway
  name                 = each.value.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_public_ip" "this" {
  /*for_each = var.PublicIP*/
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  #   tags = {
  #     environment = "Production"
  #   }
}


resource "azurerm_application_gateway" "this" {
 for_each = var.application_gateway
  name                = each.value["application_gateway_name"]
  resource_group_name = var.resource_group_name
  location            = var.location
  # tags                = merge(local.tags, var.tags)

  zones = each.value.zones

  sku {
    name = "WAF_v2"
    tier = "WAF_v2"
    # capacity = var.sku_capacity
  }


dynamic "autoscale_configuration" {
  for_each = lookup(each.value, "autoscale_configuration")

 /* for_each = var.application_gateway["autoscale_configuration"]*/
  content{
    min_capacity = autoscale_configuration.value.min_capacity
    max_capacity = autoscale_configuration.value.max_capacity
  }
  }

  enable_http2 = true

   frontend_ip_configuration {
    name                 = "${each.value["application_gateway_name"]}-FrontEndIP"
    public_ip_address_id = azurerm_public_ip.this.id
  }

  dynamic "backend_address_pool" {
    for_each = lookup(each.value, "backend_address_pool")
    /*for_each = var.application_gateway["backend_address_pool"]*/
    content{
      name = "${each.value["application_gateway_name"]}-bep"
      ip_addresses = backend_address_pool.value.backend_ip_addresses
    }

  }
    request_routing_rule {
    name                      = "${each.value["application_gateway_name"]}-route"
    priority                  = 10
    rule_type                 = "Basic"
    http_listener_name        = "${each.value["application_gateway_name"]}-listener"
    backend_address_pool_name = "${each.value["application_gateway_name"]}-bep"
    backend_http_settings_name = "${each.value["application_gateway_name"]}-httpbe"
    # url_path_map_name          = var.rule_type == "Basic" ? "" : "${var.application_gateway_name}-route"
  }

  frontend_port {
    name = "${each.value["application_gateway_name"]}-fep"
    port = "80"
  }
  http_listener {
    name                           = "${each.value["application_gateway_name"]}-listener"
    frontend_ip_configuration_name = "${each.value["application_gateway_name"]}-FrontEndIP"
    frontend_port_name             = "${each.value["application_gateway_name"]}-fep"
    protocol                       = "Http"
    # ssl_certificate_name           = var.ssl_certificate_name
    # host_name                      = var.rule_type == "Basic" ? "" : var.public_ip_address_name
  }
  dynamic "backend_http_settings" {
for_each = lookup(each.value, "backend_http_settings")
content{
     name                  = "${each.value["application_gateway_name"]}-httpbe"
    cookie_based_affinity = "Disabled" #"Disabled"
    path                  = backend_http_settings.value["path"]   #"/path1/"
    port                  = "80"       #80
    protocol              = "Http"
    request_timeout       = "20"
    # host_name             = var.backend_http_settings_host_name
    probe_name = backend_http_settings.value["probe_name"]
    connection_draining {
      enabled = false
      drain_timeout_sec = "5"

    }
}

}
  
dynamic "gateway_ip_configuration"{
  for_each = var.application_gateway
 /* for_each = var.application_gateway["gateway_ip_configuration"]*/
  content{
    name      = "${each.value["application_gateway_name"]}-gwconf"
    subnet_id = lookup(data.azurerm_subnet.this, each.key)["id"]
  }
}

dynamic "probe"{
  for_each = lookup(each.value, "probe")
   /*for_each = var.application_gateway["probe"]*/
   content{
    name                                      = probe.value["name"]
    host                                      = probe.value["probe_host"]
    interval                                  = probe.value["probe_interval"]
    protocol                                  = probe.value["probe_protocol"]
    path                                      = probe.value["probe_path"]
    timeout                                   = probe.value["probe_timeout"]
    unhealthy_threshold                       = probe.value["probe_unhealthy_threshold"]
    # pick_host_name_from_backend_http_settings = var.probe_pick_host_name_from_backend_http_settings
    match {
      body        = ""
      status_code = ["200-399"]
    }
  }
 }

  waf_configuration {
    enabled                  = true
    firewall_mode            = "Prevention"
    rule_set_type            = "OWASP"
    rule_set_version         = "3.2"
    max_request_body_size_kb = "128"
    file_upload_limit_mb     = "100"

  }


}
