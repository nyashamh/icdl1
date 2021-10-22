resource "aws_instance" "icdl-pub-instance" {
    ami           = "ami-0a8e758f5e873d1c1" 
    instance_type = "t2.micro"
}

resource "aws_instance" "icdl-pvt-instance" {
    ami           = "ami-0a8e758f5e873d1c1" 
    instance_type = "t2.micro"
}
