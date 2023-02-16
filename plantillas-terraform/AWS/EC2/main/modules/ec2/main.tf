
resource "aws_instance" "ami_instance" {
  ami                     = var.ec2_ami
  instance_type           = var.ec2_instance_type
  key_name                = var.ec2_key_name
  disable_api_termination = var.ec2_disable_api_termination
  # vpc_security_group_ids  = var.ec2_vpc_security_group_ids
  # iam_instance_profile    = var.ec2_iam_instance_profile

  network_interface {
    network_interface_id = var.ec2_ni_nid
    device_index         = var.ec2_ni_device_index
  }

  root_block_device {
    delete_on_termination = var.ec2_rbd_delete_on_termination
    encrypted             = var.ec2_rbd_encrypted
    volume_size           = var.ec2_rbd_volume_size
    volume_type           = var.ec2_rbd_volume_type
  }

  tags = {
    Name        = "Test"
    Description = "Managed by Terraform"
  }
}

output "ami_instance_id" {
  value = aws_instance.ami_instance.id
}
