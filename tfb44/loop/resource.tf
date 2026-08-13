provider "aws" {
  region = "us-east-1"
  profile = "configs"
} 


resource "aws_instance"  "webserver" {
    ami = var.amiid
    instance_type = var.insttype
    vpc_security_group_ids =  [ var.sg]
    key_name = var.kp
    count = 2  #identicalloops
}



resource "aws_instance"  "webservertwo" {
    for_each = toset(var.imageid)    #unidenticalloops
    ami = each.value
    instance_type = var.insttype
    vpc_security_group_ids =  [ var.sg]
    key_name = var.kp

}


variable "imageid" {
   default = ["ami-0bdc7d025135d7b49" , "ami-0b6d9d3d33ba97d99" , "ami-0ed0165f19a049904"]
}

output "ip" {
    value = [
      for amiid in var.imageid:  
        aws_instance.webservertwo[amiid].public_ip]
}

