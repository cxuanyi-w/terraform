# Declare VPC variables
variable "input-vpc_cidr" {}
variable "input-instance_tenancy" {}
variable "input-enable_dns_support" {}
variable "input-enable_dns_hostnames" {}
variable "input-vpc_name" {}

# Declare IGW variables
variable "input-igw_name" {}

# Declare Public Subnet variables
variable "input-public_subnet_cidr" {}
variable "input-public_subnet_name" {}
variable "input-public_rt_name" {}

# Declare Private Subnet 1 variables
variable "input-private_subnet_cidr_1" {}
variable "input-private_subnet_az_1" {}
variable "input-private_subnet_name_1" {}
variable "input-private_rt_name_1" {}

# Declare Private Subnet 2 variables
variable "input-private_subnet_cidr_2" {}
variable "input-private_subnet_az_2" {}
variable "input-private_subnet_name_2" {}
variable "input-private_rt_name_2" {}

# Declare [Subnet Group for DB] variables
variable "input-aws_db_subnet_group_name" {}
variable "input-aws_db_subnet_group_tags_name" {}