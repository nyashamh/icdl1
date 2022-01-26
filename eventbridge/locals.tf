locals {
    lambda_arn     = "arn:aws:lambda:eu-west-1:813260210012:function:icdl-nat-lambda"
    #lambda_destroy_arn   = "arn:aws:lambda:eu-west-1:813260210012:function:icdl-nat-lambda"
    sns_nat_start_arn    = "arn:aws:sns:eu-west-1:813260210012:start-nat-sns"
    sns__nat_stop_arn    = "arn:aws:sns:eu-west-1:813260210012:shutdown-nat-sns"
    nat-apply-rule-arn   = "arn:aws:events:eu-west-1:813260210012:rule/nat-apply-rule"
    nat-destroy-rule-arn = "arn:aws:events:eu-west-1:813260210012:rule/nat-destroy-rule"
    lambda_function_name = "icdl-nat-lambda"

}