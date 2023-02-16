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
#   availability_zone = "us-east-1a"

#   tags = {
#     Name        = "Test"
#     Description = "Managed by Terraform"
#   }

#   depends_on = [
#     aws_vpc.vpc-env1-test-001
#   ]
# }

# output "o_pub-snet-env1-test-001_id" {
#   description = "pub-snet-env1-test-001_id"
#   value       = aws_subnet.pub-snet-env1-test-001.id
# }

# ##################################################################################
# # Public Subnet
# ##################################################################################
# resource "aws_subnet" "pub-snet-env1-test-002" {
#   vpc_id            = aws_vpc.vpc-env1-test-001.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1b"

#   tags = {
#     Name        = "Test1"
#     Description = "Managed by Terraform"
#   }

#   depends_on = [
#     aws_vpc.vpc-env1-test-001
#   ]
# }

# output "o_pub-snet-env1-test-002_id" {
#   description = "pub-snet-env1-test-002_id"
#   value       = aws_subnet.pub-snet-env1-test-002.id
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
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow RDS MySQL"
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

# resource "aws_route_table_association" "rta-env1-test-002" {
#   subnet_id      = aws_subnet.pub-snet-env1-test-002.id
#   route_table_id = aws_route_table.rt-env1-test-001.id
# }

# #####################################################
# # KMS RDS 
# #####################################################
# resource "aws_kms_key" "kms-env1-test-001" {
#   description         = "KMS key for RDS MySQL"
#   enable_key_rotation = true
#   tags = {
#     Name        = "kms_rds_mysql"
#     Description = "Managed by Terraform"
#   }
# } 

# output "o_kms-env1-test-001" {
#   description = "kms-env1-test-001_id"
#   value       = aws_kms_key.kms-env1-test-001.arn
# }

# #####################################################
# # Random password 
# #####################################################
# resource "random_password" "default_password" {
#   length           = 30
#   special          = true
#   override_special = "!#$%&*()-_=+[]{}<>:?"
  
# }

# output "o_default_password" {
#   description = "default_password"
#   value       = random_password.default_password
#   sensitive        = true
# }