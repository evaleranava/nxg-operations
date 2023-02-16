#Local variables
locals {
    json_value = jsondecode(file("../test/output.json"))

    #sa
    o_sa_rg_name        = local.json_value["o_sa_rg_name"]["value"]
    o_sa_rg_location    = local.json_value["o_sa_rg_location"]["value"]
}

##################################################################################
# STORAGE ACCOUNTS
##################################################################################
# Example Storage Account
module "test_sa" {
    source = "./modules/fileshare"
    sa_name                        = var.example_sa_name
    sa_rg                          = local.o_lb_rg_name
    sa_location                    = local.o_lb_rg_location
    sa_tier                        = var.example_sa_tier
    sa_replication                 = var.example_sa_replication

# Example Storage share
    share_name                  = var.example_share_name
    share_quota                 = var.example_share_quota
# Example Storage File share
    fs_name                     = var.example_fs_name
    fs_source                   = var.example_fs_source
}