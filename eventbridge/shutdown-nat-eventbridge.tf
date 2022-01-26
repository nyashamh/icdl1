resource "aws_cloudwatch_event_rule" "nat-destroy-rule" {
    event_bus_name      = "default"
    is_enabled          = true
    name                = "nat-destroy-rule"
    #schedule_expression = "cron(0 06 ? * 5L *)"
    schedule_expression = "cron(47 10 ? * * *)"
  
   tags = {
   "Name" = "nat-destroy-rule"
   "CreatedBy" = "nyasha@cloud-fundis.co.za"
   "Description" = "triggers a lambda function to invoke a terraform destroy that brings down nat gateways every last friday of the month"
  }
}

resource "aws_cloudwatch_event_target" "lambda_destroy_target" {
    target_id   = "icdl-nat-lambda"
    rule        = aws_cloudwatch_event_rule.nat-destroy-rule.name
    arn         = local.lambda_arn
    input = <<JSON
    {"TF_ACTION": "destroy"}
JSON
}

resource "aws_cloudwatch_event_target" "sns2-target" {
    target_id   = "shutdown-nat-sns"
    rule        = aws_cloudwatch_event_rule.nat-destroy-rule.name
    arn         = local.sns__nat_stop_arn
}

resource "aws_lambda_permission" "cloudwatch_to_call_icdl_nat_lambda" {
  statement_id  = "AllowExecutionFromCloudWatchForNatDestroy"
  action        = "lambda:InvokeFunction"
  function_name =  local.lambda_function_name
  principal     = "events.amazonaws.com"
  #source_arn    = "${aws_cloudwatch_event_rule.nat-destroy-rule.arn}"
  source_arn    = local.nat-destroy-rule-arn

}