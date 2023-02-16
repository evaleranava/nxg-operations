locals {
  # get json 
  json_value = jsondecode(file("../test/output.json"))

  o_pub-snet-env1-test-001_id = local.json_value["o_pub-snet-env1-test-001_id"]["value"]
  o_pub-snet-env1-test-002_id = local.json_value["o_pub-snet-env1-test-002_id"]["value"]
  o_sg-env1-test-001 = local.json_value["sg-env1-test-001"]["value"]
  o_default_password = local.json_value["o_default_password"]["value"]["result"]
  o_kms-env1-test-001 = local.json_value["o_kms-env1-test-001"]["value"]
}

##################################################################################
# RDS
##################################################################################
# RDS Instance MySQL
/* module "my_rds_mysql" {
  source = "./modules/rds"
   rds_storage                     = var.my_rds_allocated_storage       
   rds_engine                      = var.my_rds_engine
   rds_engine_version              = var.my_rds_engine_version
   rds_instance_class              = var.my_rds_instance_class
   rds_db_name                     = var.my_rds_db_name
   rds_username                    = var.my_rds_username
   rds_password                    = local.o_default_password
   rds_parameter_group_name        = var.my_rds_parameter_group_name
   rds_option_group_name           = var.my_rds_option_group_name
   rds_db_subnet_group_name        = var.my_rds_db_subnet_group_name
   rds_availability_zone           = var.my_rds_availability_zone
   rds_skip_final_snapshot         = var.my_rds_skip_final_snapshot
   rds_kms_arn                   = local.o_kms-env1-test-001
   rds_identifier                  = var.my_rds_identifier
   rds_multi_az                    = var.my_rds_multi_az
   rds_sg_ids                      = [local.o_sg-env1-test-001]

   rds_backup_retention_period     = var.my_rds_backup_rp
   rds_preferred_backup_window     = var.my_rds_backup_bw
   rds_cloudwatch_logs_exports     = var.my_rds_backup_le

   subnet_group_name               = var.my_rds_subnet_group_name
   subnets                         = [local.o_pub-snet-env1-test-001_id, local.o_pub-snet-env1-test-002_id]

   rds_og_name                     = var.my_rds_og_name
   rds_og_engine                   = var.my_rds_og_engine
   rds_og_engine_version           = var.my_rds_og_engine_version
   rds_db_name_module              = var.my_rds_db_name_module  

   rds_og_option_name              = var.my_rds_og_option_name
   rds_og_os_name                  = var.my_rds_og_os_name
   rds_og_os_value                 = var.my_rds_og_os_value 
} */