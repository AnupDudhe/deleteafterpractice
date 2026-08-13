provider "aws" {
  region = "us-east-1"
  profile = "configs"
} 


resource "aws_instance"  "webserver" {
    ami = var.amiid
    instance_type = var.insttype
    vpc_security_group_ids =  [ var.sg]
    key_name = var.kp
    count = 3  #identicalloops
}



resource "aws_instance"  "webservertwo" {
    for_each = toset(var.imageid)    #unidenticalloops
    ami = each.value
    instance_type = var.insttype
    vpc_security_group_ids =  [ var.sg]
    key_name = var.kp

}


variable "imageid" {
   default = ["ami-035827357e3c7e810" , "ami-01a00762f46d584a1" , "ami-0340d2c0eb945bf80"]
}

output "ip" {
    value = [
      for amiid in var.imageid:  
        aws_instance.webservertwo[amiid].public_ip]
}

