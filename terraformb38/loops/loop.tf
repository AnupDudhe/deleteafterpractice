provider "aws" {
  region     = "us-east-1"
  profile  =  "configs" 
} 

resource "aws_instance" "webserver" {
   #example of count loop 
   key_name = "sample"
   ami = "ami-0521cb2d60cfbb1a6"
   instance_type =  "t3.micro"
   vpc_security_group_ids = ["sg-0ae3d2f367ebf0641"]
   count = 3

}

resource "aws_iam_user"  "userrb" {
    #for_each loops example
     for_each = toset(var.userlist)
     name =  each.value
     
}

variable "userlist" {
  default = ["virat" , "rohit" , "dhoni"]
}

output "aws_user_name" {
    #example of for loop.
    value = [for users in var.userlist:
                aws_iam_user.userrb[users].name ]
}