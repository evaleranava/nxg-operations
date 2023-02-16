

#######################################
# Balancer Variables
#######################################
# Example balancer
example_lb_name         = "example-lb"
example_lb_location     = ""
example_lb_rg_name      = ""
example_lb_sku          = "Basic"
example_lb_sku_tier     = "Regional"
example_lb_fip_name     = "example-lb-fip"
#example_lb_subnet_id    = ""
example_lb_pip_id       = ""
example_lb_bep_name     = "example-lb-bep"
example_lb_nat_pool_name = "example-lb-nat-pool"
example_lb_np_protocol  = "Tcp"
example_lb_npfps        = 80
example_lb_npfpe        = 81
example_lb_npbp         = 8080

example_lb_nr_name      = "example-lb-nr"  
example_lb_nr_protocol  = "Tcp"
example_lb_nrfp         = 3389     
example_lb_nrbp         = 3389

# example_lb_o_r_name     = "example-lb-o-r"
# example_lb_o_r_protocol = "Tcp"
# example_lb_ports        = 80
# example_lb_port = 80
# example_lb_protocol = "HTTP"
# example_lb_health_check = "HTTP:80/"
# example_lb_health_check_interval = 30
# example_lb_health_check_timeout = 5
# example_lb_health_check_unhealthy_threshold = 2
# example_lb_health_check_healthy_threshold = 2
# example_lb_instance_port = 80
# example_lb_instance_protocol = "HTTP"
# example_lb_instance_id = "i-12345678"
# example_lb_instance_zone = "us-east-1a"
# example_lb_instance_weight = 1
# example_lb_instance_health_check = "HTTP:80/"
# example_lb_instance_health_check_interval = 30
# example_lb_instance_health_check_timeout = 5
# example_lb_instance_health_check_unhealthy_threshold = 2
# example_lb_instance_health_check_healthy_threshold = 2
# example_lb_instance_health_check_target = "HTTP:80/"
# example_lb_instance_health_check_target_interval = 30
# example_lb_instance_health_check_target_timeout = 5
# example_lb_instance_health_check_target_unhealthy_threshold = 2
# example_lb_instance_health_check_target_healthy_threshold = 2
# example_lb_instance_health_check_target_port = 80
# example_lb_instance_health_check_target_protocol = "HTTP"
# example_lb_instance_health_check_target_path = "/"
# example_lb_instance_health_check_target_response = "HTTP/1.1 200 OK"
# example_lb_instance_health_check_target_response_code = 200
# example_lb_instance_health_check_target_response_string = "OK"
# example_lb_instance_health_check_target_response_string_match = "OK"
# example_lb_instance_health_check_target_response_string_match_regex = "OK"
# example_lb_instance_health_check_target_response_string_match_regex_case_insensitive = "OK"



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

#######################################
# STORAGE Variables
#######################################

# Storage Account Variables
example_sa_name            = "storagedraftees"
example_sa_rg              = ""
example_sa_location        = ""
example_sa_tier            = "Standard"
example_sa_replication     = "LRS"

# Storage Share Variables
example_share_name         = "storagesharedraftees"
example_share_quota        = 50

# Storage Share File Variables
example_fs_name            = "filesharedraftees"
example_fs_source          = "C:\\Users\\evalera\\Desktop\\test.txt"