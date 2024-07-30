resource "aws_iam_group" "devops" {
  name = "devopsengineers"
  path = "/users/"
}


resource "aws_iam_user_group_membership" "iamuser" {
  user = aws_iam_user.tfuser.name
  groups = [
       aws_iam_group.devops.name
  ]
}
