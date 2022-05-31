# Initiate Provider variables
region = "ap-southeast-1"

# Initiate VPC & Subnets variables
input-vpc_cidr             = "192.168.0.0/24" # 256 host ip adddresses
input-instance_tenancy     = "default"
input-enable_dns_support   = true
input-enable_dns_hostnames = true
input-vpc_name = "cxy-terraform-vpc-1"




input-public_subnet_cidr     = "192.168.0.0/26"   # 128 host ip addresseses, from 192.168.0.0 to 192.168.0.63
input-private_subnets_cidr_1 = "192.168.0.64/26"  # 128 host ip addresseses, from 192.168.0.64 to 192.168.0.127
input-private_subnets_cidr_2 = "192.168.0.128/26" # 128 host ip addresseses, from 192.168.0.128 to 192.168.0.191

# Initiate S3 variables
bucket_name = "cxy-s3-terraform-bucket3" # unique bucket name
acl_value   = "public"                   # acl value, private, public-read, public-read-write, authenticated-rea, aws-exec-read and log-delivery-write

# Initiate Local Upload Lambda variables
local_upload_target_lambda_name = "terraform_lambda_upload_from_local"
local_upload_apigw_name         = "local-upload-lambda-apigw"

# Initiate S3 Upload Lambda variables
s3_upload_lambda_name = "terraform_lambda_upload_from_s3"
s3_upload_apigw_name  = "s3-upload-lambda-apigw"
