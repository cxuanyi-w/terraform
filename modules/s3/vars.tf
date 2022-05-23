# S3 variables
variable "bucket_name" {
  type        = string
  description = "Unique name for S3 bucket"
}
variable "acl_value" {
  default     = "private"
  type        = string
  description = "Type of access for the S3 bucket"
}
