# Terraform Remote State Datasource - Remote Backend AWS S3
# EKS Cluster Project
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "jmh-terraform-state-bucket"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = "us-east-1" 
  }
}