# This lambda will find the file in the machine of which this script is executed
resource "aws_lambda_function" "lambda_with_local_upload" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  filename      = "${path.module}/function.zip"
  function_name = var.input-function_name
  role          = var.target_iam_role
  handler       = "src.main.handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("${path.module}/function.zip")

  runtime = "python3.9"

  environment {
    variables = {
      foo = "bar"
    }
  }
}
