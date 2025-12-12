provider "aws" {
  region = "ap-south-1"
  profile = "configs"
}


resource "aws_instance" "example" {
   instance_type = "t3.micro"
   ami = "ami-00ca570c1b6d79f36"
   count =  2
}

