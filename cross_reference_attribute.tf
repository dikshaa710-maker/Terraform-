
resource "aws_eip" "sp" {

  domain = "vpc"
}
resource "aws_security_group" "allow_tls" {
  name        = "Attribute-sg"
  description = "Managed from ec2 with eip"
}
resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "${aws_eip.sp.public_ip}/32"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}