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
variable "vm_private_ips" {
  type = map(string)
}