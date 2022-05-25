resource "aws_api_gateway_rest_api" "lambda-lab-api-gw" {
  name        = var.rest_api_name
  description = "terraform lab to create gw"
}

# resource "aws_api_gateway_resource" "proxy" {
#   rest_api_id = aws_api_gateway_rest_api.lambda-lab-api-gw.id
#   parent_id   = aws_api_gateway_rest_api.lambda-lab-api-gw.root_resource_id
#   path_part   = "{proxy+}"
# }

# resource "aws_api_gateway_method" "proxy" {
#   rest_api_id   = aws_api_gateway_rest_api.lambda-lab-api-gw.id
#   resource_id   = aws_api_gateway_resource.proxy.id
#   http_method   = "ANY"
#   authorization = "NONE"

# }

# resource "aws_api_gateway_integration" "lambda" {
#   rest_api_id             = aws_api_gateway_rest_api.lambda-lab-api-gw.id
#   resource_id             = aws_api_gateway_method.proxy.resource_id
#   http_method             = aws_api_gateway_method.proxy.http_method
#   integration_http_method = "ANY"
#   type                    = "AWS_PROXY"
#   uri                     = var.target_lambda_arn
# }

# resource "aws_api_gateway_integration_response" "response_200" {
#   rest_api_id = aws_api_gateway_rest_api.lambda-lab-api-gw.id
#   resource_id = aws_api_gateway_resource.proxy.id
#   http_method = aws_api_gateway_method.proxy.http_method
#   status_code = "200"
# }
