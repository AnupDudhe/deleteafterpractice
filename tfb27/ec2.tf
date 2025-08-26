provider "aws" {
     region = "eu-north-1"
	 profile = "configs"
}


resource "aws_instance" "webserverresourceblock" {
    ami = "ami-0c4fc5dcabc9df21d" 
    instance_type =  "t2.micro" 
    key_name = "b27stk"
    vpc_security_group_ids =  ["sg-083d7eae0bf8a0d7d"]
}