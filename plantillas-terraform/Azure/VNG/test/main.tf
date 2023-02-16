# ############################################################################################################
# # Resource Group
# ############################################################################################################
# resource "azurerm_resource_group" "rg-env1-test-001" {
#   name     = "rg-env1-test-001"
#   location = "eastus"
# }

# output "rg-env1-test-001_name" {
#   description = "rg-env1-test-001_name"
#   value       = "${azurerm_resource_group.rg-env1-test-001.name}"
# }

# output "rg-env1-test-001_location" {
#   description = "rg-env1-test-001_location"
#   value       = "${azurerm_resource_group.rg-env1-test-001.location}"
# }

# ############################################################################################################
# # Virtual Networks
# ############################################################################################################
# resource "azurerm_virtual_network" "vnet-env1-test-001" {
#   name                = "vnet-env1-test-001"
#   location            = azurerm_resource_group.rg-env1-test-001.location
#   resource_group_name = azurerm_resource_group.rg-env1-test-001.name
#   address_space       = ["10.0.0.0/16"]

#   tags = {
#     environment = "Test"
#   }

#   depends_on = [
#     azurerm_resource_group.rg-env1-test-001
#   ]
# }

# ############################################################################################################
# # Subnets
# ############################################################################################################
# resource "azurerm_subnet" "sbnt-env1-test-001" {
#   name                 = "GatewaySubnet"
#   resource_group_name  = azurerm_resource_group.rg-env1-test-001.name
#   virtual_network_name = azurerm_virtual_network.vnet-env1-test-001.name
#   address_prefixes     = ["10.0.1.0/24"]

#   depends_on = [
#     azurerm_virtual_network.vnet-env1-test-001
#   ]
# }

# output "sbnt-env1-test-001_id" {
#   description = "sbnt-env1-test-001_id"
#   value       = "${azurerm_subnet.sbnt-env1-test-001.id}"
# }

# ############################################################################################################
# # Public IP Addresses
# ############################################################################################################
# resource "azurerm_public_ip" "pip-env1-test-001" {
#   name                = "pip-env1-test-001"
#   resource_group_name = azurerm_resource_group.rg-env1-test-001.name
#   location            = azurerm_resource_group.rg-env1-test-001.location
#   allocation_method   = "Dynamic"

#   tags = {
#     environment = "Test"
#   }

#   depends_on = [
#     azurerm_virtual_network.vnet-env1-test-001
#   ]
# }

# output "pip-env1-test-001_id" {
#   description = "pip-env1-test-001_id"
#   value       = "${azurerm_public_ip.pip-env1-test-001.id}"
# }