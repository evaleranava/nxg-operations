##################################################################################
# EC2 Instance from AMI ID
##################################################################################
variable "ec2_ami" {
  description = "(Optional) AMI to use for the instance. Required unless launch_template is specified and the Launch Template specifes an AMI. If an AMI is specified in the Launch Template, setting ami will override the AMI specified in the Launch Template."
  type        = string
  default     = "default"
}

variable "ec2_instance_type" {
  description = "(Optional) Instance type to use for the instance. Required unless launch_template is specified and the Launch Template specifies an instance type. If an instance type is specified in the Launch Template, setting instance_type will override the instance type specified in the Launch Template. Updates to this field will trigger a stop/start of the EC2 instance."
  type        = string
  default     = "default"
}

variable "ec2_key_name" {
  description = "(Optional) Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource."
  type        = string
  default     = "default"
}

variable "ec2_disable_api_termination" {
  description = "(Optional) If true, enables EC2 Instance Termination Protection."
  default     = false
}

variable "ec2_vpc_security_group_ids" {
  description = "(Optional, VPC only) List of security group IDs to associate with."
  default     = []
}



variable "ec2_ni_nid" {
  description = "(Required) ID of the network interface to attach."
  type        = string
  default     = "default"
}

variable "ec2_ni_device_index" {
  description = "(Required) Integer index of the network interface attachment. Limited by instance type."
  type        = number
  default     = "0"
}



variable "ec2_rbd_delete_on_termination" {
  description = "(Optional) Whether the volume should be destroyed on instance termination. Defaults to true."
  default     = false
}

variable "ec2_rbd_encrypted" {
  description = "(Optional) Whether to enable volume encryption. Defaults to false. Must be configured to perform drift detection."
  default     = false
}

variable "ec2_rbd_volume_size" {
  description = "(Optional) Size of the volume in gibibytes (GiB)."
  type        = number
  default     = "8"
}

variable "ec2_rbd_volume_type" {
  description = "(Optional) Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1. Defaults to gp2."
  type        = string
  default     = "default"
}