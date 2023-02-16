##################################################################################
# Provider variables
##################################################################################
#AWS provider variables
region              = "us-east-1"

#######################################
# RDS DB
#######################################
# Wordpress RDS Instance MySQL Variables
my_rds_allocated_storage                   = "10"
my_rds_engine                              = "mysql"               
my_rds_engine_version                      = "8.0.28"
my_rds_instance_class                      = "db.t2.small"
my_rds_db_name                             = "wordpress"
my_rds_username                            = "admin"
my_rds_random_pass                         = ""
my_rds_parameter_group_name                = "default.mysql8.0"
my_rds_option_group_name                   = "default-mysql-8-0-28-my"
my_rds_db_subnet_group_name                = "aws-my-rds-db-sg-name"
my_rds_availability_zone                   = "us-east-1b"
my_rds_skip_final_snapshot                 = "true"
my_rds_kms_key_id                          = ""
my_rds_identifier                          = "aws-my-rds"
my_rds_multi_az                            = false
my_rds_sg_ids                              = [""] 

my_rds_backup_rp                           = "7" 
my_rds_backup_bw                           = "06:00-07:00" 
my_rds_backup_le                           = ["audit", "error", "general", "slowquery"] 
    
my_rds_subnet_group_name                   = "aws-my-rds-db-sg-name"
my_rds_subnets                             = ["", ""]
    
my_rds_og_name                             = "default-mysql-8-0-28-my"
my_rds_og_engine                           = "mysql"
my_rds_og_engine_version                   = "8.0"
my_rds_og_option_name                      = "MARIADB_AUDIT_PLUGIN"
my_rds_og_os_name                          = "SERVER_AUDIT_EVENTS"
my_rds_og_os_value                         = "CONNECT,QUERY"
    
my_rds_port                                = 3306
my_rds_db_name_module                      = "aws-my-rds"