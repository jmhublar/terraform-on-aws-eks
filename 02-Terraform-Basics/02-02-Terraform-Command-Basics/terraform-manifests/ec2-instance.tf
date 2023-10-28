# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 4.65" # Optional but recommended in production
    }
  }
}

# variable block
variable "ami_id" {}
variable "profile" {}

# Provider Block
provider "aws" {
  profile = var.profile # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "us-east-1"
}


# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = var.ami_id
  instance_type = "t2.micro"
}
