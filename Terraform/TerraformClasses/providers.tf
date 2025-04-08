terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}

provider "aws" {
  # Configure the AWS Provider
  region  = "us-east-1"
  profile = "victor"

}
