############################################################################################################
# Resource Group
############################################################################################################
resource "azurerm_resource_group" "rg-env1-test-001" {
  name     = "rg-env1-test-001"
  location = "eastus"
}

output "rg-env1-test-001_name" {
  description = "rg-env1-test-001_name"
  value       = "${azurerm_resource_group.rg-env1-test-001.name}"
}

output "rg-env1-test-001_location" {
  description = "rg-env1-test-001_location"
  value       = "${azurerm_resource_group.rg-env1-test-001.location}"
}

############################################################################################################
# Virtual Networks
############################################################################################################
resource "azurerm_virtual_network" "vnet-env1-test-001" {
  name                = "vnet-env1-test-001"
  location            = azurerm_resource_group.rg-env1-test-001.location
  resource_group_name = azurerm_resource_group.rg-env1-test-001.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "Test"
  }

  depends_on = [
    azurerm_resource_group.rg-env1-test-001
  ]
}

############################################################################################################
# Subnets
############################################################################################################
resource "azurerm_subnet" "snet-env1-test-001" {
  name                 = "snet-env1-test-001"
  resource_group_name  = azurerm_resource_group.rg-env1-test-001.name
  virtual_network_name = azurerm_virtual_network.vnet-env1-test-001.name
  address_prefixes     = ["10.0.0.0/24"]

  depends_on = [
    azurerm_virtual_network.vnet-env1-test-001
  ]
}

############################################################################################################
# Public IP Addresses
############################################################################################################
resource "azurerm_public_ip" "pip-env1-test-001" {
  name                = "pip-env1-test-001"
  resource_group_name = azurerm_resource_group.rg-env1-test-001.name
  location            = azurerm_resource_group.rg-env1-test-001.location
  allocation_method   = "Static"

  tags = {
    environment = "Test"
  }

  depends_on = [
    azurerm_virtual_network.vnet-env1-test-001
  ]
}

resource "azurerm_public_ip" "pip-env1-test-002" {
  name                = "pip-env1-test-002"
  resource_group_name = azurerm_resource_group.rg-env1-test-001.name
  location            = azurerm_resource_group.rg-env1-test-001.location
  allocation_method   = "Static"

  tags = {
    environment = "Test"
  }

  depends_on = [
    azurerm_virtual_network.vnet-env1-test-001
  ]
}

############################################################################################################
# Network Security Groups
############################################################################################################
resource "azurerm_network_security_group" "nsg-env1-test-001" {
  name                = "nsg-env1-test-001"
  location            = azurerm_resource_group.rg-env1-test-001.location
  resource_group_name = azurerm_resource_group.rg-env1-test-001.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Test"
  }

  depends_on = [
    azurerm_virtual_network.vnet-env1-test-001
  ]
}

resource "azurerm_network_security_group" "nsg-env1-test-002" {
  name                = "nsg-env1-test-002"
  location            = azurerm_resource_group.rg-env1-test-001.location
  resource_group_name = azurerm_resource_group.rg-env1-test-001.name

  security_rule {
    name                       = "RDP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Test"
  }

  depends_on = [
    azurerm_virtual_network.vnet-env1-test-001
  ]
}

############################################################################################################
# Network Interfaces Cards
############################################################################################################
resource "azurerm_network_interface" "nic-env1-test-001" {
  name                = "nic-env1-test-001"
  location            = azurerm_resource_group.rg-env1-test-001.location
  resource_group_name = azurerm_resource_group.rg-env1-test-001.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet-env1-test-001.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip-env1-test-001.id
  }

  tags = {
    environment = "Test"
  }

  depends_on = [
    azurerm_virtual_network.vnet-env1-test-001,
    azurerm_public_ip.pip-env1-test-001,
    azurerm_subnet.snet-env1-test-001
  ]
}

resource "azurerm_network_interface" "nic-env1-test-002" {
  name                = "nic-env1-test-002"
  location            = azurerm_resource_group.rg-env1-test-001.location
  resource_group_name = azurerm_resource_group.rg-env1-test-001.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snet-env1-test-001.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip-env1-test-002.id
  }

  tags = {
    environment = "Test"
  }

  depends_on = [
    azurerm_virtual_network.vnet-env1-test-001,
    azurerm_public_ip.pip-env1-test-002,
    azurerm_subnet.snet-env1-test-001
  ]
}

resource "azurerm_network_interface_security_group_association" "nsg-assoc-env1-test-001" {
  network_interface_id      = azurerm_network_interface.nic-env1-test-001.id
  network_security_group_id = azurerm_network_security_group.nsg-env1-test-001.id
}

resource "azurerm_network_interface_security_group_association" "nsg-assoc-env1-test-002" {
  network_interface_id      = azurerm_network_interface.nic-env1-test-002.id
  network_security_group_id = azurerm_network_security_group.nsg-env1-test-002.id
}

output "nic-env1-test-001_id" {
  description = "nic-env1-test-001_id"
  value       = "${azurerm_network_interface.nic-env1-test-001.id}"
}

output "nic-env1-test-002_id" {
  description = "nic-env1-test-002_id"
  value       = "${azurerm_network_interface.nic-env1-test-002.id}"
}