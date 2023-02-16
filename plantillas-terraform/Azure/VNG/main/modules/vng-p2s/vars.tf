##################################################################################
# Virtual Network Gateway - Required Variables
##################################################################################
variable "vng_name" {
  description = "(Required) The name of the Virtual Network Gateway. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vng_location" {
  description = "(Required) The location/region where the Virtual Network Gateway is located. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vng_rg_name" {
  description = "(Required) The name of the resource group in which to create the Virtual Network Gateway. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vng_type" {
  description = "(Required) The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. Changing the type forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vng_vpn_type" {
  description = "(Optional) The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. Defaults to RouteBased. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vng_active_active" {
  description = "(Optional) If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance SKU. If false, an active-standby gateway will be created. Defaults to false."
  default     = false
}

variable "vng_bgp" {
  description = "(Optional) If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false."
  default     = false
}

variable "vng_sku" {
  description = "(Required) Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments. A PolicyBased gateway only supports the Basic SKU. Further, the UltraPerformance SKU is only supported by an ExpressRoute gateway."
  type        = string
  default     = ""
}



variable "vng_ipc_name" {
  description = "(Optional) A user-defined name of the IP configuration. Defaults to vnetGatewayConfig."
  type        = string
  default     = "default"
}

variable "vng_ipc_pub_ip_id" {
  description = "(Required) The ID of the public IP address to associate with the Virtual Network Gateway"
  type        = string
  default     = "default"
}

variable "vng_ipc_priv_ip_id" {
  description = "(Optional) Defines how the private IP address of the gateways virtual interface is assigned. Valid options are Static or Dynamic. Defaults to Dynamic."
  type        = string
  default     = "default"
}

variable "vng_ipc_sbnt_id" {
  description = "(Required) The ID of the gateway subnet of a virtual network in which the virtual network gateway will be created. It is mandatory that the associated subnet is named GatewaySubnet. Therefore, each virtual network can contain at most a single Virtual Network Gateway."
  type        = string
  default     = ""
}


variable "vng_cc_addres_space" {
  description = "(Required) The address space out of which IP addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation."
  default     = []
}


variable "vng_cc_rc_name" {
  description = "(Required) A user-defined name of the root certificate."
  type        = string
  default     = "default"
}

variable "vng_cc_rc_pub_cd" {
  description = "(Required) The public certificate of the root certificate authority. The certificate must be provided in Base-64 encoded X.509 format (PEM). In particular, this argument must not include the -----BEGIN CERTIFICATE----- or -----END CERTIFICATE----- markers."
  type        = string
  default     = "default"
}


variable "vng_cc_rvc_name" {
  description = "(Required) Specifies the name of the certificate resource."
  type        = string
  default     = "default"
}

variable "vng_cc_rvc_thumbprint" {
  description = "(Required) Specifies the public data of the certificate."
  type        = string
  default     = "default"
}
