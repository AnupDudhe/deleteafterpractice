provider "aws" {
default_tags {
      tags = {
              devopsenggname = "anup"
        }
  profile = "configs"
}
}

resource "aws_iam_user" "iamusercbz1" {
name = "cbz1"
path = "/"

tags = {
  name = "cbz1"
  }
}