provider "archive" {

}

resource "aws_lambda_function" "icdl-nat-lambda" {
  filename          = data.archive_file.zip.output_path
  function_name     = "icdl-nat-lambda"
  role              = aws_iam_role.icdl-nat-lambda-role.arn
  #role              = local.lambda_role_arn
  handler           = "nat-lambda-function.lambda_handler"
  source_code_hash  = data.archive_file.zip.output_base64sha256

  runtime = "python3.7"
}

