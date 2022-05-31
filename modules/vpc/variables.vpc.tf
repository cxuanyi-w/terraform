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

# Declare Private Subnet 1 variables
variable "input-private_subnets_cidr_1" {}

# Declare Private Subnet 2 variables
variable "input-private_subnets_cidr_2" {}
