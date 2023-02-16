resource "azurerm_virtual_machine" "sql_vm" {
  name                  = var.sql_vm_name      #"sql-vm"
  location              = var.sql_vm_location      #"westus"
  resource_group_name   = var.sql_vm_rg      #"rg-2"
  network_interface_ids = var.sql_vm_nic_ids #[azurerm_network_interface.sql_nic.id]
  vm_size               = var.sql_vm_size      #"Standard_DS14_v2"

  storage_image_reference {
    publisher = var.sql_img_publisher        #"MicrosoftSQLServer"
    offer     = var.sql_img_offer        #"SQL2017-WS2016"
    sku       = var.sql_img_sku        #"SQLDEV"
    version   = var.sql_img_version        #"latest"
  }

  storage_os_disk {
    name              = var.sql_osdisk_name        #"${var.prefix}-OSDisk"
    #size_gb              = var.sql_osdisk_size        #128
    caching           = var.sql_osdisk_caching        #"ReadOnly"
    create_option     = var.sql_osdisk_create_option        #"FromImage"
    managed_disk_type = var.sql_osdisk_manage_disk_type        #"Premium_LRS"
  }

/*   storage_configuration {
    disk_type             = var.sql_disk_type        #"Premium_LRS"
    storage_workload_type = var.sql_storage_workload_type        #"General"
    storage_settings {
        default_file_path = var.sql_storage_default_file_path        #"D:\\"
        luns = [
            var.sql_storage_luns        #0
        ]
    }
    temp_db_settings{
        default_file_path = var.sql_temp_db_default_file_path        #"D:\\"
        luns = [
            var.sql_temp_db_luns        #1
        ]
    }
  } */

  os_profile {
    computer_name  = var.sql_os_prof_name           #"sql-os-prof"
    admin_username = var.sql_os_prof_username       #"sqladmin"
    admin_password = var.sql_os_prof_pass           #"Password1234!"
  }

  os_profile_windows_config {
    timezone                  = var.sql_os_prof_win_time   #"Pacific Standard Time"
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }

}

resource "azurerm_mssql_virtual_machine" "sql_vm_associate" {
  virtual_machine_id = azurerm_virtual_machine.sql_vm.id
  sql_license_type   = var.sql_license_type     #"PAYG"
}