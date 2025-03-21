
provider "aws" {
    region =  "us-west-2"
    profile = "configs"
}
 

resource "aws_instance" "this_aws_instance" {
    ami = "ami-05c179eced2eb9b5b "
    //vpc_security_group_ids = ["sg-032e1a4a1685a03be"]
    //key_name = "delete_oregon_anup"
    instance_type = "t2.micro"
    count = 2
}   

resource "aws_iam_user" "this_aws_iam_user" { 
    count = length(var.users_list)
    name = var.users_list[count.index]
}  
resource "aws_iam_user" "this_aws_iam_user_2" { 
    name = "neo.${count.index}"
    count = 3
}  


variable "users_list" {
    default = ["virat" , "rohit" , "raina"]
}      
    

 
variable "instance_ami" {
  default = ["ami-094b5b539e1023ba3 " , "ami-0e35ddab05955cf57"]

}

resource "aws_instance" "this_aws_instance_var" {
    count = length(varinstance_ami)
    ami = var.instance_ami[count.index]
    //vpc_security_group_ids = ["sg-032e1a4a1685a03be"]
    //key_name = "delete_oregon_anup"
    instance_type = "t2.micro"
    count = 2
}  