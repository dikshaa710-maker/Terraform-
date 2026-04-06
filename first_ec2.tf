//authentication
provider "aws" {
    region = "ap-south-1"
    
}


resource "aws_instance" "myec2" {
    ami = "ami-045443a70fafb8bbc"
    instance_type = "t3.micro"

    tags = {
    Name = "MyFirstEC2"
}
}

