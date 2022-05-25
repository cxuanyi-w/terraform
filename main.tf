# module "vpc_module" {
#   source = "./modules/vpc"

#   # VPC variables
#   main_vpc_cidr        = var.main_vpc_cidr
#   public_subnets_cidr  = var.public_subnets_cidr
#   private_subnets_cidr = var.private_subnets_cidr
# }

module "s3" {
  source = "./modules/s3"
  #bucket name should be unique
  bucket_name = var.bucket_name
  acl_value = var.acl_value
}

module "iam" {
  source = "./modules/iam"
}

module "lambda_with_local_upload" {
  source = "./modules/lambda_local_upload"
  target_iam_role = module.iam.lambda_iam_role
}

module "lambda_with_s3_upload" {
  source = "./modules/lambda_s3_upload"
  target_iam_role = module.iam.lambda_iam_role
  target_s3_bucket = module.s3.s3_bucket_name
  target_s3_object_name = module.s3.s3_uploaded_object_name
  target_s3_object_hash = module.s3.s3_uploaded_object_hash
}