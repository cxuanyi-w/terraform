# Provider variables
variable "access_key" {}
variable "secret_key" {}
variable "region" {}

# VPC variables
variable "main_vpc_cidr" {}
variable "public_subnets_cidr" {}
variable "private_subnets_cidr" {}

# S3 variables
variable "bucket_name" {}
variable "acl_value" {}
