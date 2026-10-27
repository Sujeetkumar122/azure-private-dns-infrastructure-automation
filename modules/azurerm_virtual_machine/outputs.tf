output "nic_ids" {
  value = { for k, v in azurerm_network_interface.nic : k => v.id }
}
output "nic_ip_configurations" {
  value = { for k, v in azurerm_network_interface.nic : k => v.ip_configuration[0].name }
}

output "vm_admin_password" {
  value     = random_password.vm_password.result
  sensitive = true
}


output "vm_private_ips" {
  description = "Private IP addresses of all VM NICs"

  value = {
    for key, nic in azurerm_network_interface.nic :
    nic.name => nic.private_ip_address
  }
}