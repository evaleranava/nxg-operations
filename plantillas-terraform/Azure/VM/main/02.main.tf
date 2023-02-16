locals {
  # get json 
  json_value = jsondecode(file("../test/output.json"))

  # setting each local variables
  nic-env1-test-001_id      = local.json_value["nic-env1-test-001_id"]["value"]
  nic-env1-test-002_id      = local.json_value["nic-env1-test-002_id"]["value"]
  rg-env1-test-001_location = local.json_value["rg-env1-test-001_location"]["value"]
  rg-env1-test-001_name     = local.json_value["rg-env1-test-001_name"]["value"]
}

module "test-vm1" {
  source = "./modules/VM-Legacy"

  vm_legacy_select = false

  vm_legacy_location = local.rg-env1-test-001_location
  vm_legacy_rg_name  = local.rg-env1-test-001_name
  vm_legacy_nic_id   = local.nic-env1-test-001_id
  
  vm_legacy_name     = "test-vm1"
  vm_legacy_size     = "Standard_B1s"

  vm_legacy_delete_osdisk    = true
  vm_legacy_delete_datadisks = true

  vm_legacy_sir_publisher = "Canonical"
  vm_legacy_sir_offer     = "UbuntuServer"
  vm_legacy_sir_sku       = "18.04-LTS"
  vm_legacy_sir_version   = "latest"

  vm_legacy_sod_name    = "test-vm1-osdisk"
  vm_legacy_sod_caching = "ReadWrite"
  vm_legacy_sod_coption = "FromImage"
  vm_legacy_sod_mdtype  = "Standard_LRS"

  vm_legacy_op_computername = "test-vm1"
  vm_legacy_op_username     = "azureadmin"
  vm_legacy_op_password     = "Password123456"

  vm_legacy_oplc_disablepwauth = false

  vm_legacy_label = "test"
}



module "test-vm2" {
  source = "./modules/VM-Legacy"

  vm_legacy_select   = true

  vm_legacy_location = local.rg-env1-test-001_location
  vm_legacy_rg_name  = local.rg-env1-test-001_name
  vm_legacy_nic_id   = local.nic-env1-test-002_id
  
  vm_legacy_name     = "test-vm2"
  vm_legacy_size     = "Standard_B1s"

  vm_legacy_delete_osdisk    = true
  vm_legacy_delete_datadisks = true

  vm_legacy_sir_publisher = "MicrosoftWindowsServer"
  vm_legacy_sir_offer     = "WindowsServer"
  vm_legacy_sir_sku       = "2022-Datacenter"
  vm_legacy_sir_version   = "latest"

  vm_legacy_sod_name    = "test-vm2-osdisk"
  vm_legacy_sod_caching = "ReadWrite"
  vm_legacy_sod_coption = "FromImage"
  vm_legacy_sod_mdtype  = "Standard_LRS"

  vm_legacy_op_computername = "test-vm2"
  vm_legacy_op_username     = "azureadmin"
  vm_legacy_op_password     = "Password123456"

  vm_legacy_opwc_pvmagent  = true
  vm_legacy_opwc_eaupdates = false

  vm_legacy_label = "test"
}

