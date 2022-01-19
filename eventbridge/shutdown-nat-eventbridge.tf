
module "eventbridge" {
  source = "terraform-aws-modules/eventbridge/aws"

  create_bus = false

  rules = {
    crons = {
      description         = "Trigger for a Lambda"
      cron_expression     = "cron(0 22 ?  * 5L *)"
    }
  }

  targets = {
    crons = [
      {
        name  = "lambda-function name"
        arn   = "arn:aws:lambda:ap-southeast-1:135367859851:function:resolved-penguin-lambda"
        input = jsonencode({"job": "cron-by-rate"})
      }
    ]
  }
  
}