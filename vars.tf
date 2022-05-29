# Provider variables
variable "region" {}

# VPC variables
variable "main_vpc_cidr" {}
variable "public_subnets_cidr" {}
variable "private_subnets_cidr_1" {}
variable "private_subnets_cidr_2" {}

# S3 variables
variable "bucket_name" {}
variable "acl_value" {}

# Lambda variables
variable "target_lambda_name" {}
