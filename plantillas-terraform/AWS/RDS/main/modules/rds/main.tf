#####################################################
# RDS - MySQL  
#####################################################
resource "aws_db_instance" "aws_rds_mysql" {

  allocated_storage               = var.rds_storage                                     #10
  engine                          = var.rds_engine                                      #"mysql"
  engine_version                  = var.rds_engine_version                              #"5.7"
  instance_class                  = var.rds_instance_class                              #"db.t2.micro"
  db_name                         = var.rds_db_name                                     #"mydb"
  username                        = var.rds_username                                    #"admin"
  password                        = var.rds_random_pass             #Generada de forma aleatoria
  parameter_group_name            = var.rds_parameter_group_name                        #"default.mysql5.7"
  option_group_name               = var.rds_option_group_name                       
  db_subnet_group_name            = var.rds_db_subnet_group_name                        #"aws_db_subnet_group.merchant-db.name"
  availability_zone               = var.rds_availability_zone                           #"us-east-1b"
  skip_final_snapshot             = var.rds_skip_final_snapshot                         #true
  kms_key_id                      = var.rds_kms_arn                            #arn
  multi_az                        = var.rds_multi_az
  identifier                      = var.rds_identifier
  vpc_security_group_ids          = var.rds_sg_ids
  storage_encrypted               = true

  backup_retention_period         = var.rds_backup_retention_period                     #30
  backup_window                   = var.rds_preferred_backup_window                     #"07:00-09:00"
  enabled_cloudwatch_logs_exports = var.rds_cloudwatch_logs_exports                     #["audit", "error", "general", "slowquery"]

  tags = {
    Name        = var.rds_db_name_module
    Description = "Managed by Terraform"
  }

  depends_on = [
    aws_db_subnet_group.rds_subnets_mysql,
    aws_db_option_group.rds_og_mysql
  ]
}

#####################################################
# Subnet group rds 
#####################################################
resource "aws_db_subnet_group" "rds_subnets_mysql" {
  name        = var.subnet_group_name
  description = "Subnet groups for RDS mysql"
  subnet_ids  = var.subnets #IDs de las subnets del RDS

  tags = {
    Name = var.subnet_group_name
  }
}

#####################################################
# Option group 
#####################################################
resource "aws_db_option_group" "rds_og_mysql" {
  name                     = var.rds_og_name
  option_group_description = "Terraform Option Group"
  engine_name              = var.rds_og_engine
  major_engine_version     = var.rds_og_engine_version

  option {
    option_name = var.rds_og_option_name #"MARIADB_AUDIT_PLUGIN"

    option_settings {
      name  = var.rds_og_os_name #"SERVER_AUDIT_EVENTS"
      value = var.rds_og_os_value #"CONNECT,QUERY"
    }

  }

}

output "db_host" {
  value  = aws_db_instance.aws_rds_mysql.address
}

output "db_password" {
  value       = aws_db_instance.aws_rds_mysql.password
}