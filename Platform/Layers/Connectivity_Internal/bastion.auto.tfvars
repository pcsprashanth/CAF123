resource_group_name = "rg-we-connectivityvnet-internal"
virtual_network_name = "vnet-we-connectivityhub-internal"

# Azure bastion server requireemnts
azure_bastion_service_name          = "bastion-we-connectivityvnet-internal"
bastion_host_sku                    = "Standard"
scale_units                         = 10

pip_azure_bastion_service = "pip-we-bastion-internal"