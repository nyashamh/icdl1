module "eventbridge" {
  source = "terraform-aws-modules/eventbridge/aws"

  create_targets = false
/*
  rules = {
    logs = {
      description   = "Capture log data"
      event_pattern = jsonencode({ "source" : ["my.app.logs"] })
    }
  }*/
}


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
  #filename                = data.archive_file.lambda.output_path
  function_name           = "natgw_south_lambda_function"
  role                    = aws_iam_role.iam_role_south_lambda.arn
  #handler                 = "index.handler"
  runtime                 = "python 3.7"
  timeout                 = ""
  #source_code_hash        = filebase64sha256(data.archive_file.lambda.output_path)
}

resource "aws_lambda_function_event_invoke_config" "lambda_invoke" {
  function_name = "icdl-za-south-lambda"

  destination_config{

  }
}


  terraform0.14 apply -target module.south-network.aws_nat_gateway.icdl-nat-gateway \
                     -target module.south-network.aws_route.icdl-south-1-nat-gw \
                     -target module.south-network.aws_eip.icdl-nat-gw-eip 