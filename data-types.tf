# variable "username"{
#     type = number
# }
# resource "aws_iam_user" "user1"{
#     name="var.username"
# }

# variable "my-list" {
#     type =list(number)
# }

variable "instance_tags" {
  type = map(any)
  default = {
    Name        = "app-server"
    environment = "dev"
    team        = "payments"
  }

}

output "variable_value" {
  value = var.instance_tags
}

