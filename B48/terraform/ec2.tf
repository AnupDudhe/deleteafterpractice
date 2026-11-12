provider "aws" {   
   region     = "ap-south-1"
   profile    = "configs"
}


resource "aws_instance" "webserver_block" {
    ami = var.this_webserverami
    instance_type = var.this_instancetype
    key_name = var.this_keypair
    vpc_security_group_ids = [ var.this_sg , aws_security_group.ws_sgblock.id  ]
    tags = {
        name = "webserver"
    }
   user_data = <<-EOF
        #!/bin/bash
        sudo yum install nginx -y 
        sudo systemctl start nginx
        EOF
    #count = var.this_instcount
    disable_api_termination = var.this_apiterm
}

resource "aws_security_group" "ws_sgblock" {
    ingress {  
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

     ingress {  
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

      egress {  
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "webserver-sg"
    }
}

output "this_instancepubIP" {
  value = aws_instance.webserver_block.public_ip
}

output "this_instanceprivatedns" {
  value = aws_instance.webserver_block.private_dns
}

output "this_instanceid" {
  value = aws_instance.webserver_block.id 
}