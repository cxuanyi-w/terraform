# This lambda will find the file from S3 to upload
resource "aws_lambda_function" "lambda_with_s3_upload" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  function_name = var.target_function_name
  role          = var.target_iam_role
  runtime       = "python3.9"
  handler       = "src.main.handler"

  s3_bucket = var.target_s3_bucket
  s3_key    = var.target_s3_object_name

  environment {
    variables = {
      foo = "bar"
    }
  }
}
