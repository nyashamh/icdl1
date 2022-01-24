data "archive_file" "zip" {
    type = "zip"
    source_file = "${path.module}/nat-lambda-function.py"
    output_path = "${path.module}/nat-lambda-function.zip"
}


