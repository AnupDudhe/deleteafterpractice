resource "aws_instance" "webserver" {
  #arguements
  ami                    =  var.instanceami
  instance_type          = var.instancetype
  vpc_security_group_ids = [ var.sg, aws_security_group.webserversg.id , data.aws_security_group.sg_gui.id ] #cloudprovider_tfresourcegame.uniqueblockname.attribute
  key_name               = var.keyname
  #count = var.nosofinstances
  disable_api_termination = var.api_termination
  depends_on = [aws_security_group.webserversg]  #explicit dependency
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

      egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }

}

data "aws_security_group" "sg_gui" {
   name = "rdssecurity"
}




output "webserver_public_ip" {
  value = aws_instance.webserver.public_ip
}

output "webserver_instance_id" {
  value = aws_instance.webserver.id
}

output "webserver_public_dns" {
  value = aws_instance.webserver.public_dns
}

output "webserver_instance_state" {
  value = aws_instance.webserver.instance_state
}

output "webserver_sg_id" {
    value = aws_security_group.webserversg.id
}

output "webserver_sg_arn" {
    value = aws_security_group.webserversg.arn
}
