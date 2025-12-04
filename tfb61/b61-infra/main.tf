resource "aws_instance" "webserver" {
   ami = var.webserver_ami
   instance_type  = var.webserver_instance_type
   key_name = var.webserver_key_name
   vpc_security_group_ids = [var.webserver_vpc_security_group_ids , aws_security_group.webserver_sg.id  ]
   disable_api_termination = var.webserver_disable_api_termination
   #count = var.webserver_count
}


resource "aws_security_group" "webserver_sg" {
    
   ingress {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

   }

   ingress {
      from_port = 8080
      to_port   = 8080
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

   } 

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}

output "websever_pubip" {
  value =    aws_instance.webserver.public_ip 

}
output "websever_public_dns" {
  value =    aws_instance.webserver.public_dns 
  
}

output "webserver_sg_id" {
  value =  aws_security_group.webserver_sg.id  

}

output "webserver_sg_arn" {
  value =  aws_security_group.webserver_sg.arn

}