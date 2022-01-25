resource "aws_cloudwatch_event_rule" "nat-apply-rule" {
    event_bus_name      = "default"
    is_enabled          = false
    name                = "nat-apply-rule"
    schedule_expression = "cron(0 06 ? * 5L *)"
  
   tags = {
   "Name" = "nat-apply-rule"
   "CreatedBy" = "nyasha@cloud-fundis.co.za"
   "Description" = "triggers a lambda function to invoke a terraform apply that brings up the nat gateway every last thursday of the month"
  }
}

resource "aws_cloudwatch_event_target" "lambda1-target" {
    target_id   = "icdl-nat-lambda"
    rule        = aws_cloudwatch_event_rule.nat-apply-rule.name
    arn         = local.lambda_arn1
}

resource "aws_cloudwatch_event_target" "sns1-target" {
    target_id   = "start-nat-sns"
    rule        = aws_cloudwatch_event_rule.nat-apply-rule.name
    arn         = local.sns_arn1
}