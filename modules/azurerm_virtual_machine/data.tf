data "azurerm_subnet" "subnet" {
  for_each             = var.vms
  name                 = each.value.nic_subnet_name
  virtual_network_name = each.value.nic_vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_key_vault" "kv" {
  # for_each            = var.vms
  name                = "kv-dev-corp"
  resource_group_name = "rg-dev"
}

data "azurerm_key_vault_secret" "username" {

  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kv.id
}

# data "azurerm_key_vault_secret" "password" {
#   name         = "vm-password2"
#   key_vault_id = data.azurerm_key_vault.kv.id
# }



# resource "random_password" "vm_password" {
#   # for_each         = var.vms
#   length           = 24
#   special          = true
#   min_upper        = 2
#   min_lower        = 2
#   min_numeric      = 2
#   min_special      = 2
#   override_special = "!#$%&*()-_=+[]{}<>:?"

#   keepers = {
#     rotation_version = var.password_rotation_version
#   }
# }
