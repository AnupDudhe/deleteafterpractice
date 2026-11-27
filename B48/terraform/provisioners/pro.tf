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
    
    provisioner "file" {
      source = "data.sql" 
      destination = "/home/ec2-user/datasql" 
    }
    provisioner "remote-exec" {
         inline = [
            "sudo yum install nginx -y" ,
            "sudo systemctl start nginx" ,
            "sudo systemctl enable nginx" ,
            "sudo yum update all"
         ]
    }
    provisioner "local-exec" {
          command = "echo ${self.private_ip} >> priavteip.txt"
      }
          connection {
             type = "ssh" 
             user = "ec2-user" 
             private_key = file("${path.module}/tf.pem")
             host = self.public_ip
          }
  
}