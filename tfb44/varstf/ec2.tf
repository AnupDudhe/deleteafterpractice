provider "aws" {
  region = "us-east-1"
  profile = "configs"
} 

resource "aws_instance"  "webserver" {
    ami = var.amiid
    instance_type = var.insttype
    vpc_security_group_ids =  [ var.sg]
    key_name = var.kp
}