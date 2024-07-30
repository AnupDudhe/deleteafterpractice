resource "aws_iam_user" "tfuser" {
name = "batch38"
path = "/"

tags = {tag-key = "intern"
  }
}
