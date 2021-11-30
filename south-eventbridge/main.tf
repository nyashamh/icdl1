/*
module "south-eventbridge" {
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
        name  = "icdl-south-lambda"
        arn   = ""
        #input = jsonencode()
      }
    ]
  }
}*/