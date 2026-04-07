# provider "aws"{
#     region = var.region
# }

variable "region" {
  default = "ap-south-1"

}
variable "ami" {
  type = map(any)
  default = {
    "us-east-1"  = "ami-0c94855ba95c71c99",
    "us-west-2"  = "ami-0b898040803850657",
    "ap-south-1" = "ami-0aeeebd8d2ab47354"
  }
}
variable "tags" {
  type    = list(any)
  default = ["app-dev-1", "app-dev-2", "app-dev-3"]
}
resource "aws_instance" "app-dev" {
  ami           = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  count         = length(var.tags)

  tags = {
    name         = element(var.tags, count.index)
    CreationDate = formatdate("DD MM YYYY hh:mm:ss", timestamp())
  }
}