provider "aws" {
    profile = "configs"
    default_tags {
            tags = {
              devopsenggname = "anup"
            }
    }
}

resource "aws_iam_user" "iamusercbz1" {
name = "cbz1"
path = "/"

tags = {
  name = "cbz1"
  }
}