provider "aws" {
    region =  "ap-south-1"
    profile = "configs"
}
 

resource "aws_instance" "this_aws_instance" {
    for_each = toset(var.imageid)
    ami = each.value
   // vpc_security_group_ids = ["sg-032e1a4a1685a03be"]
   // key_name = "delete_oregon_anup"
    instance_type = "t2.micro"
    
}   

resource "aws_iam_user" "main_user"{
    for_each = toset(var.main_user_name)
    name = each.value
}

variable "main_user_name" {
    type = list(string)
   
    default = ["rohit","virat","yuraj"]
}

variable "imageid" {
    type = list(string)
    default = ["ami-094b5b539e1023ba3","ami-0e35ddab05955cf57","ami-05c179eced2eb9b5b"]

}

output "aws_ec2" {
  value = [
    for instance in var.imageid:
        aws_instance.this_aws_instance[instance].public_ip
  ]
}