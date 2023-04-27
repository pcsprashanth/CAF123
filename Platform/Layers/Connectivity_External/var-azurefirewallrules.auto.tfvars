networking_resource_group = "rg-we-connectivityvnet-external"
# firewall_name = "afw-we-connectivityhubfw-external"
firewall_policy = "afw-we-connectivityhubfw-policy-external"

firewall_policy_rule_collection_group = {
  "fwprc1" = {
    name = "network-fwpolicy-rcg"
    network_rule_collection_action = "Allow"
    network_rule_collection_name = "ExternalNetworkRuleCollectionGroup"
    network_rule_collection_priority = 100
    priority = 100
    rules = [ 
      {
          destination_addresses = [ "xx.xx.xx.0/27" ]
          destination_ports = [ "*" ]
          name = "rule1"
          protocols = [ "Any" ]
          source_addresses = [ "xx.xx.xx.0/24" ]
    } 
    ]
  }
}