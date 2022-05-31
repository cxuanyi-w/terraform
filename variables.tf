############ Declare Provider variables############
variable "region" {}

############ Declare VPC module variables ############
# VPC variables
variable "input-vpc_cidr" {}
variable "input-instance_tenancy" {}
variable "input-enable_dns_support" {}
variable "input-enable_dns_hostnames" {}
variable "input-vpc_name" {}
# IGW variables
variable "input-igw_name" {}
# Public subnet variables
variable "input-public_subnet_cidr" {}
variable "input-public_subnet_name" {}
variable "input-public_rt_name" {}
# Private subnet 1 variables
variable "input-private_subnet_cidr_1" {}
variable "input-private_subnet_az_1" {}
variable "input-private_subnet_name_1" {}
variable "input-private_rt_name_1" {}
# Private subnet 2 variables
variable "input-private_subnet_cidr_2" {}
variable "input-private_subnet_az_2" {}
variable "input-private_subnet_name_2" {}
variable "input-private_rt_name_2" {}
# [Subnet Group for DB] variables
variable "input-aws_db_subnet_group_name" {}
variable "input-aws_db_subnet_group_tags_name" {}

############ Declare S3 variables ############
variable "bucket_name" {}
variable "acl_value" {}

############ Declare Local Upload Lambda variables ############
variable "local_upload_target_lambda_name" {}
variable "local_upload_apigw_name" {}

############ Declare S3 Upload Lambda variables ############
variable "s3_upload_lambda_name" {}
variable "s3_upload_apigw_name" {}
