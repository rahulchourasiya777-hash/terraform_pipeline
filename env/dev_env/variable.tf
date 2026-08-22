variable "rgs" {
  type        = any
  description = "Map of resource groups configuration"
}

variable "virtual_network" {
  type        = any
  description = "Map of virtual networks configuration"
}

variable "subnets" {
  type        = any
  description = "Map of subnets configuration"
}

variable "public_ip" {
  type        = any
  description = "Map of public IPs configuration"
}

variable "vms" {
  type        = any
  description = "Map of virtual machines configuration"
}