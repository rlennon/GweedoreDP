# Terraform configuration

provider "aws" {
  region = "us-east-2"
}

module "vpc" {
  source  = "./modules/vpc"
}

module "ec2_instances" {
  source  = "./modules/ec2-instances"
}
/*
module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "gweedoredp_s3_bucket"

  tags = {
    Terraform   = "true"
    Environment = ""
  }
}*/
