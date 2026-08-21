module "resource_group" {
  source = "../../child_module/azurerm_resource_group"
  rgs    = var.rgs
}

module "virtual_network" {
  depends_on      = [module.resource_group]
  source          = "../../child_module/azurerm_virtual_network"
  virtual_network = var.virtual_network
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../child_module/azurerm_subnet"
  subnets    = var.subnets
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_public_ip"
  public_ip  = var.public_ip
}

module "network_interface" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../child_module/azurerm_network_interface"
  vms        = var.vms
}

module "virtual_machine" {
  depends_on = [module.network_interface]
  source     = "../../child_module/azurerm_linux_virtual_machine"
  vms        = var.vms
}