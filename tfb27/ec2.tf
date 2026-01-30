provider "aws" {
     region = "eu-north-1"
	 profile = "configs"
}


resource "aws_instance" "webserverresourceblock" {
    ami =  var.this_ami
    instance_type =  var.this_instance_type
    key_name = var.this_keyname
    vpc_security_group_ids =  [ var.this_sgid , aws_security_group.webserver_sg.id ] 
    tags = {
        Name = var.this_instance_name
    }
    #count = var.this_count
} 


resource "aws_security_group" "webserver_sg" {
       ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

      ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

      ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




output "webserver_pubip" {
  value =  aws_instance.webserverresourceblock.public_ip

}