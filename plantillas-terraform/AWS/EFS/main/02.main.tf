locals {
  # get json 
  json_value = jsondecode(file("../test/output.json"))

  # setting each local variables
  o-pub-snet-env1-test-001 = local.json_value["pub-snet-env1-test-001"]["value"]
  o-sg-env1-test-002       = local.json_value["sg-env1-test-002"]["value"]
}

module "efs-test" {

  source = "./modules/efs_az"

  efs_name            = "test"
  efs_encrypted       = false
  efs_throughput_mode = "provisioned"
  efs_pt_in_mibps     = 5
  efs_az_name         = "us-west-2a"

}

resource "aws_efs_mount_target" "mount_efs_to_ec2" {
  file_system_id   = "fs-09dec09821b5ed368"
  subnet_id        = local.o-pub-snet-env1-test-001
  ip_address       = "10.0.0.6"
  security_groups  = [local.o-sg-env1-test-002]
}

# sudo yum install -y amazon-efs-utils
#
