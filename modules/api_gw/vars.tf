# S3 related variable required for uploading file to Lambda
variable "rest_api_name"{
    type = string
    description = "Name of the API Gateway created"
}

variable "target_lambda_arn" {
  type        = string
  description = "Target lambda arn."
}

variable "target_lambda_name" {
  type        = string
  description = "Target lambda name."
}

