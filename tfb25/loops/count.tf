
provider "aws" {
    region =  "ap-south-1"
    profile = "configs"
}
 

resource "aws_instance" "this_aws_instance" {
    ami = "ami-0be5f59fbc80d980c"
    //vpc_security_group_ids = ["sg-032e1a4a1685a03be"]
    //key_name = "delete_oregon_anup"
    instance_type = "t2.micro"
    count = 3
}   
 
