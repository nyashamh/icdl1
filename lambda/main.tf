locals {
  lambda-zip-location = "./lambda/nat-lambda-function.zip"
}
resource "aws_lambda_function" "icdl-nat-lambda" {
  filename      = local.lambda-zip-location
  function_name = "nat-lambda-function"
  role          = aws_iam_role.icdl-nat-lambda-role.arn
  handler       = "nat-lambda-function.lambda_handler"

  runtime = "python3.7"
}

data "archive_file" "init" {
  type        = "zip"
  source_file = "nat-lambda-function.py"
  output_path = "./lambda/nat-lambda-function.zip"
}