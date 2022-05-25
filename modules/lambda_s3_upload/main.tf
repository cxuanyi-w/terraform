resource "aws_iam_role" "new_lambda_iam_role" {
  name = "new_lambda_iam_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# This lambda will find the file from S3 to upload
resource "aws_lambda_function" "lambda_with_s3_upload" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  function_name = "terraform_lambda_upload_from_s3"
  role          = aws_iam_role.new_lambda_iam_role.arn
  runtime       = "python3.9"
  handler       = "main.handler"

  s3_bucket = var.target_s3_bucket
  s3_key    = var.target_s3_object_name

  environment {
    variables = {
      foo = "bar"
    }
  }
}
