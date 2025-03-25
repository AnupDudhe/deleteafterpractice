provider "aws" {
  region = "us-east-1" # Change to your desired region
  profile = "configs"
}

data "aws_ami" "this_aws_ami" {
    name_regex       = "ami_use"
      filter {
    name   = "name"
    values = ["ami_use"]
    }

}    