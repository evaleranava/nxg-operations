variable "rds_storage" {
  description = " (Required unless a snapshot_identifier or replicate_source_db is provided) The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate_source_db is set, the value is ignored during the creation of the instance."
  default     = "10"
  type        = number
}

variable "rds_engine" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The database engine to use. For supported values, see the Engine parameter in API action CreateDBInstance. Cannot be specified for a replica. Note that for Amazon Aurora instances the engine must match the DB cluster's engine'. For information on the difference between the available Aurora MySQL engines see Comparison between Aurora MySQL 1 and Aurora MySQL 2 in the Amazon RDS User Guide."
  default     = "default"
  type        = string
}

variable "rds_engine_version" {
  description = "(Optional) The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10). The actual engine version used is returned in the attribute engine_version_actual, see Attributes Reference below. For supported values, see the EngineVersion parameter in API action CreateDBInstance. Note that for Amazon Aurora instances the engine version must match the DB cluster's engine version'. Cannot be specified for a replica."
  default     = "default"
  type        = string
}

variable "rds_instance_class" {
  description = "(Required) The instance type of the RDS instance."
  default     = "default"
  type        = string
}

variable "rds_db_name" {
  description = "(Optional, Deprecated use db_name instead) The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance. Note that this does not apply for Oracle or SQL Server engines. See the AWS documentation for more details on what applies for those engines. If you are providing an Oracle db name, it needs to be in all upper case. Cannot be specified for a replica."
  default     = "default"
  type        = string
}

variable "rds_username" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Username for the master DB user. Cannot be specified for a replica."
  default     = "default"
  type        = string
}     

variable "rds_password" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  default     = "default"
  type        = string
} 

variable "rds_parameter_group_name" {
  description = "(Optional) Name of the DB parameter group to associate."
  default     = "default"
  type        = string
}

variable "rds_option_group_name" {
  description = "(Optional) Name of the DB option group to associate."
  default     = "default"
  type        = string
}

variable "rds_db_subnet_group_name" {
  description = "(Optional) Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. When working with read replicas, it should be specified only if the source database specifies an instance in another AWS Region. See DBSubnetGroupName in API action CreateDBInstanceReadReplica for additional read replica contraints."
  default     = "default"
}
         
variable "rds_availability_zone" {
  description = "(Optional) The AZ for the RDS instance."
  default     = "default"
  type        = string
}

variable "rds_skip_final_snapshot" {
  description = "(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is false."
  default     = "true"
  type        = string
}
   
# Variables Subnet group name
variable "subnets" {
  description = "Subnets Ids"
  default     = []
}

variable "subnet_group_name" {
  description = "Name of subnet group"
  default     = "default"
  type        = string
}

# Variables option group name
variable "rds_og_name" {
  description = "Name of option group"
  default     = "default"
  type        = string
}

variable "rds_og_engine" {
  description = "Engine of option group"
  default     = "default"
  type        = string
}

variable "rds_og_engine_version" {
  description = "Engine version of option group"
  default     = "default"
  type        = string
}

variable "rds_og_option_name" {
  description = "Option name for plugin of option group"
  default     = "default"
  type        = string
}
variable "rds_og_os_name" {
  description = "Option settings name for plugin of option group"
  default     = "default"
  type        = string
}
variable "rds_og_os_value" {
  description = "Option settings value for plugin of option group"
  default     = "default"
  type        = string
}

variable "rds_identifier" {
  description = "(Optional, Forces new resource) The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier. Required if restore_to_point_in_time is specified."
  default     = "default"
  type        = string
}

variable "rds_multi_az" {
  description = "(Optional) Specifies if the RDS instance is multi-AZ"
  default     = false
}

variable "rds_sg_ids" {
  description = "List of VPC security groups to associate"
  default     = []
}

variable "rds_db_name_module" {
  description = "Tag name of RDS instance"
  default     = "RDS"
  type        = string
}

variable "rds_backup_retention_period" {
  description = "(Optional) The days to retain backups for. Must be between 0 and 35. Default is 0. Must be greater than 0 if the database is used as a source for a Read Replica, uses low-downtime updates, or will use RDS Blue/Green deployments."
  default     = "7"
  type        = string
}
variable "rds_preferred_backup_window" {
  description = "(Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: 09:46-10:16. Must not overlap with maintenance_window."
  default     = "06:00-07:00"
  type        = string
}
variable "rds_cloudwatch_logs_exports" {
  description = "(Optional) Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine). MySQL and MariaDB: audit, error, general, slowquery. PostgreSQL: postgresql, upgrade. MSSQL: agent , error. Oracle: alert, audit, listener, trace."
  default     = []
}

variable "rds_random_pass" {
  description = "(Optional) If true, a random password will be generated and used for the master DB password (along with the username and initial database name). If false, and password is not set, an error will be returned."
  default     = "password"
  type        = string
}

variable "rds_kms_arn" {
  description = "(Optional) The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN."
  default     = "default"
  type        = string
}
  