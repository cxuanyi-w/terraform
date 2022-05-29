# Parent module outputs
output "parent_module" {
  value = "this is parent module output."
}

# Child module outputs
# In order for the state file to capture child module outputs,
# the following condition must be met:
#   a) The output variable must be declared in child module in [outputs.tf]
#   b) The parent module needs to reference it in this file
# output "s3_bucket_name" {
#   value = module.s3.s3_bucket_name
# }

# output "lambda_iam_role" {
#   value = module.iam.lambda_iam_role
# }

# output "s3_uploaded_object_hash" {
#   value = module.s3.s3_uploaded_object_hash
# }

# output "lambda_iam_role_created" {
#   value = module.iam.lambda_iam_role
# }

# output "created_lambda_invoke_arn" {
#   value = module.lambda_with_s3_upload.created_lambda_invoke_arn
# }

