
resource "azurerm_private_dns_zone" "dns" {
  for_each = var.dns_zones

  name                = each.value.dns_zone_name
  resource_group_name = each.value.rg_name
}


resource "azurerm_private_dns_zone_virtual_network_link" "dns_link" {
  for_each = var.dns_zones

  name                  = "${each.key}-vnet-link"
  private_dns_zone_id = azurerm_private_dns_zone.dns[each.key].id
  virtual_network_id    = each.value.vnet_id
  registration_enabled  = false
}

resource "azurerm_private_dns_a_record" "a_record" {
  for_each = var.dns_zones
  name                = each.value.a_record_name
  private_dns_zone_id = azurerm_private_dns_zone.dns[each.key].id
  ttl                 = each.value.ttl
  records = [var.vm_private_ips[each.value.nicname]]
}
