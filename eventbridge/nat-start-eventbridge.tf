resource "aws_cloudwatch_event_rule" "nat-apply-rule" {
    event_bus_name      = "default"
    is_enabled          = true
    name                = "nat-apply-rule"
    #schedule_expression = "cron(0 06 ? * 5L *)"
    schedule_expression = "cron(15 13 ? * * *)"
    
  
   tags = {
   "Name" = "nat-apply-rule"
   "CreatedBy" = "nyasha@cloud-fundis.co.za"
   "Description" = "triggers a lambda function to invoke a terraform apply that brings up the nat gateway every last thursday of the month"
  }
}

resource "aws_cloudwatch_event_target" "lambda_apply_target" {
    target_id     = "icdl-nat-lambda"
    rule          = aws_cloudwatch_event_rule.nat-apply-rule.name
    arn           = local.lambda_arn
    #arn           = "arn:aws:lambda:eu-west-1:813260210012:function:icdl-nat-lambda"
    input = <<JSON
    {"TF_ACTION": "apply"}
JSON
}

resource "aws_cloudwatch_event_target" "sns1-target" {
    target_id   = "start-nat-sns"
    rule        = aws_cloudwatch_event_rule.nat-apply-rule.name
    arn         = local.sns_nat_start_arn
    #arn         = "arn:aws:sns:eu-west-1:813260210012:start-nat-sns"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_icdl_nat_lambda" {
  statement_id  = "AllowExecutionFromCloudWatchForNatApply"
  action        = "lambda:InvokeFunction"
  #function_name =  local.lambda_function_name
  function_name = "icdl-nat-lambda"
  principal     = "events.amazonaws.com"
  #source_arn    = "${aws_cloudwatch_event_rule.nat-apply-rule.arn}"
  source_arn    = local.nat-apply-rule-arn

}

resource "aws_api_gateway_rest_api" "MyDemoAPI" {
  name        = "MyDemoAPI"
  description = "This is my API for demonstration purposes"
}

resource "aws_lambda_permission" "lambda_api_permission" {
  statement_id  = "MyDemoAPIInvoke"
  action        = "lambda:InvokeFunction"
  function_name = local.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_api_gateway_rest_api.MyDemoAPI.execution_arn}/*/*/*"
}
