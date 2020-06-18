# Terraform configuration

#Set provider details and credentials
provider "aws" {
  region     = "us-east-2" #leaving blank will prompt for value at plan/apply time
  #credentials/config- using Amazon CLI -- can use tfvars, or key vars, export, etc
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"
}

#Set tags to be applied to EC2 instance
locals {
  tags = merge({ 
    terraform = "true", 
    Inspector = "InspectorEC2InstanceLinux"
    Name = "gweedoredp-${var.environment_prefix}",
    }, {environment = var.environment_prefix, tenant = var.tenant})
}

#Set module paramaters to define/deploy as desired
module "ec2_instances" {
  source = "./modules/ec2-instances"
  instance_count = "1"
  ami_id = "ami-0f7919c33c90f5b58"
  region = "us-east-2"
  instance_type = "t2.micro"
  #subnet_id = module.vpc.subnet_id
  key_file_path = "~/Downloads/Team-Marvel-GDP.pem"
  aws_team_key_id = "Team-Marvel-GDP"
  team_name = "Team_Marvel"
  app_name = "GweedoreDP"
  iam_profile_aws = "AmazonSSMRoleForInstancesQuickSetup"
  security_group_aws = "launch-wizard-3"
  resource_group_name = "${var.environment_prefix}-${var.tenant}"
  environment_prefix = var.environment_prefix
  tenant = var.tenant
  tags = local.tags
}

#not actively using VPC module, but may initialize in later sprints
/*
module "vpc" {
  source = "./modules/vpc"
} 
*/

#not actively using VPC module, but may initialize in later sprints
/*
module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"
  bucket_name = "gweedoredp_s3_bucket"

  tags = {
    Terraform   = "true"
    Environment = ""
  }
}*/
