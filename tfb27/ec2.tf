provider "aws" {
     region = "eu-north-1"
	 profile = "configs"
}


resource "aws_instance" "webserverresourceblock" {
    ami = "ami-0c4fc5dcabc9df21d" 
    instance_type =  "t2.micro" 
    key_name = "b27stk"
    vpc_security_group_ids =  ["sg-083d7eae0bf8a0d7d" , aws_security_group.webserver_sg.id ] 
    tags = {
        Name = "webserverinstance"
    }
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
