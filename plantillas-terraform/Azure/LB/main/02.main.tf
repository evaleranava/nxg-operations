#Local variables
locals {
    json_value = jsondecode(file("../test/output.json"))

    o_lb_rg_name        = local.json_value["o_lb_rg_name"]["value"]
    o_lb_rg_location    = local.json_value["o_lb_rg_location"]["value"]
    o_lb_pip_id         = local.json_value["o_lb_pip_id"]["value"]
    o_lb_vnet_id        = local.json_value["o_lb_vnet_id"]["value"]
}

##################################################################################
# Load balancer
##################################################################################
# Example Load Balancer
module "example_lb" {
    source = "./modules/lb"
    lb_name                      = var.example_lb_name
    lb_location                  = local.o_lb_rg_location
    lb_rg_name                   = local.o_lb_rg_name
    lb_sku                       = var.example_lb_sku
    lb_sku_tier                  = var.example_lb_sku_tier
    lb_fip_name                  = var.example_lb_fip_name
    #lb_subnet_id                 = local.o_lb_subnet_id
    lb_pip_id                    = local.o_lb_pip_id
    lb_bp_name                   = var.example_lb_bep_name
    lb_nat_pool_name             = var.example_lb_nat_pool_name
    lb_nat_pool_protocol         = var.example_lb_np_protocol
    lb_nat_pool_front_port_start = var.example_lb_npfps
    lb_nat_pool_front_port_end   = var.example_lb_npfpe
    lb_nat_pool_back_port        = var.example_lb_npbp

    lb_nat_rule_name             = var.example_lb_nr_name
    lb_nat_rule_protocol         = var.example_lb_nr_protocol
    lb_nat_rule_front_port       = var.example_lb_nrfp
    lb_nat_rule_back_port        = var.example_lb_nrbp

    /* lb_o_r_name       = var.example_lb_o_r_name
    lb_o_r_protocol   = var.example_lb_o_r_protocol
    lb_ports          = var.example_lb_ports */

    # lb_backend_port   = var.example_lb_backend_port
    # lb_backend_proto  = var.example_lb_backend_proto
    # lb_backend_health = var.example_lb_backend_health
    # lb_backend_name   = var.example_lb_backend_name
    # lb_backend_id     = var.example_lb_backend_id
    # lb_backend_ip     = var.example_lb_backend_ip
}