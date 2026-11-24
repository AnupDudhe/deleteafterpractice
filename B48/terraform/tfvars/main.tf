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
   user_data = <<-EOF
        #!/bin/bash
        sudo yum install nginx -y 
        sudo systemctl start nginx
        EOF
    disable_api_termination = var.this_apiterm
}
