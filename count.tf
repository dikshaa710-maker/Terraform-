variable "environment" {
  default = "dev"
}
resource "aws_instance" "mye2" {
  ami           = "ami-045443a70fafb8bbc"
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.large"
  count         = 3

  tags = {
    Name = "FirstEC2-${count.index}"
  }
}


resource "aws_iam_user" "this" {
  name  = "payments-user-${count.index}"
  count = 3

}
