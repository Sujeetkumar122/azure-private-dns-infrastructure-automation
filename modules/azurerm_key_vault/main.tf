# resource "azurerm_key_vault" "kv" {
#   for_each                   = var.key_vaults
#   name                       = each.value.name
#   location                   = each.value.location
#   resource_group_name        = each.value.rg_name
#   tenant_id                  = data.azurerm_client_config.current.tenant_id
#   sku_name                   = lookup(each.value, "sku_name", "standard")
#   soft_delete_retention_days = lookup(each.value, "soft_delete_retention_days", 7)
#   purge_protection_enabled   = lookup(each.value, "purge_protection_enabled", true)
#   rbac_authorization_enabled = lookup(each.value, "rbac_authorization_enabled", true)

#   dynamic "access_policy" {
#     for_each = lookup(each.value, "rbac_authorization_enabled", true) ? [] : [1]
#     content {
#       tenant_id = data.azurerm_client_config.current.tenant_id
#       object_id = data.azurerm_client_config.current.object_id

#       secret_permissions = [
#         "Get",
#         "List",
#         "Set",
#         "Delete",
#         "Purge",
#         "Recover"
#       ]
#     }
#   }
# }

# resource "random_password" "password" {
#   for_each         = var.key_vaults
#   length           = 16
#   special          = true
#   override_special = "!#$%&*()-_=+[]{}<>:?"
# }

# resource "azurerm_key_vault_secret" "admin_password" {
#   for_each     = var.key_vaults
#   name         = each.value.secret_name
#   value        = lookup(each.value, "secret_value", random_password.password[each.key].result)
#   key_vault_id = azurerm_key_vault.kv[each.key].id
# }
