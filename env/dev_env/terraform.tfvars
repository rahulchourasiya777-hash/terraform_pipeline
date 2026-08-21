rgs = {
  rg1 = {
    name       = "rg-tata-prod"
    location   = "centralindia"
    managed_by = "terraform"
    tags = {
      environment = "prod"
    }
  }
}

virtual_network = {
  vnet = {
    name                = "frontend-vnet-prod"
    resource_group_name = "rg-tata-prod"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet = {
    name                 = "frontend-subnet-prod"
    resource_group_name  = "rg-tata-prod"
    virtual_network_name = "frontend-vnet-prod"
    address_prefixes     = ["10.0.4.0/24"]
  }
  subnet2 = {
    name                 = "backend-subnet-prod"
    resource_group_name  = "rg-tata-prod"
    virtual_network_name = "frontend-vnet-prod"
    address_prefixes     = ["10.0.5.0/24"]
  }
}

public_ip = {
  pip = {
    name                = "frontend-pip-prod"
    resource_group_name = "rg-tata-prod"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

vms = {
  nic1 = {
    nic_name        = "frontend-nic-prod"
    rg_name         = "rg-tata-prod"
    location        = "centralindia"
    nic_vnet_name   = "frontend-vnet-prod"
    nic_subnet_name = "frontend-subnet-prod"
    nic_pip_name    = "frontend-pip-prod"
    vm_name         = "frontend-vm-prod"
    vm_size         = "Standard_D2s_v3"
    admin_username  = "frontendops"
    admin_password  = "frontendops@1234"
  }
}