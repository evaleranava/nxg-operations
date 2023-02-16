##################################################################################
# Provider variables
##################################################################################
variable "region" {}

#######################################
# RDS DB
#######################################
# Wordpress RDS Instance MySQL Variables
variable "my_rds_allocated_storage"                   {}   
variable "my_rds_engine"                              {}
variable "my_rds_engine_version"                      {}
variable "my_rds_instance_class"                      {}
variable "my_rds_db_name"                             {}
variable "my_rds_username"                            {}
variable "my_rds_random_pass"                            {}
variable "my_rds_parameter_group_name"                {}
variable "my_rds_option_group_name"                   {}
variable "my_rds_db_subnet_group_name"                {}
variable "my_rds_availability_zone"                   {}
variable "my_rds_skip_final_snapshot"                 {}
variable "my_rds_kms_key_id"                           {}
variable "my_rds_identifier"                          {}
variable "my_rds_multi_az"                            {}
variable "my_rds_sg_ids"                              {}
variable "my_rds_subnet_group_name"                   {}
variable "my_rds_subnets"                             {}

variable "my_rds_backup_rp"                           {}
variable "my_rds_backup_bw"                           {}
variable "my_rds_backup_le"                           {}

variable "my_rds_og_name"                             {}
variable "my_rds_og_engine"                           {}
variable "my_rds_og_engine_version"                   {}
variable "my_rds_og_option_name"                      {}
variable "my_rds_og_os_name"                          {}
variable "my_rds_og_os_value"                         {}

variable "my_rds_port"                                {}
variable "my_rds_db_name_module"                      {}