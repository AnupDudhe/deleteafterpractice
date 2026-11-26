provider "aws" {   
   region     = "ap-south-1"
   profile    = "configs"
} 

resource "aws_instance" "webserver_block" {
    ami = var.this_webserverami
    instance_type = var.this_instancetype
    key_name = var.this_keypair
    vpc_security_group_ids = [ var.this_sg]
    tags = {
        name = "webserver"
    }
    count = 3
   user_data = <<-EOF
        #!/bin/bash
        sudo yum install nginx -y 
        sudo systemctl start nginx
        EOF
    disable_api_termination = var.this_apiterm

}


resource "aws_instance" "webserver_blocknew" {
    ami = each.value
    for_each = toset(var.ami_types)
    instance_type = var.this_instancetype
    key_name = var.this_keypair
    vpc_security_group_ids = [ var.this_sg]
    tags = {
        name = "webserver"
    }
   user_data = <<-EOF
        #!/bin/bash
        sudo yum install nginx -y 
        sudo systemctl start nginx
        EOF
    disable_api_termination = var.this_apiterm

}

variable "ami_types" {
    default = ["ami-0593d733c2fc5bd2e" , "ami-02f853b31ccb5871f" , "ami-0e3d66c690eb97869"]
}