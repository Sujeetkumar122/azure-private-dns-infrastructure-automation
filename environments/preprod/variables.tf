variable "rgs" {
  type = map(any)
}

variable "vnets" {
  type = map(any)
}

variable "subnets" {
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
  type = map(any)
}

variable "vms" {
  type = map(any)
}

variable "bastions" {
  type = map(any)
}
variable "dns_zones" {
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

