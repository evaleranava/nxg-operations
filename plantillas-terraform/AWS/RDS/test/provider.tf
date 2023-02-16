terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.54.0"

    }
  }
}

# Default Region
provider "aws" {
  region  = "us-east-1"
}