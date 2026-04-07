# data "local_file" "foo" {
#     filename="${path.module}/random.txt"
# }

# data "aws_instance" "foo"{
#     //server with tag of team and value production
   
#     filter{
#       {
#         name= "tag:Team"
#         values=["Production"]
#       }
#     }
# }

resource "aws_instance" "web" {
ami = data.aws_ami.example.id
instance_type = "t3.micro"
  
}

data "aws_ami" "example" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "^myami-[0-9]{3}"
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amazon-eks-gpu-node-1.24-v20240409"]
  }

  
}