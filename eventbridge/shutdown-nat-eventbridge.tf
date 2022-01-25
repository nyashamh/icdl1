resource "aws_cloudwatch_event_rule" "nat-destroy-rule" {
    event_bus_name      = "default"
    is_enabled          = false
    name                = "nat-destroy-rule"
    schedule_expression = "cron(0 06 ? * 5L *)"
  
   tags = {
   "Name" = "nat-destroy-rule"
   "CreatedBy" = "nyasha@cloud-fundis.co.za"
   "Description" = "triggers a lambda function to invoke a terraform destroy that brings down nat gateways every last friday of the month"
  }
}

resource "aws_cloudwatch_event_target" "lambda2-target" {
    target_id   = "icdl-nat-lambda"
    rule        = aws_cloudwatch_event_rule.nat-destroy-rule.name
    arn         = local.lambda_arn2
}

resource "aws_cloudwatch_event_target" "sns2-target" {
    target_id   = "start-nat-sns"
    rule        = aws_cloudwatch_event_rule.nat-apply-rule.name
    arn         = local.sns_arn2
}

