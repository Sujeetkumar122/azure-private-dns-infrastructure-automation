rgs = {
  rg1 = {
    name     = "rg-prod"
    location = "centralindia"
  }
  rg2 = {
    name     = "rg-prod-2"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    name                = "vnet-prod"
    location            = "centralindia"
    resource_group_name = "rg-prod"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  snet1 = {
    name                 = "frontend-subnet-prod"
    resource_group_name  = "rg-prod"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.1.0/24"]
  }
  snet2 = {
    name                 = "backend-subnet-prod"
    resource_group_name  = "rg-prod"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.2.0/24"]
  }
  snet3 = {
    name                 = "database-subnet-prod"
    resource_group_name  = "rg-prod"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.3.0/24"]
  }
  snet4 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-prod"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.4.0/26"]
  }
  snet5 = {
    name                 = "AppGatewaySubnet"
    resource_group_name  = "rg-prod"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.5.0/24"]
  }
  snet6 = {
    name                 = "aks-subnet-prod"
    resource_group_name  = "rg-prod"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.10.0/23"]
  }
  snet7 = {
    name                 = "appservice-subnet-prod"
    resource_group_name  = "rg-prod"
    virtual_network_name = "vnet-prod"
    address_prefixes     = ["10.0.12.0/24"]
    delegation = {
      name                    = "appservice-delegation"
      service_delegation_name = "Microsoft.Web/serverFarms"
      service_actions         = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}

public_ips = {
  pip_bastion = {
    public_ip_name      = "pip-bastion-prod"
    resource_group_name = "rg-prod"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip_appgw = {
    public_ip_name      = "pip-appgw-prod"
    resource_group_name = "rg-prod"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

vms = {
  frontend_1 = {
    nic_name        = "frontend-vm-nic-1-prod"
    location        = "centralindia"
    rg_name         = "rg-prod"
    nic_subnet_name = "frontend-subnet-prod"
    nic_vnet_name   = "vnet-prod"
    vm_name         = "frontend-vm-1-prod"
    vm_size         = "Standard_B1s"
    admin_username  = "prodopsadmin"
    key_vault_name  = "kv-prod-123"
    secret_name     = "admin-password"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
  frontend_2 = {
    nic_name        = "frontend-vm-nic-2-prod"
    location        = "centralindia"
    rg_name         = "rg-prod"
    nic_subnet_name = "frontend-subnet-prod"
    nic_vnet_name   = "vnet-prod"
    vm_name         = "frontend-vm-2-prod"
    vm_size         = "Standard_B1s"
    admin_username  = "prodopsadmin"
    key_vault_name  = "kv-prod-123"
    secret_name     = "admin-password"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
  backend_1 = {
    nic_name        = "backend-vm-nic-1-prod"
    location        = "centralindia"
    rg_name         = "rg-prod"
    nic_subnet_name = "backend-subnet-prod"
    nic_vnet_name   = "vnet-prod"
    vm_name         = "backend-vm-1-prod"
    vm_size         = "Standard_B1s"
    admin_username  = "prodopsadmin"
    key_vault_name  = "kv-prod-123"
    secret_name     = "admin-password"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
  backend_2 = {
    nic_name        = "backend-vm-nic-2-prod"
    location        = "centralindia"
    rg_name         = "rg-prod"
    nic_subnet_name = "backend-subnet-prod"
    nic_vnet_name   = "vnet-prod"
    vm_name         = "backend-vm-2-prod"
    vm_size         = "Standard_B1s"
    admin_username  = "prodopsadmin"
    key_vault_name  = "kv-prod-123"
    secret_name     = "admin-password"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
  database_1 = {
    nic_name        = "database-vm-nic-prod"
    location        = "centralindia"
    rg_name         = "rg-prod"
    nic_subnet_name = "database-subnet-prod"
    nic_vnet_name   = "vnet-prod"
    vm_name         = "database-vm-prod"
    vm_size         = "Standard_B2s"
    admin_username  = "prodopsadmin"
    key_vault_name  = "kv-prod-123"
    secret_name     = "admin-password"
    image_publisher = "Canonical"
    image_publisher = "Canonical"
    image_publisher = "Canonical"
    image_offer     = "0001-com-ubuntu-server-jammy"
    image_sku       = "22_04-lts"
    image_version   = "latest"
  }
}

bastions = {
  bastion1 = {
    name           = "bastion-prod"
    location       = "centralindia"
    rg_name        = "rg-prod"
    subnet_name    = "AzureBastionSubnet"
    vnet_name      = "vnet-prod"
    public_ip_name = "pip-bastion-prod"
  }
}

app_gateways = {
  appgw1 = {
    name           = "appgw-prod"
    location       = "centralindia"
    rg_name        = "rg-prod"
    subnet_name    = "AppGatewaySubnet"
    vnet_name      = "vnet-prod"
    public_ip_name = "pip-appgw-prod"
  }
}

load_balancers = {
  lb1 = {
    name        = "lb-backend-prod"
    location    = "centralindia"
    rg_name     = "rg-prod"
    subnet_name = "backend-subnet-prod"
    vnet_name   = "vnet-prod"
  }
}

key_vaults = {
  kv1 = {
    name                       = "kv-prod-123"
    location                   = "centralindia"
    rg_name                    = "rg-prod"
    secret_name                = "admin-password"
    soft_delete_retention_days = 90
    purge_protection_enabled   = true
    rbac_authorization_enabled = true
  }
}

acrs = {
  acr1 = {
    name                    = "acrprodregistry123"
    rg_name                 = "rg-prod"
    location                = "centralindia"
    sku                     = "Premium"
    admin_enabled           = false
    zone_redundancy_enabled = true
    environment             = "prod"
  }
}

aks_clusters = {
  aks1 = {
    name                = "aks-cluster-prod"
    rg_name             = "rg-prod"
    location            = "centralindia"
    dns_prefix          = "aks-prod"
    vnet_name           = "vnet-prod"
    subnet_name         = "aks-subnet-prod"
    vm_size             = "Standard_D2s_v5"
    enable_auto_scaling = true
    min_count           = 3
    max_count           = 10
    zones               = ["1", "2", "3"]
    network_plugin      = "azure"
    network_policy      = "azure"
    environment         = "prod"
  }
}

app_services = {
  app1 = {
    name                   = "app-service-prod-123"
    plan_name              = "asp-service-plan-prod"
    rg_name                = "rg-prod"
    location               = "centralindia"
    os_type                = "Linux"
    sku_name               = "P1v3"
    worker_count           = 3
    zone_balancing_enabled = true
    vnet_name              = "vnet-prod"
    subnet_name            = "appservice-subnet-prod"
    https_only             = true
    dotnet_version         = "8.0"
    environment            = "prod"
  }
}

dns_zones = {
  zone1 = {
    dns_zone_name = "corp.internal"
    a_record_name = "frontend"
    rg_name       = "rg-prod"
    ttl           = 300
    vmname        = "frontend-vm-1-prod"
    nicname       = "frontend-vm-nic-1-prod"
    vnet_id       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-prod/providers/Microsoft.Network/virtualNetworks/vnet-prod"
  }
}


