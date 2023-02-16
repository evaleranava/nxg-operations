#Local variables
locals {
    json_value = jsondecode(file("../test/output.json"))

    #sql
    o_sql_nic_ids       = local.json_value["o_sql_nic_ids"]["value"]
    o_sql_rg_name       = local.json_value["o_sql_rg_name"]["value"]
    o_sql_rg_location   = local.json_value["o_sql_rg_location"]["value"]
}

##################################################################################
# SQL SERVER
##################################################################################
# Example SQL Server
  module "example_sql_server" {
    source = "./modules/sql_server"
    # SQL VM
    sql_vm_name                 = var.example_sql_vm_name
    sql_vm_location             = local.o_sql_rg_location
    sql_vm_rg                   = local.o_sql_rg_name
    sql_vm_nic_ids              = local.o_sql_nic_ids
    sql_vm_size                 = var.example_sql_vm_size
    sql_img_publisher           = var.example_sql_img_vm_publisher
    sql_img_offer               = var.example_sql_img_offer
    sql_img_sku                 = var.example_sql_img_sku
    sql_img_version             = var.example_sql_img_version
    sql_osdisk_name             = var.example_sql_osdisk_name
    #sql_osdisk_size             = var.example_sql_osdisk_size
    sql_osdisk_caching          = var.example_sql_osdisk_caching
    sql_osdisk_create_option    = var.example_sql_osdisk_create_option
    sql_osdisk_manage_disk_type = var.example_sql_osdisk_manage_disk_type
    sql_os_prof_name            = var.example_sql_os_prof_name
    sql_os_prof_username        = var.example_sql_os_prof_username
    sql_os_prof_pass            = var.example_sql_os_prof_pass
    sql_os_prof_win_time        = var.example_sql_os_prof_win_time
    sql_license_type            = var.example_sql_license_type
} 
