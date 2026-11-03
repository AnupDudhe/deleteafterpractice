provider "aws" {   
   region     =
   access_key = 
   secret_key = 
}


resource "aws_instance" "webserver_block" {
    ami = 
    instance_type = "t3.micro"
    key_name = 
    security_groups = 
    tags = {
        name = webserver
    }
   
}