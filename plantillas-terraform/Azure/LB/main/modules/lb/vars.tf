variable "lb_name" {
  description = "(Required) Specifies the name of the Load Balancer. Changing this forces a new resource to be created."
  type        = string
  default     = "lb-default"
}

variable "lb_location" {
  description = "(Required) Specifies the supported Azure Region where the Load Balancer should be created. Changing this forces a new resource to be created."
  type        = string
  default     = "eastus"   
}

variable "lb_rg_name" {
  description = "(Required) The name of the Resource Group in which to create the Load Balancer. Changing this forces a new resource to be created."
  type        = string
  default     = "rg-default"  
}

variable "lb_sku" {
  description = "(Optional) The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
}

variable "lb_sku_tier" {
  description = "(Optional) sku_tier - (Optional) The SKU tier of this Load Balancer. Possible values are Global and Regional. Defaults to Regional. Changing this forces a new resource to be created."
  type        = string
  default     = "Regional"
}

variable "lb_fip_name" {
  description = "(Required) Specifies the name of the frontend IP configuration."
  type        = string
  default     = "fip-default"  
}

/* variable "lb_subnet_id" {
  description = "(Optional) The ID of the Subnet which should be associated with the Load Balancer."
  type        = string
  default     = ""  
} */

variable "lb_pip_id" {
  description = "(Optional) The ID of a Public IP Address which should be associated with the Load Balancer."
  type        = string
  default     = ""  
}

variable "lb_bp_name" {
  description = "Name of backend pool"
  type        = string
  default     = "bep-default"  
}


variable "lb_nat_pool_name" {
  description = "(Required) Specifies the name of the NAT Pool. Changing this forces a new resource to be created."
  type        = string
  default     = "nat-default"  
}

variable "lb_nat_pool_protocol" {
  description = "(Required) The transport protocol for the external endpoint. Possible values are Udp, Tcp or All."
  type        = string
  default     = "Tcp"  
}

variable "lb_nat_pool_front_port_start" {
  description = "(Required) The starting port range for the NAT pool."
  type        = number
  default     = 80  
}

variable "lb_nat_pool_front_port_end" {
  description = "(Required) The ending port range for the NAT pool."
  type        = number
  default     = 81  
}

variable "lb_nat_pool_back_port" {
  description = "(Required) The port used for internal connections on the endpoint. Acceptable values are between 1 and 65535."
  type        = number
  default     = 3389  
}

variable "lb_o_r_name" {
  description = "(Required) Specifies the name of the Outbound Rule. Changing this forces a new resource to be created."
  type        = string
  default     = "or-default"  
}

variable "lb_o_r_protocol" {
  description = "(Required) The transport protocol for the external endpoint. Possible values are Udp, Tcp or All."
  type        = string
  default     = "Tcp"  
}

variable "lb_ports" {
  description = "(Optional) The number of outbound ports to be used for NAT. Defaults to 1024."
  type        = number
  default     = 1024  
}

variable "lb_nat_rule_name" {
  description = "(Required) Specifies the name of the NAT Rule. Changing this forces a new resource to be created."
  type        = string
  default     = "nat-default"  
}

variable "lb_nat_rule_protocol" {
  description = "(Required) The transport protocol for the external endpoint. Possible values are Udp, Tcp or All."
  type        = string
  default     = "Tcp"  
}

variable "lb_nat_rule_front_port" {
  description = "(Optional) The port for the external endpoint. Port numbers for each Rule must be unique within the Load Balancer. Possible values range between 1 and 65534, inclusive."
  type        = number
  default     = 80  
}

variable "lb_nat_rule_back_port" {
  description = " (Required) The port used for internal connections on the endpoint. Possible values range between 1 and 65535, inclusive."
  type        = number
  default     = 80  
}