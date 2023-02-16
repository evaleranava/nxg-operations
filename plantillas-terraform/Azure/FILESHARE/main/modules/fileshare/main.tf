#STORAGE ACCOUNT
resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name #"storageaccountname"
  resource_group_name      = var.sa_rg 
  location                 = var.sa_location 
  account_tier             = var.sa_tier #"Standard"
  account_replication_type = var.sa_replication #"GRS"

}


#FILE SHARE
resource "azurerm_storage_share" "share" {
  name                 = var.share_name #"sharename"
  storage_account_name = var.sa_name #azurerm_storage_account.example.name
  quota                = var.share_quota #50

  depends_on = [
    azurerm_storage_account.sa
  ]
}

resource "azurerm_storage_share_file" "fs" {
  name             = var.fs_name #"my-awesome-content.zip"
  storage_share_id = azurerm_storage_share.share.id
  source           = var.fs_source #"some-local-file.zip"

  depends_on = [
    azurerm_storage_share.share
  ]
}