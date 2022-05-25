# Create the API in API Gateway
resource "aws_api_gateway_rest_api" "lambda-lab-api-gw-section" {
  name        = var.rest_api_name
  description = "terraform lab to create gw"
}

# Create 1st level of resource [path_part "unitInfo"]
resource "aws_api_gateway_resource" "unitInfo_resource_section" {
  rest_api_id = aws_api_gateway_rest_api.lambda-lab-api-gw-section.id
  parent_id   = aws_api_gateway_rest_api.lambda-lab-api-gw-section.root_resource_id
  path_part   = "unitInfo"
}

# Create 2nd level of resource [path_part "{proxy+}"]
resource "aws_api_gateway_resource" "proxy_resource_section" {
  rest_api_id = aws_api_gateway_rest_api.lambda-lab-api-gw-section.id
  parent_id   = aws_api_gateway_resource.unitInfo_resource_section.id
  path_part   = "{proxy+}"
}

# Create request validator
resource "aws_api_gateway_request_validator" "unit-info-validator" {
  name                        = "unit-info-validator"
  rest_api_id                 = aws_api_gateway_rest_api.lambda-lab-api-gw-section.id
  validate_request_parameters = true
}

# Create the method under /unitInfo/{proxy+}/
resource "aws_api_gateway_method" "unit-info-get-method" {
  rest_api_id          = aws_api_gateway_rest_api.lambda-lab-api-gw-section.id
  resource_id          = aws_api_gateway_resource.proxy_resource_section.id
  http_method          = "GET"
  authorization        = "NONE"
  request_validator_id = aws_api_gateway_request_validator.unit-info-validator.id

  request_parameters = {
    "method.request.querystring.postalCode" = true,
    "method.request.querystring.level"      = true,
    "method.request.querystring.unitNo"     = true,
  }
}

resource "aws_api_gateway_model" "apisvc-apig-unit-info-model" {
  rest_api_id  = aws_api_gateway_rest_api.lambda-lab-api-gw-section.id
  name         = "UnitInfoModel"
  description  = "Unit Info Model"
  content_type = "application/json"

  schema = <<EOF
{
  "type": "object",
  "properties": {
    "postalCode": {
      "type": "string"
    },
    "level": {
      "type": "string"
    },
    "unitNo": {
      "type": "string"
    }
  },
  "required": ["postalCode", "level", "unit"]
}
EOF
}

# Create the integration between lambda and api gateway
resource "aws_api_gateway_integration" "unit-info-integration" {
  rest_api_id             = aws_api_gateway_rest_api.lambda-lab-api-gw-section.id
  resource_id             = aws_api_gateway_resource.proxy_resource_section.id
  http_method             = aws_api_gateway_method.unit-info-get-method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.target_lambda_arn

  depends_on = [
    aws_api_gateway_method.unit-info-get-method
  ]
}

resource "aws_api_gateway_method_response" "unit-Info-method-response-200" {
  rest_api_id = aws_api_gateway_rest_api.lambda-lab-api-gw-section.id
  resource_id = aws_api_gateway_resource.proxy_resource_section.id
  http_method = aws_api_gateway_method.unit-info-get-method.http_method
  status_code = "200"

  response_models = {
    "application/json" = "Empty"
  }
}

resource "aws_api_gateway_integration_response" "for_providing_response" {
  rest_api_id = aws_api_gateway_rest_api.lambda-lab-api-gw-section.id
  resource_id = aws_api_gateway_resource.proxy_resource_section.id
  http_method = aws_api_gateway_method.unit-info-get-method.http_method
  status_code = aws_api_gateway_method_response.unit-Info-method-response-200.status_code

  response_templates = {
    "application/json" = ""
  }

  depends_on = [
    aws_api_gateway_integration.unit-info-integration
  ]
}

resource "aws_api_gateway_rest_api_policy" "apisvc-apig-hdb-renosys-izapp-policy" {
  rest_api_id = aws_api_gateway_rest_api.lambda-lab-api-gw-section.id
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "execute-api:Invoke",
      "Resource": "${aws_api_gateway_rest_api.lambda-lab-api-gw-section.execution_arn}/*"
    }
  ]
}

EOF
}

resource "aws_lambda_permission" "api_gateway_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.target_lambda_name
  principal     = "apigateway.amazonaws.com"
  # source_arn    = "arn:aws:execute-api:${var.target_region}:${var.api_gateway_account_id}:${aws_api_gateway_rest_api.rest_api.id}/*/${aws_api_gateway_method.rest_api_get_method.http_method}${aws_api_gateway_resource.rest_api_resource.path}"
  source_arn = "arn:aws:execute-api:ap-southeast-1:327143400501:${aws_api_gateway_rest_api.lambda-lab-api-gw-section.id}/*/GET/unitInfo/*"
}
