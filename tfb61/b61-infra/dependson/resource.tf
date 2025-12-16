


resource "aws_instance" "example" {
   instance_type = "t3.micro"
   ami = var.aws_list[1]
    key_name = var.aws_map.privatekey1  #var.mapvariableblockname.uniquekeyname
   vpc_security_group_ids = [ "sg-0bbfe8e7d4bf3c179" ]
   depends_on = [ aws_iam_user.this_iam_user_admin]
}



resource "aws_iam_user" "this_iam_user_admin" {
    name = "sample"
}

variable "aws_list" {
   default = ["ami-0c398cb65a93047f2" , "ami-068c0051b15cdb816"]
                  #0                        #1
}

variable "aws_map" {
    default = {
        privatekey1 = "30july"
         #key    = value 
        privatekey2 = "anupnv"
    }
  
}



resource "aws_instance" "example" {
   instance_type = var.aws_any.instancetype 
   ami = var.aws_list[1]
    key_name = var.aws_any.map.privatekey1  #var.mapvariableblockname.uniquekeyname
   vpc_security_group_ids = [ "sg-0bbfe8e7d4bf3c179" ]
   depends_on = [ aws_iam_user.this_iam_user_admin]
   count = var.aws_any.list[1]
}
variable "aws_any" { 
    default = { 
       instancetype = "t3.micro"  #key 
       instancecount = 3 #num 
       terminationapi = false #bool
       list = [ 1 , 2 ]
       map = {
        privatekey1 = "30july" 
        privatekey2 = "anupnv"
       }

     }
  
}