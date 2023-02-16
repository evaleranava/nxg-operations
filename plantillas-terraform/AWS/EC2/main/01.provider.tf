terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "4.54.0"
    }
  }
}

# Default Region
provider "aws" {
  region  = "us-west-2"
}

# Profile Regions
provider "aws" {
  alias   = "prd1"
  region  = "us-east-1"
}

provider "aws" {
  alias   = "prd2"
  region  = "us-east-2"
}
