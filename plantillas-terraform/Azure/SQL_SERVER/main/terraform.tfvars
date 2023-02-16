#######################################
# SQL Server Variables
#######################################
# SQL VM
example_sql_vm_name                 = "sql-vm"
example_sql_vm_location             = ""
example_sql_vm_rg                   = ""
example_sql_vm_nic_ids              = [""]
example_sql_vm_size                 = "Standard_DS1_v2"
example_sql_img_vm_publisher        = "MicrosoftSQLServer"
example_sql_img_offer               = "sql2019-ws2019"
example_sql_img_sku                 = "standard"
example_sql_img_version             = "latest"
example_sql_osdisk_name             = "sql-osdisk"
example_sql_osdisk_caching          = "ReadWrite"
example_sql_osdisk_create_option    = "FromImage"
example_sql_osdisk_manage_disk_type = "Standard_LRS"
example_sql_os_prof_name            = "sql-osprof"
example_sql_os_prof_username        = "sqladmin"
example_sql_os_prof_pass            = "P@ssw0rd1234!"
example_sql_os_prof_win_time        = "Pacific Standard Time"
example_sql_license_type            = "PAYG"