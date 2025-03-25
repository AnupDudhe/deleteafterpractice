

data "aws_ami" "this_aws_ami" {
    name_regex       = "ami_use"
      filter {
    name   = "name"
    values = ["ami_use"]
    }

} 
data "aws_security_group" "lb_sg" {
  name = "default"  #var.vpc_security_group_ids[2]
}


resource "aws_instance" "my-aws_instance-1" {
    ami = data.aws_ami.this_aws_ami.id
    instance_type = var.instance_type
    key_name = var.key_name
    tags = var.tags
    vpc_security_group_ids = [data.aws_security_group.lb_sg.id]
    #vpc_security_group_ids = var.vpc_security_group_ids
}

variable "region" {
    description = "region based variable calling after terraform plan"
    default = "us-east-1"
}



variable "instance_type" {
    default = "t2.micro"
    description = "providing the server size"
}

variable "key_name" {
    default = "NVkp"
    description = "providing server key for accessing the server remotely"
}

variable "tags" {
    type = map
    default = {
        Name = "Jarvis2-Staging"
        Enviorment = "Staging"
        Owner = "Jarvis"
        Project = "CDEC B20 B25"
    }
    description = "tags for serve"
}




output "demo" {
    value = data.aws_security_group.lb_sg.id
}