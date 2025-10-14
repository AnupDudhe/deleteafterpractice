
provider "aws" {
      region = "us-east-1"
      profile = "configs"
    
}

resource "aws_instance" "this_aws_instance" {
    ami = "ami-08982f1c5bf93d976"
    //vpc_security_group_ids = ["sg-032e1a4a1685a03be"]
    //key_name = "delete_oregon_anup"
    instance_type = "t2.micro"
    count = 3
}   

variable "instance_ami" {
  default = ["ami-08982f1c5bf93d976" , "ami-0360c520857e3138f "]
}                  #0                     #1

resource "aws_instance" "this_aws_instance_loop" {
    ami = var.instance_ami[count.index]
    instance_type = "t2.micro"
    count = length(var.instance_ami)
}


variable "this_user" {
    default = [ "dhoni" , "rohit" , "virat"]
}
#var.this_user[0] = dhoni
resource "aws_iam_user" "this_iam_user" {
    name = var.this_user[count.index]  #will pass the values present in the this_user list
    count = length(var.this_user) #will give you the length of the list
}