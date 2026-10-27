module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_virtual_network"
  vnets      = var.vnets
}

module "subnets" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}

# module "key_vault" {
#   depends_on = [module.resource_group]
#   source     = "../../modules/azurerm_key_vault"
#   key_vaults = var.key_vaults
# }

module "virtual_machines" {
  depends_on = [module.subnets]
  source     = "../../modules/azurerm_virtual_machine"
  vms        = var.vms
}

module "bastion" {
  depends_on = [module.subnets, module.public_ip]
  source     = "../../modules/azurerm_bastion"
  bastions   = var.bastions
}

module "dns_zone" {
  depends_on     = [module.virtual_machines]
  source         = "../../modules/DNS_Zone"
  dns_zones      = var.dns_zones
  vm_private_ips = module.virtual_machines.vm_private_ips
}

module "win-vm" {
  depends_on = [ module.subnets ]
  source = "../../modules/windows_vm"

}
