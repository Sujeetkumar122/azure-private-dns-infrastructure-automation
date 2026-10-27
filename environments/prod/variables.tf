variable "rgs" {
  description = "Map of Azure Resource Groups"
  type        = map(any)
}

variable "vnets" {
  description = "Map of Azure Virtual Networks"
  type        = map(any)
}

variable "subnets" {
  description = "Map of Subnets with optional delegation"
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)

    delegation = optional(object({
      name                    = string
      service_delegation_name = string
      service_actions         = list(string)
    }))
  }))
}

variable "public_ips" {
  description = "Map of Public IP configurations"
  type        = map(any)
}

variable "vms" {
  description = "Map of Virtual Machine configurations"
  type        = map(any)
}

variable "bastions" {
  description = "Map of Azure Bastion configurations"
  type        = map(any)
}

variable "dns_zones" {
  description = "Map of Azure Private DNS Zones and Records"
  type = map(object({
    dns_zone_name = string
    rg_name       = string
    vnet_id       = string
    a_record_name = string
    ttl           = number
    vmname        = string
    nicname       = string
  }))
}