output "created_lambda_invoke_arn" {
  value = aws_lambda_function.lambda_with_local_upload.invoke_arn
}
