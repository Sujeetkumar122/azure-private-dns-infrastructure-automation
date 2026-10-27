output "vnet_ids" {
  description = "Map of Virtual Network IDs"
  value       = { for k, v in azurerm_virtual_network.vnets : k => v.id }
}
