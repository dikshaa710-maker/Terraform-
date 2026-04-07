resource "aws_iam_user" "new" {
  name = "demo-user-1"

}

resource "aws_iam_user_policy" "lb_ro" {
  name = "lb_ro_policy"
  user = aws_iam_user.new.name

  policy = file("./iam-user-policy.json")

}