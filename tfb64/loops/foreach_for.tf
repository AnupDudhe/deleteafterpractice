provider "aws" {
      region = "us-east-2"
      profile = "new"
    
}

resource "aws_instance" "example" {
    for_each = toset(var.this_instancetype)
    instance_type = each.value
    ami = "ami-0b0b78dcacbab728f"
    key_name = "ohiokey"
   vpc_security_group_ids = ["sg-0aecda28a625e1a5d"]   
}

variable "this_instancetype" {
    default = ["t3.small" , "t3.micro" , "c7i-flex.large"]
}



resource "aws_instance" "example" {
    count = 3
    instance_type = "t3.micro"
    ami = var.imageid
    key_name = "ohiokey"
   vpc_security_group_ids = ["sg-0aecda28a625e1a5d"]   
}

variable "imageid" {
    default = "ami-0b0b78dcacbab728f"
}

output "aws_ec2" {
  value = [
    for amiid in var.imageid:
        aws_instance.example[amiid].public_ip
  ]
}
