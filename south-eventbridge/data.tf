data "aws_iam_policy_document" "AWSLambdaTrustPolicy" {
  #version = ""
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}
