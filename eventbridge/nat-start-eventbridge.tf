resource "aws_cloudwatch_event_rule" "nat-apply-rule" {
    event_bus_name      = "default"
    is_enabled          = false
    name                = "nat-apply-rule"
    #schedule_expression = "cron(0 06 ? * 5L *)"
    schedule_expression = "cron(28 18 ? * * *)"
    
  
   tags = {
   "Name" = "nat-apply-rule"
   "CreatedBy" = "nyasha@cloud-fundis.co.za"
   "Description" = "triggers a lambda function to invoke a terraform apply that brings up the nat gateway every last thursday of the month"
  }
}

resource "aws_cloudwatch_event_target" "lambda_apply_target" {
    target_id     = "icdl-nat-lambda"
    rule          = aws_cloudwatch_event_rule.nat-apply-rule.name
    arn           = local.lambda_apply_arn
    input = <<JSON
    {"TF_ACTION": "apply"}
JSON
}

resource "aws_cloudwatch_event_target" "sns1-target" {
    target_id   = "start-nat-sns"
    rule        = aws_cloudwatch_event_rule.nat-apply-rule.name
    arn         = local.sns_nat_start_arn 
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_icdl_nat_lambda" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name =  local.lambda_function_name
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.nat-apply-rule.arn}"

}