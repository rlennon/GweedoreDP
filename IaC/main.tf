# Terraform configuration

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "ec2_instances" {
  source = "./modules/ec2-instances"
  instance_count = var.instance_count
  ami_id = var.ami_id
  region = var.region
  instance_type = var.instance_type
  #subnet_id = module.vpc.subnet_id
  key_file_path = var.key_file_path
  aws_team_key_id = var.aws_team_key_id
  team_name = var.team_name
  app_name = var.app_name
  prefix = var.prefix
  iam_profile_aws = var.iam_profile_aws
  security_group_aws = var.security_group_aws
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