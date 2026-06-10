provider "aws" {
  region     = "us-east-2"
  profile  =  "configs" 
} 


resource "aws_instance" "webserver" {
   depends_on = [aws_security_group.webserversg] #explict dependency
   key_name = var.this_key_name
   ami = var.this_ami 
   instance_type = var.This_instance_type
   vpc_security_group_ids = [var.This_vpc_security_group_ids , aws_security_group.webserversg.id , data.aws_security_groups.defaultsg_search.id ]
   #count = var.this_count
   tags = {
    Name = "Webserver"
  }
   disable_api_termination = var.this_disable_api_termination

   user_data = <<-EOF 
               #!/bin/bash 
               sudo -i 
               apt install apache2 -y 
               systemctl start apache2
               EOF
}

resource "aws_security_group" "webserversg" {
  name  = "webserversg"
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "HTTP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}



output "instancepubip" {
  value = aws_instance.webserver.public_ip
} 

output "instanceid" {
  value = aws_instance.webserver.id 
}


data "aws_security_groups" "defaultsg_search" {
   name = "default"
}

#data "aws_ami" "searchami" {
  #name = ""
#}

#access_key = "my-access-key"
#secret_key = "my-secret-key" 

#aws configure --profile=configs 
#disable_api_termination = true