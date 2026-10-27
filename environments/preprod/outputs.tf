output "vm_admin_password" {
  description = "Generated VM admin password"
  value       = module.virtual_machines.vm_admin_password
  sensitive   = true
}
output "debug_vm_private_ips" {
  value = module.virtual_machines.vm_private_ips
}