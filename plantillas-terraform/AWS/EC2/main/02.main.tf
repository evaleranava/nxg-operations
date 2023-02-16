locals {
  # get json 
  json_value = jsondecode(file("../test/output.json"))

  # setting each local variables
  o-nic-env1-test-001 = local.json_value["nic-env1-test-001"]["value"]
  o-kp-env1-test-001  = local.json_value["kp-env1-test-001"]["value"]
  o-sg-env1-test-001  = local.json_value["sg-env1-test-001"]["value"]
}

module "test-ec2-instance" {
  source = "./modules/ec2"

  ec2_ami                     = "ami-0e2daa9ce776be2b0" # Windows Server 2022 Base
  ec2_instance_type           = "t2.micro"
  ec2_key_name                = local.o-kp-env1-test-001
  ec2_disable_api_termination = false
  # ec2_vpc_security_group_ids  = [local.o-sg-env1-test-001]

  ec2_ni_nid          = local.o-nic-env1-test-001
  ec2_ni_device_index = 0

  ec2_rbd_delete_on_termination = true
  ec2_rbd_encrypted             = false
  ec2_rbd_volume_size           = 50
  ec2_rbd_volume_type           = "gp2"
}

