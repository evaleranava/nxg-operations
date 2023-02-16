##################################################################################
# Load Balancer
##################################################################################
#Resource Group LB
resource "azurerm_resource_group" "lb_rg" {
  name     = "lb-rg"
  location = "westus"
}

#Output lb-rg
output "o_lb_rg_name" {
    description = "o_lb_rg_name"
    value = "${azurerm_resource_group.lb_rg.name}"
}

output "o_lb_rg_location" {
    description = "o_lb_rg_location"
    value = "${azurerm_resource_group.lb_rg.location}"
}

#Public IP LB
resource "azurerm_public_ip" "lb_pip" {
  name                = "lb-pip"
  location            = azurerm_resource_group.lb_rg.location
  resource_group_name = azurerm_resource_group.lb_rg.name
  allocation_method   = "Static"
}

#Output lb-pip
output "o_lb_pip_id" {
    description = "o_lb_pip_id"
    value = "${azurerm_public_ip.lb_pip.id}"
}

#Virtual Network LB
resource "azurerm_virtual_network" "lb_vnet" {
  name                = "lb-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.lb_rg.location
  resource_group_name = azurerm_resource_group.lb_rg.name
}

#Output lb-vnet
output "o_lb_vnet_id" {
    description = "o_lb_vnet_id"
    value = "${azurerm_virtual_network.lb_vnet.id}"
}

#Subnet LB
resource "azurerm_subnet" "lb_subnet" {
  name                 = "lb-subnet"
  resource_group_name  = azurerm_resource_group.lb_rg.name
  virtual_network_name = azurerm_virtual_network.lb_vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

#Output lb-subnet
output "o_lb_subnet_id" {
    description = "o_lb_subnet_id"
    value = "${azurerm_subnet.lb_subnet.id}"
}