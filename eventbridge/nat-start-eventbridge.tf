module "icdl-start-eventbridge" {
  source        = "terraform-aws-modules/eventbridge/aws"
  create_bus    = false

  rules = {

    orders = {
    crons = {
      description         = "Trigger for a Lambda to start nat gateway"
      cron_expression     = "cron(0 06 ? * 5L * )"
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
      name = "start-nat-sns"
      #arn  = aws.sns.start-nat-sns.arn

    },
    {
      name = "log-orders-to-cloudwatch"
      #arn = aws_cloudwatch_log_group. .arn    #
    }
  
    ]
}
 tags = {
   "Name" = "nat-apply-rule"
   "CreatedBy" = "nyasha@cloud-fundis.co.za"
   "Description" = "triggers a lambda function to invoke a terraform apply that brings up the nat gateway every last thursday of the month"
  }
}