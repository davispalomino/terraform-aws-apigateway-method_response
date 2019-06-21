terraform {
  required_version = ">= 0.12.1"
}
resource "aws_api_gateway_method_response" "this" {
  count                   = "${length(var.resource)}"
  rest_api_id = "${var.rest_api}"
  resource_id = "${var.resource[count.index]}"
  http_method = "${var.http_method[count.index]}"
  status_code = "200"
  response_models = {
    "application/json" = "Empty"
  }
}