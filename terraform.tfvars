############ Initiate Provider variables############
region = "ap-southeast-1"

############ Initiate Provider variables############
# VPC variables
input-vpc_cidr             = "192.168.0.0/24" # 256 host ip adddresses
input-instance_tenancy     = "default"
input-enable_dns_support   = true
input-enable_dns_hostnames = true
input-vpc_name             = "tf-created-vpc-1"
# IGW variables
input-igw_name = "tf-created-vpc-igw"
# Public subnet variables
input-public_subnet_cidr = "192.168.0.0/26" # 128 host ip addresseses, from 192.168.0.0 to 192.168.0.63
input-public_subnet_name = "tf-created-public-subnet"
input-public_rt_name     = "tf-created-public-subnet-routetable"
# Private subnet 1 variables
input-private_subnet_cidr_1 = "192.168.0.64/26" # 128 host ip addresseses, from 192.168.0.64 to 192.168.0.127
input-private_subnet_az_1   = "ap-southeast-1a"
input-private_subnet_name_1 = "tf-created-private-subnet-1"
input-private_rt_name_1     = "tf-created-private-subnet-routetable-1"
# Private subnet 2 variables
input-private_subnet_cidr_2 = "192.168.0.128/26" # 128 host ip addresseses, from 192.168.0.128 to 192.168.0.191
input-private_subnet_az_2   = "ap-southeast-1b"
input-private_subnet_name_2 = "tf-created-private-subnet-2"
input-private_rt_name_2     = "tf-created-private-subnet-routetable-2"
# Subnet Group for DB
input-aws_db_subnet_group_name      = "tf-created-private-subnet-group"
input-aws_db_subnet_group_tags_name = "TF Created Private Subnet Group for DB"

############ Initiate S3 variables ############
bucket_name = "tf-created-s3-bucket3" # unique bucket name
acl_value   = "public"                   # acl value, private, public-read, public-read-write, authenticated-rea, aws-exec-read and log-delivery-write

############ Initiate Local Upload Lambda variables ############
local_upload_target_lambda_name = "tf-lambda-upload-from-local"
local_upload_apigw_name         = "local-upload-lambda-apigw"

############ Initiate S3 Upload Lambda variables ############
s3_upload_lambda_name = "tf-lambda-upload-from-s3"
s3_upload_apigw_name  = "s3-upload-lambda-apigw"
