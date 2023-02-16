##################################################################################
# Virtual Machine - Legacy Linux
##################################################################################

resource "azurerm_virtual_machine" "vm1_legacy" {
  count = var.vm_legacy_select ? 0 : 1

  name                  = var.vm_legacy_name
  location              = var.vm_legacy_location
  resource_group_name   = var.vm_legacy_rg_name
  network_interface_ids = var.vm_legacy_nic_id
  vm_size               = var.vm_legacy_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = var.vm_legacy_delete_osdisk

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = var.vm_legacy_delete_datadisks

  storage_image_reference {
    publisher = var.vm_legacy_sir_publisher
    offer     = var.vm_legacy_sir_offer
    sku       = var.vm_legacy_sir_sku
    version   = var.vm_legacy_sir_version
  }
  storage_os_disk {
    name              = var.vm_legacy_sod_name
    caching           = var.vm_legacy_sod_caching
    create_option     = var.vm_legacy_sod_coption
    managed_disk_type = var.vm_legacy_sod_mdtype
  }
  os_profile {
    computer_name  = var.vm_legacy_op_computername
    admin_username = var.vm_legacy_op_username
    admin_password = var.vm_legacy_op_password
  }
  os_profile_linux_config {
    disable_password_authentication = var.vm_legacy_oplc_disablepwauth
  }
  tags = {
    environment = var.vm_legacy_label
  }
}

##################################################################################
# Virtual Machine - Legacy Windows
##################################################################################

resource "azurerm_virtual_machine" "vm2_legacy" {
  count = var.vm_legacy_select ? 1 : 0

  name                  = var.vm_legacy_name
  location              = var.vm_legacy_location
  resource_group_name   = var.vm_legacy_rg_name
  network_interface_ids = var.vm_legacy_nic_id
  vm_size               = var.vm_legacy_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = var.vm_legacy_delete_osdisk

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = var.vm_legacy_delete_datadisks

  storage_image_reference {
    publisher = var.vm_legacy_sir_publisher
    offer     = var.vm_legacy_sir_offer
    sku       = var.vm_legacy_sir_sku
    version   = var.vm_legacy_sir_version
  }
  storage_os_disk {
    name              = var.vm_legacy_sod_name
    caching           = var.vm_legacy_sod_caching
    create_option     = var.vm_legacy_sod_coption
    managed_disk_type = var.vm_legacy_sod_mdtype
  }
  os_profile_windows_config {
    provision_vm_agent        = var.vm_legacy_opwc_pvmagent
    enable_automatic_upgrades = var.vm_legacy_opwc_eaupdates
  }
  os_profile {
    computer_name  = var.vm_legacy_op_computername
    admin_username = var.vm_legacy_op_username
    admin_password = var.vm_legacy_op_password
  }
  tags = {
    environment = var.vm_legacy_label
  }
}
