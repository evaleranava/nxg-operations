##################################################################################
# Virtual Machine - Legacy
##################################################################################
variable "vm_legacy_name" {
  description = "(Required) Specifies the name of the Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vm_legacy_location" {
  description = "(Required) Specifies the Azure Region where the Virtual Machine exists. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vm_legacy_rg_name" {
  description = "(Required) Specifies the name of the Resource Group in which the Virtual Machine should exist. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vm_legacy_nic_id" {
  description = "(Required) A list of Network Interface IDs which should be associated with the Virtual Machine."
  default     = []
}

variable "vm_legacy_size" {
  description = "(Required) Specifies the size of the Virtual Machine. See also Azure VM Naming Conventions."
  type        = string
  default     = "default"
}



variable "vm_legacy_delete_osdisk" {
  description = "(Optional) Should the OS Disk (either the Managed Disk / VHD Blob) be deleted when the Virtual Machine is destroyed? Defaults to false."
  default     = false
}

variable "vm_legacy_delete_datadisks" {
  description = "(Optional) Should the Data Disks (either the Managed Disks / VHD Blobs) be deleted when the Virtual Machine is destroyed? Defaults to false."
  default     = false
}



variable "vm_legacy_sir_publisher" {
  description = "(Optional) Specifies the publisher of the image used to create the virtual machine. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vm_legacy_sir_offer" {
  description = "(Optional) Specifies the offer of the image used to create the virtual machine. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vm_legacy_sir_sku" {
  description = "(Optional) Specifies the SKU of the image used to create the virtual machine. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vm_legacy_sir_version" {
  description = "(Optional) Specifies the version of the image used to create the virtual machine. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}



variable "vm_legacy_sod_name" {
  description = "(Required) Specifies the name of the OS Disk."
  type        = string
  default     = "default"
}

variable "vm_legacy_sod_caching" {
  description = "(Optional) Specifies the caching requirements for the OS Disk. Possible values include None, ReadOnly and ReadWrite."
  type        = string
  default     = "default"
}

variable "vm_legacy_sod_coption" {
  description = "(Required) Specifies how the OS Disk should be created. Possible values are Attach (managed disks only) and FromImage."
  type        = string
  default     = "default"
}

variable "vm_legacy_sod_mdtype" {
  description = "(Optional) Specifies the type of Managed Disk which should be created. Possible values are Standard_LRS, StandardSSD_LRS or Premium_LRS."
  type        = string
  default     = "default"
}


variable "vm_legacy_op_computername" {
  description = "(Required) Specifies the name of the Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}

variable "vm_legacy_op_username" {
  description = "(Required) Specifies the name of the local administrator account."
  type        = string
  default     = "default"
}

variable "vm_legacy_op_password" {
  description = "(Optional) (Optional for Windows, Optional for Linux) The password associated with the local administrator account."
  type        = string
  default     = "default"
}


variable "vm_legacy_oplc_disablepwauth" {
  description = "(Required) Specifies whether password authentication should be disabled. If set to false, an admin_password must be specified."
  default     = false
}


variable "vm_legacy_opwc_pvmagent" {
  description = "(Optional) Should the Azure Virtual Machine Guest Agent be installed on this Virtual Machine? Defaults to false."
  default     = false
}

variable "vm_legacy_opwc_eaupdates" {
  description = "(Optional) Are automatic updates enabled on this Virtual Machine? Defaults to false."
  default     = false
}


variable "vm_legacy_label" {
  description = "(Optional) A label to assign which environment are going to use this resource."
  type        = string
  default     = "default"
}


variable "vm_legacy_select" {
  description = "(Required) Use to choose if we create the resource or not. To create a Windows VM use True and for Linux VM use False."
  default     = true
}

##################################################################################
# Virtual Machine - Linux
##################################################################################

##################################################################################
# Virtual Machine - Windows
##################################################################################