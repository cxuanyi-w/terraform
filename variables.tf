# Declare Provider variables
variable "region" {}

# Declare VPC & Subnets  variables
variable "input-vpc_cidr" {}
variable "input-instance_tenancy" {}
variable "input-enable_dns_support" {}
variable "input-enable_dns_hostnames" {}
variable "input-vpc_name" {}

variable "input-public_subnet_cidr" {}
variable "input-private_subnets_cidr_1" {}
variable "input-private_subnets_cidr_2" {}

# Declare S3 variables
variable "bucket_name" {}
variable "acl_value" {}

# Declare Local Upload Lambda variables
variable "local_upload_target_lambda_name" {}
variable "local_upload_apigw_name" {}

# Declare S3 Upload Lambda variables
variable "s3_upload_lambda_name" {}
variable "s3_upload_apigw_name" {}
