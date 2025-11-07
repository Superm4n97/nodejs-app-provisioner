terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

module "eks" {
    source = "./modules/eks"

  cluster_name = "rasel-test"
  node_group_desired = 2
}