##################################################################################
# SQL SERVER
##################################################################################
resource "azurerm_resource_group" "sql_rg" {
  name     = "sql-rg"
  location = "westus"
}

#Output lb-rg
output "o_sql_rg_name" {
    description = "o_sql_rg_name"
    value = "${azurerm_resource_group.sql_rg.name}"
}

output "o_sql_rg_location" {
    description = "o_sql_rg_location"
    value = "${azurerm_resource_group.sql_rg.location}"
}

resource "azurerm_virtual_network" "sql_vnet" {
  name                = "sql-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.sql_rg.location
  resource_group_name = azurerm_resource_group.sql_rg.name
}

resource "azurerm_subnet" "sql_subnet" {
  name                 = "sql-subnet"
  resource_group_name  = azurerm_resource_group.sql_rg.name
  virtual_network_name = azurerm_virtual_network.sql_vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_security_group" "sql_sg" {
  name                = "sql-sg"
  location            = azurerm_resource_group.sql_rg.location
  resource_group_name = azurerm_resource_group.sql_rg.name
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_as" {
  subnet_id                 = azurerm_subnet.sql_subnet.id
  network_security_group_id = azurerm_network_security_group.sql_sg.id
}

resource "azurerm_network_security_rule" "RDPRule" {
  name                        = "RDPRule"
  resource_group_name         = azurerm_resource_group.sql_rg.name
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = 3389
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.sql_sg.name
}

resource "azurerm_network_security_rule" "MSSQLRule" {
  name                        = "MSSQLRule"
  resource_group_name         = azurerm_resource_group.sql_rg.name
  priority                    = 1001
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = 1433
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.sql_sg.name
}

resource "azurerm_public_ip" "sql_pip" {
  name                = "sql-pip"
  location            = azurerm_resource_group.sql_rg.location
  resource_group_name = azurerm_resource_group.sql_rg.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "sql_nic" {
  name                = "sql-nic"
  location            = azurerm_resource_group.sql_rg.location
  resource_group_name = azurerm_resource_group.sql_rg.name

  ip_configuration {
    name                          = "sql-nic-ip-conf"
    subnet_id                     = azurerm_subnet.sql_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.sql_pip.id
  }
}

#Output sql-nic
output "o_sql_nic_ids" {
    description = "o_sql_nic_ids"
    value = "${[azurerm_network_interface.sql_nic.id]}"
}
