provider "aws" {
  region = "ap-south-1"
}
resource "aws_security_group" "allow_tls" {
  name        = "Terraform-firewall"
  description = "Managed from firewall"
}
resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
resource "aws_vpc_security_group_egress_rule" "allow_all_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
# EC2 Instance
resource "aws_instance" "myec2" {
  ami           = "ami-045443a70fafb8bbc"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = "MyFirstEC2"
  }
}
