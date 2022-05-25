output "lambda_iam_role" {
  value = aws_iam_role.new_lambda_iam_role.arn
}
