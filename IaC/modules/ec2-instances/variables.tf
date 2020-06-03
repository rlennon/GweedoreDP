# Input variable definitions
variable "ami_id" {
  description = "The Amazon Machine Image ID"
  type        = string
}

variable "region" {
  description = "The Amazon default region"
  type        = string
}

variable "instance_type" {
  description = "The AWS instance type"
  type        = string
}

variable "instance_count" {
  description = "Number of instances of aws EC2 servers"
  type        = number
}

variable "key_file_path" {
  description = "This is the path to private key managed by aws"
  type        = string
}

variable "aws_team_key_id" {
  description = "This is the aws managed key"
  type        = string
}

variable "team_name" {
  description = "This is the name of the team of owners."
  type        = string
  default     = ""
}

variable "app_name" {
  description = "Path to the certificate key used to verify incoming connections."
  type        = string
  default     = ""
}

variable "prefix" {
  description = "This is the environment where your webapp is deployed."
  type = string
  default = "dev"
}

variable "iam_profile_aws" {
  description = "This is the available IAM profile"
  type = string
}

variable "security_group_aws" {
  description = "This is the available IAM profile"
  type = string
}

#variable "subnet_id" {}

variable "tags" {
  description = "Custom tags for assignment"
  type = map(string)
  default = {}
}


