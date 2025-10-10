provider "aws" {
  region = "us-east-1" 
  profile = "configs"
}


resource "aws_instance" "this_ubuntu" {
    ami = var.instanceami
    instance_type = var.instance_type        
}  