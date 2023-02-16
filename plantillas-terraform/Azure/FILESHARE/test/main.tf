##################################################################################
# STORAGE ACCOUNTS
##################################################################################
#RESOURCE GROUP
resource "azurerm_resource_group" "storage_rg" {
  name     = "storage-rg"
  location = "westus"
}

#Output sa_rg
output "o_sa_rg" {
    description = "o_sa_rg"
    value = "${[azurerm_resource_group.storage_rg.name]}"
}

#Output sa_location
output "o_sa_rg_location" {
    description = "o_sa_rg_location"
    value = "${[azurerm_resource_group.storage_rg.location]}"
}