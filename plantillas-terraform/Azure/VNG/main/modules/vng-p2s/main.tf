resource "azurerm_virtual_network_gateway" "vng-env1-test-001" {
  name                = var.vng_name
  location            = var.vng_location
  resource_group_name = var.vng_rg_name

  type     = var.vng_type
  vpn_type = var.vng_vpn_type

  active_active = var.vng_active_active
  enable_bgp    = var.vng_bgp
  sku           = var.vng_sku

  ip_configuration {
    name                          = var.vng_ipc_name
    public_ip_address_id          = var.vng_ipc_pub_ip_id
    private_ip_address_allocation = var.vng_ipc_priv_ip_id
    subnet_id                     = var.vng_ipc_sbnt_id
  }

  vpn_client_configuration {
    address_space = var.vng_cc_addres_space

    root_certificate {
      name = var.vng_cc_rc_name

      public_cert_data = var.vng_cc_rc_pub_cd
    }

    revoked_certificate {
      name       = var.vng_cc_rvc_name
      thumbprint = var.vng_cc_rvc_thumbprint
    }
  }
}

output "vng-env1-test-001_id" {
  value = azurerm_virtual_network_gateway.vng-env1-test-001.id
}
