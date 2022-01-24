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

/*module "nat-destroy-rule" {
  source        = "terraform-aws-modules/eventbridge/aws"
  create_bus    = false

  rules = {

    orders = {
    crons = {
      description            = "Trigger for a Lambda to destroy nat gateways"
      schedule               = "cron(0 06 ? * 5L * )"  
      event_pattern          = jsonencode({ "source" : ["nat-destroy-rule.logs"] })
      enabled                = false
    }
    }
  }

  targets = {

    orders = [
     {
        name  = "nat-lambda-function" 
        #arn   = "arn:aws:lambda:ap-southeast-1:135367859851:function:resolved-penguin-lambda" #
        #input = jsonencode({"job": "cron-by-rate"})  #
    },

    {
      name = "shutdown-nat-sns"
      #arn  = aws.sns.shutdown-nat-sns.arn

    },
    {
      name = "log-orders-to-cloudwatch"
      #arn = aws_cloudwatch_log_group. .arn    #
    }
  
    ]
}
 tags = {
   "Name" = "nat-destroy-rule"
   "CreatedBy" = "nyasha@cloud-fundis.co.za"
   "Description" = 
  }
}*/