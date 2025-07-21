
provider "aws" {
    region =  "us-west-2"
    profile = "configs"
}
 

resource "aws_instance" "this_aws_instance" {
    ami = "ami-0be5f59fbc80d980c"
    //vpc_security_group_ids = ["sg-032e1a4a1685a03be"]
    //key_name = "delete_oregon_anup"
    instance_type = "t2.medium"
    count = 3
}   
 
variable "instance_ami" {
  default = ["ami-05f991c49d264708f" , "ami-0987e9d53da324257"]
}

resource "aws_instance" "this_aws_instance_var" {
    count = length(var.instance_ami) #2
    ami = var.instance_ami[count.index] #01
    //vpc_security_group_ids = ["sg-032e1a4a1685a03be"]
    //key_name = "delete_oregon_anup"
    instance_type = "t2.medium"
   
} 

resource "aws_iam_user" "this_aws_iam_user" { 
    count = length(var.users_list)
    name = var.users_list[count.index]
}  
variable "users_list" {
    default = ["virat" , "rohit" , "raina"]
}      

resource "aws_iam_user" "this_aws_iam_user_2" { 
    name = "user.${count.index}"
    count = 3
} 