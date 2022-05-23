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
}
