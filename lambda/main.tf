
resource "aws_lambda_function" "icdl-natgw_lambda" {
  filename      = data.archive_file. .output_path
  function_name = ""
  role          = aws_iam_role..arn
  handler       = ".handler"

  source_code_hash = data.archive_file.crawler_delete_code.output_base64sha256

  runtime = "python3.7"
  timeout =  
}

data "archive_file" "" {
  type        = "zip"
  source_file = "${path.module}/lambda-code/"
  output_path = "${path.module}/lambda-code/"
}