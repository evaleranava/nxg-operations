variable "sql_vm_name" {
  description = "Name of the SQL Virtual Machine"
  default     = "sql-vm"
}

variable "sql_vm_location" {
    description = "Location of the SQL Virtual Machine"
    default     = "westus"
}

variable "sql_vm_rg" {
  description = "Resource Group Name of the SQL Virtual Machine"
  default     = "sql-vm-rg"
}

variable "sql_vm_nic_ids" {
  description = "Network Interface IDs of the SQL Virtual Machine"
  default     = []
}

variable "sql_vm_size" {
  description = "Size of the SQL Virtual Machine"
  default     = "Standard_D2s_v3"
}

variable "sql_img_publisher" {
  description = "Image Publisher of the SQL Virtual Machine"
  default     = "MicrosoftSQLServer"
}
  
variable "sql_img_offer" {
  description = "Image Offer of the SQL Virtual Machine"
  default     = "SQL2019-WS2019"
}

variable "sql_img_sku" {
  description = "Image SKU of the SQL Virtual Machine"
  default     = "SQLDEV"
}

variable "sql_img_version" {
  description = "Image Version of the SQL Virtual Machine"
  default     = "latest"
}

variable "sql_osdisk_name" {
  description = "OS Disk Name of the SQL Virtual Machine"
  default     = "sql-osdisk"
}

/* variable "sql_osdisk_size" {
    description = "OS Disk Size of the SQL Virtual Machine"
    default     = 128
} */

variable "sql_osdisk_caching" {
    description = "OS Disk Caching of the SQL Virtual Machine"
    default     = "ReadWrite"
}

variable "sql_osdisk_create_option" {
    description = "OS Disk Create Option of the SQL Virtual Machine"
    default     = "FromImage"
}

variable "sql_osdisk_manage_disk_type" {
    description = "OS Disk Managed Disk Type of the SQL Virtual Machine"
    default     = "Standard_LRS"
}
  
variable "sql_os_prof_name" {
  description = "OS Profile Name of the SQL Virtual Machine"
  default     = "sql-os-profile"
}
  
variable "sql_os_prof_username" {
  description = "OS Profile Username of the SQL Virtual Machine"
  default     = "sqladmin"
}

variable "sql_os_prof_pass" {
  description = "OS Profile Password of the SQL Virtual Machine"
  default     = "P@ssw0rd1234"
}
  
variable "sql_os_prof_win_time" {
  description = "OS Profile Windows Timezone of the SQL Virtual Machine"
  default     = "Pacific Standard Time"
}
  
variable "sql_license_type" {
  description = "License Type of the SQL Virtual Machine"
  default     = "PAYG"
}
  
