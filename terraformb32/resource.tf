resource "aws_instance" "webserver" {
  #arguements
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-07f4a1e0551a112e8" , aws_security_group.webserversg.id] #cloudprovider_tfresourcegame.uniqueblockname.attribute
  key_name               = "ubuntu"

  tags = {
    Name    = "webserver-instance"
    purpose = "learning-terraform"
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo -i 
                apt install apache2 -y
                systemctl start apache2
                EOF
} 


resource "aws_security_group"  "webserversg" {
      
      ingress { 
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      } 

      ingress { 
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      } 

      egress = {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }

}