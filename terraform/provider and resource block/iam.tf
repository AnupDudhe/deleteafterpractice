provider "aws" {
  access_key = ""
  secret_key = ""
}


resource "aws_iam_user" "iamusercbz1" {
  name = "cbz1"
  path = "/"

  tags = {
    name = "cbz1"
  }
}