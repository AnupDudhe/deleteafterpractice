provider "aws" {
  region = "us-east-1" 
  profile = "configs"
}


resource "aws_instance" "webserver" {
    ami = "ami-08982f1c5bf93d976" 
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-0d1eccf2d4ec11307" , aws_security_group.sg-webserver.id ]

user_data = <<-EOF
                 #!/bin/sh
      sudo -i
      yum install nginx -y
      systemctl start nginx
      systemctl enable nginx
      systemctl start mariadb
      systemctl enable mariadb
      bash /root/apache-tomcat-8.5.97/bin/catalina.sh start
                
                EOF
}


resource "aws_security_group"  "sg-webserver" {
   ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }

   ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
    
   }
}