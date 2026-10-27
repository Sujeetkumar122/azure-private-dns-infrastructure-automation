resource "azurerm_network_interface" "nic2" {
  name                = "win-nic"
  location            = "centralindia"
  resource_group_name = "rg-preprod"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-preprod/providers/Microsoft.Network/virtualNetworks/vnet-preprod/subnets/frontend-subnet-preprod"
        private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm-window" {
  name                = "window-vm"
  resource_group_name = "rg-preprod" 
  location            = "centralindia"
  size                = "Standard_D2s_v5"
  admin_username      = data.azurerm_key_vault_secret.username.value
  admin_password      = random_password.vm_password.result
  network_interface_ids = [
    azurerm_network_interface.nic2.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "random_password" "vm_password" {
  length           = 16
  special          = true
  min_upper        = 2
  min_lower        = 2
  min_numeric      = 2
  min_special      = 2
  override_special = "!#$%&*()-_=+[]{}<>:?"

#   keepers = {
#     rotation_version = var.password_rotation_version
#   }
}

resource "azurerm_key_vault_secret" "vm_passwordw" {
  name         = "vm-password-Win-vm"
  value        = random_password.vm_password.result
  key_vault_id = data.azurerm_key_vault.kv.id
  content_type    = "password"
  expiration_date = timeadd(timestamp(), "2160h") # 90 days
}

