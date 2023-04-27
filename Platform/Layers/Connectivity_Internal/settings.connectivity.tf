# Configure the connectivity resources settings.
locals {
  configure_connectivity_resources = {
    settings = {
      hub_networks = [
        {
          enabled = true
          config = {
            address_space                = ["xx.xx.0.0/22", ]
            location                     = ""
            link_to_ddos_protection_plan = true
            dns_servers                  = []
            bgp_community                = ""
            subnets                      = [
              {
                name                      = "snet-we-connectivityhubvnet-int-PE"
                address_prefixes          = ["xx.xx.2.0/24", ]
                network_security_group_id = null
                route_table_id            = null
              },
              {
                name                      = "AzureBastionSubnet"
                address_prefixes          = ["xx.xx.3.0/25", ]
                network_security_group_id = null
                route_table_id            = null
              },
              {
                name                      = "snet-we-connectivityhubvnet-int-ado-self-hosted"
                address_prefixes          = ["xx.xx.3.128/25", ]
                network_security_group_id = null
                route_table_id            = null
              }
            ]
            azure_firewall = {
              enabled = true
              config = {
                address_prefix                = "xx.xx.1.0/24"
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
              "/xxxxxxxxxxxxxxxxxxxxxxxx/resourceGroups/rg-we-idn-vnet/providers/Microsoft.Network/virtualNetworks/vnet-we-idn-domaincontroller",
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
          # enable_private_link_by_service = {
          #   azure_api_management                 = false
          #   azure_app_configuration_stores       = false
          #   azure_arc                            = false
          #   azure_automation_dscandhybridworker  = false
          #   azure_automation_webhook             = false
          #   azure_backup                         = false
          #   azure_batch_account                  = false
          #   azure_bot_service_bot                = false
          #   azure_bot_service_token              = false
          #   azure_cache_for_redis                = false
          #   azure_cache_for_redis_enterprise     = false
          #   azure_container_registry             = false
          #   azure_cosmos_db_cassandra            = false
          #   azure_cosmos_db_gremlin              = false
          #   azure_cosmos_db_mongodb              = false
          #   azure_cosmos_db_sql                  = false
          #   azure_cosmos_db_table                = false
          #   azure_data_explorer                  = false
          #   azure_data_factory                   = false
          #   azure_data_factory_portal            = false
          #   azure_data_health_data_services      = false
          #   azure_data_lake_file_system_gen2     = false
          #   azure_database_for_mariadb_server    = false
          #   azure_database_for_mysql_server      = false
          #   azure_database_for_postgresql_server = false
          #   azure_digital_twins                  = false
          #   azure_event_grid_domain              = false
          #   azure_event_grid_topic               = false
          #   azure_event_hubs_namespace           = false
          #   azure_file_sync                      = false
          #   azure_hdinsights                     = false
          #   azure_iot_dps                        = false
          #   azure_iot_hub                        = false
          #   azure_key_vault                      = false
          #   azure_key_vault_managed_hsm          = false
          #   azure_kubernetes_service_management  = false
          #   azure_machine_learning_workspace     = false
          #   azure_media_services                 = false
          #   azure_migrate                        = false
          #   azure_monitor                        = false
          #   azure_purview_account                = false
          #   azure_purview_studio                 = false
          #   azure_relay_namespace                = false
          #   azure_search_service                 = false
          #   azure_service_bus_namespace          = false
          #   azure_site_recovery                  = false
          #   azure_sql_database_sqlserver         = false
          #   azure_synapse_analytics_dev          = false
          #   azure_synapse_analytics_sql          = false
          #   azure_synapse_studio                 = false
          #   azure_web_apps_sites                 = false
          #   azure_web_apps_static_sites          = false
          #   cognitive_services_account           = false
          #   microsoft_power_bi                   = false
          #   signalr                              = false
          #   signalr_webpubsub                    = false
          #   storage_account_blob                 = false
          #   storage_account_file                 = false
          #   storage_account_queue                = false
          #   storage_account_table                = false
          #   storage_account_web                  = false
          # }
          # private_link_locations = [
          #   "westeurope",
          # ]
          public_dns_zones                                       = []
          private_dns_zones                                      = []
          enable_private_dns_zone_virtual_network_link_on_hubs   = false
          # enable_private_dns_zone_virtual_network_link_on_spokes = false
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
                name = "rg-we-connectivityvnet-internal"
              }
          },
            ddos = {
              (var.connectivity_resources_location) = {
                name = "rg-we-ddos-internal"
              }
          }
            dns = {
              (var.connectivity_resources_location) = {
                name = "rg-we-dns-internal"
              }
          }
        },
        azurerm_virtual_network = {
          connectivity = {
              (var.connectivity_resources_location) = {
                name = "vnet-we-connectivityhub-internal"           
              }, 
          }
        },
        azurerm_network_ddos_protection_plan = {
          ddos = {
              (var.connectivity_resources_location) = {
                name = "ddos-we-plan-internal"           
              }, 
          }
        },
        azurerm_public_ip = {
          connectivity = {
              (var.connectivity_resources_location) = {
                name = "pip-we-firewallip-internal"           
              }, 
          }
        },
        azurerm_firewall = {
          connectivity = {
              (var.connectivity_resources_location) = {
                name = "afw-we-connectivityhubfw-internal"           
              }, 
          }
        },
        azurerm_firewall_policy = {
          connectivity = {
              (var.connectivity_resources_location) = {
                name = "afw-we-connectivityhubfw-policy-internal"           
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