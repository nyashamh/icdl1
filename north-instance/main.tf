resource "aws_lambda_function" "icdl-lambda" {
    architectures                  = [
        "x86_64",
    ]
    description                    = "A starter AWS Lambda function."
    function_name                  = "StopStartICDLCRM"
    handler                        = "lambda_function.lambda_handler"
    layers                         = []
    memory_size                    = 128
    package_type                   = "Zip"
    reserved_concurrent_executions = -1
    role                           = "arn:aws:iam::813260210012:role/service-role/StopStartICDLCRM-role-bki579o2"
    runtime                        = "python3.7"
    source_code_hash               = "YwcZoelpKbcZTSqyODTo0PfVryHVw4p565H5T7jPGJE="
    tags                           = {
        "lambda-console:blueprint" = "hello-world-python"
        "CreatedBy"                = "terraform"
        "Creator"                  = "nyasha@cloud-fundis"
        "Name"                     = ""
        "Region"                   = "Ireland"
    }
    timeout                        = 3

    timeouts {}

    tracing_config {
        mode = "PassThrough"
    }

}
