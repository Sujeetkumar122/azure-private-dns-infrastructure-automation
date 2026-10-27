rgs = {
  rg1 = {
    name     = "rg-preprod"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-preprod"
    location            = "centralindia"
    resource_group_name = "rg-preprod"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  snet1 = {
    name                 = "frontend-subnet-preprod"
    resource_group_name  = "rg-preprod"
    virtual_network_name = "vnet-preprod"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-preprod"
    virtual_network_name = "vnet-preprod"
    address_prefixes     = ["10.0.4.0/26"]
  }
}

public_ips = {
  pip_bastion = {
    public_ip_name      = "pip-bastion-preprod"
    resource_group_name = "rg-preprod"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

vms = {
  frontend_1 = {
    nic_name        = "frontend-vm-nic-1-preprod"
    location        = "centralindia"
    rg_name         = "rg-preprod"
    nic_subnet_name = "frontend-subnet-preprod"
    nic_vnet_name   = "vnet-preprod"
    vm_name         = "frontend-vm-1-preprod"
    vm_size         = "Standard_D2ds_v4"
    # admin_username  = "devopsadmin"
    # key_vault_name  = "kv-dev-123"
    # secret_name     = "admin-password"
    image_publisher           = "Canonical"
    image_offer               = "0001-com-ubuntu-server-jammy"
    image_sku                 = "22_04-lts"
    image_version             = "latest"
    password_rotation_version = 3
  }
  #     frontend_2 = {
  #     nic_name        = "frontend-vm-nic-2-dev"
  #     location        = "centralindia"
  #     rg_name         = "rg-dev"
  #     nic_subnet_name = "frontend-subnet-dev"
  #     nic_vnet_name   = "vnet-dev"
  #     vm_name         = "frontend-vm-2-dev"
  #     vm_size         = "Standard_D2ds_v4"
  #     # admin_username  = "devopsadmin"
  #     # key_vault_name  = "kv-dev-123"
  #     # secret_name     = "admin-password"
  #     image_publisher           = "Canonical"
  #     image_offer               = "0001-com-ubuntu-server-jammy"
  #     image_sku                 = "22_04-lts"
  #     image_version             = "latest"
  #     password_rotation_version = 3
  # }
}



bastions = {
  bastion1 = {
    name           = "bastion-preprod"
    location       = "centralindia"
    rg_name        = "rg-preprod"
    subnet_name    = "AzureBastionSubnet"
    vnet_name      = "vnet-preprod"
    public_ip_name = "pip-bastion-preprod"
  }
}


# key_vaults = {
#   kv1 = {
#     name                       = "kv-dev-123"
#     location                   = "centralindia"
#     rg_name                    = "rg-dev"
#     secret_name                = "admin-password"
#     soft_delete_retention_days = 7
#     purge_protection_enabled   = true
#     rbac_authorization_enabled = true
#   }
# }

dns_zones = {
  zone1 = {
    dns_zone_name = "corp.internal"
    a_record_name = "frontend"
    rg_name       = "rg-preprod"
    ttl           = 300
    vmname        = "frontend-vm-1-preprod"
    nicname       = "frontend-vm-nic-1-preprod"
    vnet_id       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-preprod/providers/Microsoft.Network/virtualNetworks/vnet-preprod"
  }
}