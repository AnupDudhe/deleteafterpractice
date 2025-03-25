/* provider "aws" {
    region = var.region
}

terraform {
    backend "s3" {
    bucket = "staging-terraform.tfstate"
   // key    = "terraform.tfstate"
   // region = "us-east-1"
    }
} */

data "aws_security_group" "lb_sg" {
  name = "default"  #var.vpc_security_group_ids[2]
}
/* data "aws_security_groups" "my_sg" {
   /*  filter {
    name   = "group-name"
    values = ["default"]
    } 
 
filter {
    name   = "name"
    values = ["default"]
    }
} */

resource "aws_instance" "my-aws_instance-1" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    tags = var.tags
    //vpc_security_group_ids = ["vpc-0b3e0394629623bb3"]
    vpc_security_group_ids = [data.aws_security_group.lb_sg.id]
    #vpc_security_group_ids = var.vpc_security_group_ids
}

variable "region" {
    description = "region based variable calling after terraform plan"
    default = "us-west-2"
}

variable "ami" {
    default = "ami-052c9ea013e6e3567"
    description = "AMI for server"
}

variable "instance_type" {
    default = "t2.micro"
    description = "providing the server size"
}

variable "key_name" {
    default = "anupdel"
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

# variable "vpc_security_group_ids" {
#     type = list
#     default = ["sg-001ee5473f5820786","sg-003577d76f13342cc",sg-02582bf615cdb71bb]
#     description = "multiple security group adding to server"
# }

/* variable "vpc_id" {
    default = "vpc-04206cb07803c1c73"
    description = "VPC for serve"
} */

output "demo" {
    value = data.aws_security_group.lb_sg.id
}