##################################################################################
# Load Balancer
##################################################################################

resource "azurerm_lb" "lb" {
  name                = var.lb_name         
  location            = var.lb_location     
  resource_group_name = var.lb_rg_name   
  sku                 = var.lb_sku          # Basic, Standard or Gateway 
  sku_tier            = var.lb_sku_tier     # Regional or Global

  frontend_ip_configuration {
    name                 = var.lb_fip_name  # FrontendIPAddress Name
    public_ip_address_id = var.lb_pip_id    # PublicIPAddress ID
  }
}

#Optional to create a backend pool
resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id    = azurerm_lb.lb.id
  name               = var.lb_bp_name
}

#Optional to create a nat pool
resource "azurerm_lb_nat_pool" "nat_pool" {
  resource_group_name            = var.lb_rg_name
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = var.lb_nat_pool_name
  protocol                       = var.lb_nat_pool_protocol #"Tcp"
  frontend_port_start            = var.lb_nat_pool_front_port_start#80
  frontend_port_end              = var.lb_nat_pool_front_port_end#81
  backend_port                   = var.lb_nat_pool_back_port#8080
  frontend_ip_configuration_name = var.lb_fip_name
}


#Optional to create a nat pool
resource "azurerm_lb_nat_rule" "nat_rule" {
  resource_group_name            = var.lb_rg_name
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = var.lb_nat_rule_name
  protocol                       = var.lb_nat_rule_protocol #"Tcp"
  frontend_port                  = var.lb_nat_rule_front_port#80
  backend_port                   = var.lb_nat_rule_back_port#80
  frontend_ip_configuration_name = var.lb_fip_name
}

/* #Optional to create a outbound rule
resource "azurerm_lb_outbound_rule" "outbound_rule" {
  name                    = var.lb_o_r_name  #"OutboundRule"
  loadbalancer_id         = azurerm_lb.lb.id
  protocol                = var.lb_o_r_protocol  #"Tcp", Udp, all
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
  allocated_outbound_ports = var.lb_ports

  frontend_ip_configuration {
    name = var.lb_fip_name
  }
} */

