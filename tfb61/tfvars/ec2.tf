provider "aws" {
  region = "us-east-1"
  profile = "configs"
}


resource "aws_instance" "example" {
   instance_type = var.instance_type
   ami = var.ami  
    key_name = var.key_name 
   vpc_security_group_ids = [ var.sg ]
}