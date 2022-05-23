# VPC variables
variable "main_vpc_cidr" {
  type        = string
  description = "VPC IP Range in CIDR format."
}
variable "public_subnets_cidr" {
  type        = string
  description = "Public subnet IP Range in CIDR format."
}
variable "private_subnets_cidr" {
  type        = string
  description = "Public subnet IP Range in CIDR format."
}
