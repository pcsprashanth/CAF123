# Configure the connectivity resources settings.
locals {
  configure_connectivity_resources = {
    settings = {
      hub_networks = [
        {
          enabled = true
          config = {
            address_space                = ["xx.xxx.x.0/22", ]
            location                     = ""
            link_to_ddos_protection_plan = true
            dns_servers                  = []
            bgp_community                = ""
            subnets                      = [
              {
                name                      = "snet-we-connectivityhubvnet-ext-PE"
                address_prefixes          = ["xx.xx.xx.0/24", ]
                network_security_group_id = null
                route_table_id            = null
              },
              {
                name                      = "snet-we-connectivityhubvnet-ext-AppGateway"
                address_prefixes          = ["xx.xx.xx.0/24", ]
                network_security_group_id = null
                route_table_id            = null
              },
            ]
            azure_firewall = {
              enabled = true
              config = {
                address_prefix                = "xx.xxx.x.0/24"
                enable_dns_proxy              = true
                dns_servers                   = []
                sku_tier                      = "Premium"
                base_policy_id                = ""
                private_ip_ranges             = []
                threat_intelligence_mode      = ""
                threat_intelligence_allowlist = []
                availability_zones = {
                  zone_1 = true
                  zone_2 = true
                  zone_3 = true
                }
              }
            }
            spoke_virtual_network_resource_ids      = [
              "/subscriptions/xxxxxxxxxxxxxxxxxxxxxxxx/resourceGroups/rg-we-idn-vnet/providers/Microsoft.Network/virtualNetworks/vnet-we-idn-domaincontroller",
              "/subscriptions/xxxxxxxxxxxxxxxxxxxxxxxx/resourceGroups/rg-we-lznprd-dummy/providers/Microsoft.Network/virtualNetworks/vnet-we-lznprd-dummy"
            ]
            enable_outbound_virtual_network_peering = true
            enable_hub_network_mesh_peering         = false
          }
        },
      ]
      ddos_protection_plan = {
        enabled = true
        config = {
          location = ""
        }
      }
      dns = {
        enabled = false
        config = {
          location = null
          enable_private_link_by_service = {
            azure_api_management                 = true
            azure_app_configuration_stores       = true
            azure_arc                            = true
            azure_automation_dscandhybridworker  = true
            azure_automation_webhook             = true
            azure_backup                         = true
            azure_batch_account                  = true
            azure_bot_service_bot                = true
            azure_bot_service_token              = true
            azure_cache_for_redis                = true
            azure_cache_for_redis_enterprise     = true
            azure_container_registry             = true
            azure_cosmos_db_cassandra            = true
            azure_cosmos_db_gremlin              = true
            azure_cosmos_db_mongodb              = true
            azure_cosmos_db_sql                  = true
            azure_cosmos_db_table                = true
            azure_data_explorer                  = true
            azure_data_factory                   = true
            azure_data_factory_portal            = true
            azure_data_health_data_services      = true
            azure_data_lake_file_system_gen2     = true
            azure_database_for_mariadb_server    = true
            azure_database_for_mysql_server      = true
            azure_database_for_postgresql_server = true
            azure_digital_twins                  = true
            azure_event_grid_domain              = true
            azure_event_grid_topic               = true
            azure_event_hubs_namespace           = true
            azure_file_sync                      = true
            azure_hdinsights                     = true
            azure_iot_dps                        = true
            azure_iot_hub                        = true
            azure_key_vault                      = true
            azure_key_vault_managed_hsm          = true
            azure_kubernetes_service_management  = true
            azure_machine_learning_workspace     = true
            azure_media_services                 = true
            azure_migrate                        = true
            azure_monitor                        = true
            azure_purview_account                = true
            azure_purview_studio                 = true
            azure_relay_namespace                = true
            azure_search_service                 = true
            azure_service_bus_namespace          = true
            azure_site_recovery                  = true
            azure_sql_database_sqlserver         = true
            azure_synapse_analytics_dev          = true
            azure_synapse_analytics_sql          = true
            azure_synapse_studio                 = true
            azure_web_apps_sites                 = true
            azure_web_apps_static_sites          = true
            cognitive_services_account           = true
            microsoft_power_bi                   = true
            signalr                              = true
            signalr_webpubsub                    = true
            storage_account_blob                 = true
            storage_account_file                 = true
            storage_account_queue                = true
            storage_account_table                = true
            storage_account_web                  = true
          }
          private_link_locations = [
            "northeurope",
            "westeurope",
          ]
          public_dns_zones                                       = []
          private_dns_zones                                      = []
          enable_private_dns_zone_virtual_network_link_on_hubs   = false
          enable_private_dns_zone_virtual_network_link_on_spokes = false
        }
      }
    }
    location = var.connectivity_resources_location
    tags     = var.connectivity_resources_tags
    advanced = {
        custom_settings_by_resource_type = {
          azurerm_resource_group = {
            connectivity = {
              (var.connectivity_resources_location) = {
                name = "rg-we-connectivityvnet-external"
              }
          },
            ddos = {
              (var.connectivity_resources_location) = {
                name = "rg-we-ddos-internal"
              }
          }
        },
        azurerm_virtual_network = {
          connectivity = {
              (var.connectivity_resources_location) = {
                name = "vnet-we-connectivityhub-external"           
              }, 
          }
        },
        azurerm_network_ddos_protection_plan = {
          ddos = {
              (var.connectivity_resources_location) = {
                name = "ddos-we-plan-external"           
              }, 
          }
        },
        azurerm_public_ip = {
          connectivity = {
              (var.connectivity_resources_location) = {
                name = "pip-we-firewallip-external"           
              }, 
          }
        },
        azurerm_firewall = {
          connectivity = {
              (var.connectivity_resources_location) = {
                name = "afw-we-connectivityhubfw-external"           
              }, 
          }
        },
        azurerm_firewall_policy = {
          connectivity = {
              (var.connectivity_resources_location) = {
                name = "afw-we-connectivityhubfw-policy-external"           
              }, 
          }
        },
        ##for custom peering names
        # azurerm_virtual_network_peering = {
        #   connectivity = {
        #       (var.connectivity_resources_location) = {                     # replace `location` with the location of the hub_network
        #         "spoke_network_resource_id" = {  # replace `spoke_network_resource_id` with the Resource ID of the spoke network
        #           name = "vnpeer-uks-hub"
        #       }
        #     }
        #   }
        # },
      }
    }
  }
}