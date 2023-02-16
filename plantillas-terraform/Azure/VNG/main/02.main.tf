locals {
  # get json 
  json_value = jsondecode(file("../test/output.json"))

  # setting each local variables
  sbnt-env1-test-001_id     = local.json_value["sbnt-env1-test-001_id"]["value"]
  pip-env1-test-001_id      = local.json_value["pip-env1-test-001_id"]["value"]
  rg-env1-test-001_location = local.json_value["rg-env1-test-001_location"]["value"]
  rg-env1-test-001_name     = local.json_value["rg-env1-test-001_name"]["value"]
}

module "test-vng-01" {
  source = "./modules/vng-p2s"

  vng_name          = "test-vng-01"
  vng_location      = local.rg-env1-test-001_location
  vng_rg_name       = local.rg-env1-test-001_name
  vng_type          = "Vpn"
  vng_vpn_type      = "RouteBased"
  vng_active_active = false
  vng_bgp           = false
  vng_sku           = "VpnGw2"

  vng_ipc_name       = "vnetGatewayConfig"
  vng_ipc_pub_ip_id  = local.pip-env1-test-001_id
  vng_ipc_priv_ip_id = "Dynamic"
  vng_ipc_sbnt_id    = local.sbnt-env1-test-001_id

  vng_cc_addres_space = ["10.2.0.0/24"]

  vng_cc_rc_name = "MyRoot"
  vng_cc_rc_pub_cd = <<EOF
MIIC3TCCAcWgAwIBAgIQKTLSg0sbaZVIhTuuSMvtmzANBgkqhkiG9w0BAQsFADAR
MQ8wDQYDVQQDDAZNeVJvb3QwHhcNMjIxMjIyMTQzNTA1WhcNMjMxMjIyMTQ1NTA1
WjARMQ8wDQYDVQQDDAZNeVJvb3QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
AoIBAQCz/kwOPP+ZKDLUu0Q5KdUqFbdAde7gBybb4+oaOa1bQ/FNTsXKWc0cJu7s
JcmOcou357EQ/mIoTHtDjDoBdPXjzMaIA8ijvgh4v6V83m96PonWR8LkK6U71suC
gNDtH1FstVKsvzgsceiEdi62qMz+mLJvLP6ej+aRbdcNsgyd4xYka9EMk95qc0WK
jR6ZJvPKK+373FjJe2mpKGLdtuEsXnx0qzRd7PIVg0zskk1Po1UGWi2+B7oqyI+R
9GrhTtYADanZNor5saKCxWBWP8rum/FlocVT70Zv1ETaXtUyJOP5ZhePNKd3aAZl
7jZROdOoNG0FDaoE3h5ixj5cDaUdAgMBAAGjMTAvMA4GA1UdDwEB/wQEAwICBDAd
BgNVHQ4EFgQU37KhqhNm3u9cgDWa8EG+JRVlZsMwDQYJKoZIhvcNAQELBQADggEB
AJYtVv4yqr6St/Vg7m66pCM47z6xx5crur3JgfNV4hqOcQczQRnZV/KBrsyRhp6f
ExmJQONOKqj/daj/hafFbbTQWzgN7OCrm2LFjtkwPz2SknXW4EqdsdbpsekX/gGu
BMy8WGPNcgEQK05yPwTaP35AlfcR5HSsNTQw4C8HsP2cYKYkgmMrkyA1qPUasB0f
nABLXv1tJtkJmY4V1S70chU9ijq4btmrYemcofZHz9SQp8Z0NSw+f7gpXi+Z6lRV
DP3hy+G4igdVdyKSYxKaJxtskcFKfGrdJovpdA8zo7ageWG/Omj9/Bic0yQh1Xq4
XTHW1q0fcGZGPi5e4T6dcsA= 
EOF

  vng_cc_rvc_name = "Verizon-Global-Root-CA"
  vng_cc_rvc_thumbprint = "912198EEF23DCAC40939312FEE97DD560BAE49B1"

}

