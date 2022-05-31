module "vpc_module" {
  source = "./modules/vpc"

  # VPC variables
  input-vpc_cidr             = var.input-vpc_cidr
  input-instance_tenancy     = var.input-instance_tenancy
  input-enable_dns_support   = var.input-enable_dns_support
  input-enable_dns_hostnames = var.input-enable_dns_hostnames
  input-vpc_name             = var.input-vpc_name
  # IGW variables
  input-igw_name = var.input-igw_name
  # Public subnet variables
  input-public_subnet_name = var.input-public_subnet_name
  input-public_subnet_cidr = var.input-public_subnet_cidr
  input-public_rt_name     = var.input-public_rt_name
  # Private subnet 1 variables
  input-private_subnet_cidr_1 = var.input-private_subnet_cidr_1
  input-private_subnet_az_1   = var.input-private_subnet_az_1
  input-private_subnet_name_1 = var.input-private_subnet_name_1
  input-private_rt_name_1     = var.input-private_rt_name_1
  # Private subnet 2 variables
  input-private_subnet_cidr_2 = var.input-private_subnet_cidr_2
  input-private_subnet_az_2   = var.input-private_subnet_az_2
  input-private_subnet_name_2 = var.input-private_subnet_name_2
  input-private_rt_name_2     = var.input-private_rt_name_2
  # Subnet Group for DB
  input-aws_db_subnet_group_name = var.input-aws_db_subnet_group_name
  input-aws_db_subnet_group_tags_name = var.input-aws_db_subnet_group_tags_name

}

# module "s3" {
#   source = "./modules/s3"
#   #bucket name should be unique
#   bucket_name = var.bucket_name
#   acl_value   = var.acl_value
# }

# module "iam" {
#   source = "./modules/iam"
# }

# ############ Create Lambda with Local Uploading of Zip File ############
# module "lambda_with_local_upload" {
#   source              = "./modules/lambda_local_upload"
#   input-function_name = var.local_upload_target_lambda_name
#   target_iam_role     = module.iam.lambda_iam_role
# }

# module "apigw-local-upload" {
#   source             = "./modules/apigw"
#   rest_api_name      = var.local_upload_apigw_name
#   target_lambda_name = var.local_upload_target_lambda_name
#   target_lambda_arn  = module.lambda_with_local_upload.created_lambda_invoke_arn
#   target_region      = var.region
# }

# ############ Create Lambda with S3 Uploading of Zip File ############
# module "lambda_with_s3_upload" {
#   source                = "./modules/lambda_s3_upload"
#   target_function_name  = var.s3_upload_lambda_name
#   target_iam_role       = module.iam.lambda_iam_role
#   target_s3_bucket      = module.s3.s3_bucket_name
#   target_s3_object_name = module.s3.s3_uploaded_object_name
#   target_s3_object_hash = module.s3.s3_uploaded_object_hash
# }

# module "apigw-s3-upload" {
#   source             = "./modules/apigw"
#   rest_api_name      = var.s3_upload_lambda_name
#   target_lambda_name = var.s3_upload_lambda_name
#   target_lambda_arn  = module.lambda_with_s3_upload.created_lambda_invoke_arn
#   target_region      = var.region
# }
