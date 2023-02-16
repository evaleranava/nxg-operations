##################################################################################
# EFS AZ
##################################################################################
variable "efs_name" {
  description = "(Optional) A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation. By default generated by Terraform. See Elastic File System user guide for more information."
  type        = string
  default     = "default"
}

variable "efs_encrypted" {
  description = "(Optional) If true, the disk will be encrypted."
  default     = false
}

variable "efs_throughput_mode" {
  description = "(Optional) Throughput mode for the file system. Defaults to bursting. Valid values: bursting, provisioned, or elastic. When using provisioned, also set provisioned_throughput_in_mibps."
  type        = string
  default     = "default"
}

variable "efs_pt_in_mibps" {
  description = "(Optional) The throughput, measured in MiB/s, that you want to provision for the file system. Only applicable with throughput_mode set to provisioned."
  type        = number
  default     = "5"
}

variable "efs_az_name" {
  description = "(Optional) the AWS Availability Zone in which to create the file system. Used to create a file system that uses One Zone storage classes. See user guide for more information."
  type        = string
  default     = "default"
}