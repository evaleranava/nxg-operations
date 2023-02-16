resource "aws_efs_file_system" "efs-env1-test-001" {
  creation_token                  = var.efs_name
  encrypted                       = var.efs_encrypted
  throughput_mode                 = var.efs_throughput_mode
  provisioned_throughput_in_mibps = var.efs_pt_in_mibps
  availability_zone_name          = var.efs_az_name

  tags = {
    Name        = "Test"
    Description = "Managed by Terraform"
  }
}
