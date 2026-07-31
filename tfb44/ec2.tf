provider "aws" {
  region = "us-east-1"
  profile = "configs"
} 



resource "aws_instance"  "webserver" {
    ami = var.amiid
    instance_type = var.insttype
    vpc_security_group_ids =  [ var.sg , aws_security_group.webserver_sg.id , data.aws_security_group.sgdata.id ]
    key_name = var.kp
    tags = {
        purpose = "webserver"
    }
    #count = var.instno
    disable_api_termination = var.apiterm
    user_data = <<-EOF
                 #!/bin/bash
                 sudo yum install nginx -y
                 sudo systemctl start nginx
                EOF

}


resource "aws_security_group" "webserver_sg" {
    name = "tf-sg"
    ingress {
      from_port = 80
      to_port = 80
      protocol = "TCP"
      cidr_blocks  = ["0.0.0.0/0"]
    }

    ingress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks  = ["0.0.0.0/0"]
    }


    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks  = ["0.0.0.0/0"]

    }

}



data "aws_security_group" "sgdata" {
    name = "launch-wizard-5"
}


output "instaneip" {
   value = aws_instance.webserver.public_ip
}

output "pubdns" {
  value = aws_instance.webserver.public_dns
}