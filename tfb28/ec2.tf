provider "aws" {
  region = "us-east-1" 
  profile = "configs"
}


resource "aws_instance" "webserver" {
    ami = "ami-08982f1c5bf93d976" 
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-0d1eccf2d4ec11307"]
}