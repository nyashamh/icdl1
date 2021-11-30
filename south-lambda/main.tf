
#lambda
resource "aws_iam_role" "iam_role_south_lambda" {
  assume_role_policy = data.aws_iam_policy_document.AWSLambdaTrustPolicy.json
  name               = "iam_role_south_lambda"
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment_lambda_natgw_south" {
  role       = aws_iam_role.iam_role_south_lambda.name
  #policy_arn = ""
}

resource "aws_lambda_function" "icdl-za-south-lambda" {
   architectures             = [
       "x86_64",
       ]
  code_signing_config_arn = ""
  description             = "runs terraform apply to start nat gateway"
  #filename                = ""
  function_name           = "natgw_south_lambda_function"
  role                    = aws_iam_role.iam_role_south_lambda.arn
  #handler                 = ""
  runtime                 = "python 3.7"
  timeout                 = ""
 
}

resource "aws_lambda_function_event_invoke_config" "lambda_invoke" {
  function_name = "icdl-za-south-lambda"

  destination_config{

  }
}


