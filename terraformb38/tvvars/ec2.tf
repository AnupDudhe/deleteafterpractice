provider "aws" {
  region     = "us-east-1"
  profile  =  "configs" 
} 


resource "aws_instance" "webserver" {
   
   key_name = var.keymap
   ami = var.amiid
   instance_type =   var.instancetype
   vpc_security_group_ids = [var.sg]
   count = var.instcount
   disable_api_termination = var.apiterm

   user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    sudo systemctl start apache2
    sudo systemctl enable apache2
    EOF
  tags = {
    Name = "Webserver"
  }

}