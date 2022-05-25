# S3 related variable required for uploading file to Lambda
variable "target_s3_bucket" {
  type        = string
  description = "The target s3 bucket where the file is located."
}

variable "target_s3_object_name" {
  type        = string
  description = "The name of target file in the S3 bucket."
}

variable "target_s3_object_hash" {
  type        = string
  description = "The hash of the target file in the S3 bucket."
}