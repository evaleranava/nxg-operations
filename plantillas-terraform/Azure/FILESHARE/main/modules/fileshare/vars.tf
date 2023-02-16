#Storage Account
variable "sa_name" {
  description = "(Required) Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
  type        = string
  default     = "storageaccount"
}

variable "sa_rg" {
  description = "(Required) Specifies the name of the resource group in which to create the storage account. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "sa_location" {
  description = "(Required) Specifies the supported Azure Region where the storage account should be created. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "sa_tier" {
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
}

variable "sa_replication" {
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
  type        = string
  default     = "GRS"
}

#Storage Share
variable "share_name" {
  description = "(Required) The name of the share. Must be unique within the storage account where the share is located. Changing this forces a new resource to be created."
  type        = string
  default     = "storage_share"
}

variable "share_quota" {
  description = "(Required) The maximum size of the share, in gigabytes. For Standard storage accounts, this must be 1GB (or higher) and at most 5120 GB (5 TB). For Premium FileStorage storage accounts, this must be greater than 100 GB and at most 102400 GB (100 TB)."
  type        = number
  default     = 50
}

#Storage Share File
variable "fs_name" {
  description = "(Required) The name (or path) of the File that should be created within this File Share. Changing this forces a new resource to be created."
  type        = string
  default     = "my-fileshare"
}

variable "fs_source" {
  description = "(Optional) An absolute path to a file on the local system. Changing this forces a new resource to be created."
  type        = string
  default     = "some-local-file.zip"
}

