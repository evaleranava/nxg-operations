# ##################################################################################
# # VPC
# ##################################################################################
# resource "aws_vpc" "vpc-env1-test-001" {
#   cidr_block           = "10.0.0.0/16"
#   enable_dns_hostnames = true

#   tags = {
#     Name        = "Test"
#     Description = "Managed by Terraform"
#   }
# }

# ##################################################################################
# # Internet Gateway
# ##################################################################################
# resource "aws_internet_gateway" "igw-env1-test-001" {
#   vpc_id = aws_vpc.vpc-env1-test-001.id

#   tags = {
#     Name        = "Test"
#     Description = "Managed by Terraform"
#   }
# }

# ##################################################################################
# # Public Subnet
# ##################################################################################
# resource "aws_subnet" "pub-snet-env1-test-001" {
#   vpc_id            = aws_vpc.vpc-env1-test-001.id
#   cidr_block        = "10.0.0.0/24"
#   availability_zone = "us-west-2a"

#   tags = {
#     Name        = "Test"
#     Description = "Managed by Terraform"
#   }

#   depends_on = [
#     aws_vpc.vpc-env1-test-001
#   ]
# }

# ##################################################################################
# # Security Group
# ##################################################################################
# resource "aws_security_group" "sg-env1-test-001" {
#   name        = "env1-test-001"
#   description = "Allow incoming connections"
#   vpc_id      = aws_vpc.vpc-env1-test-001.id

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow incoming HTTP connections"
#   }

#   ingress {
#     from_port   = 3389
#     to_port     = 3389
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow incoming RDP connections"
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name        = "Test"
#     Description = "Managed by Terraform"
#   }
# }

# output "sg-env1-test-001" {
#   description = "sg-env1-test-001_id"
#   value       = aws_security_group.sg-env1-test-001.id
# }

# ##################################################################################
# # Network Interface
# ##################################################################################
# resource "aws_network_interface" "nic-env1-test-001" {
#   subnet_id       = aws_subnet.pub-snet-env1-test-001.id
#   private_ips     = ["10.0.0.4"]
#   security_groups = [aws_security_group.sg-env1-test-001.id]

#   tags = {
#     Name        = "Test"
#     Description = "Managed by Terraform"
#   }
# }

# output "nic-env1-test-001" {
#   description = "nic-env1-test-001_id"
#   value       = aws_network_interface.nic-env1-test-001.id
# }

# ##################################################################################
# # Elastic IP
# ##################################################################################
# resource "aws_eip" "eip-env1-test-001" {
#   vpc               = true
#   network_interface = aws_network_interface.nic-env1-test-001.id
#   tags = {
#     Name        = "Test"
#     Description = "Managed by Terraform"
#   }
# }

# ##################################################################################
# # Route Table
# ##################################################################################
# resource "aws_route_table" "rt-env1-test-001" {
#   vpc_id = aws_vpc.vpc-env1-test-001.id


#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw-env1-test-001.id
#   }

#   tags = {
#     Name        = "Test"
#     Description = "Managed by Terraform"
#   }
# }

# resource "aws_route_table_association" "rta-env1-test-001" {
#   subnet_id      = aws_subnet.pub-snet-env1-test-001.id
#   route_table_id = aws_route_table.rt-env1-test-001.id
# }

# ##################################################################################
# # Key Pair
# ##################################################################################
# resource "aws_key_pair" "kp-env1-test-001" {
#   key_name   = "kp-env1-test-001"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzb84dNg/oLN8nTesbsBDddH9/WO/O3VUFmE1QEMuiTAzF2oDO6K8oDB24Jh4x4MN8DwqBOMRbbEDn37YLG9xWeA6SPJObS3qLhO5zcO5BAxv2SRrdWTK+uu4o1FO8z5I3ic2lyyMdDSUeqaFlZ7QqJINgn46X7wCFDveFFa+7L/59R1qCI39pswuYgUe1+Ljk9Y6xDxz+9ITfZOOjFaOCXxAiGmJkISssPdtRzGOkiv0sZc4K/fxYWFZ32sApnjq45tR0BfJOHHPzfv7v/ju6iDFCazQVt+EkUulCjxPpptno4M1BZAL0MV7TL7gKni+0PCGa99vMA5NHY2AzotgvALBmU4ZISvYwDDYixn4NPvkX8uNk1iZba9TD+W4GDIwNfEB/CGuIAe9z2USXdL9c5cbXLKfAoKgIUnqUr/+d5XWY+zXGDLwQki6QTJzVo7D+D1wOXryWog70/hlWj1Wv3wOP5/1UOwSNAseWLch/1MnvZJsqpELmYy5S5/6vMBk= dvelazquez@Lap-dvelazquez"
# }

# output "kp-env1-test-001" {
#   description = "kp-env1-test-001_name"
#   value       = aws_key_pair.kp-env1-test-001.key_name
# }
