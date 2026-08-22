resource "azurerm_subnet" "sbn" {
  #checkov:skip=CKV2_AZURE_31: NSG association handled separately or optional for dev environment
  for_each             = var.subnets
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}