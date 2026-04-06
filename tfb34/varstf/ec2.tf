
provider "aws" {
    profile = "configs"  #masking 
    region = "us-east-1"

}

# blockname  "cloudproviername_resourcetype" "uniquename" { #arguments}


resource  "aws_instance" "webserver" {
    ami = var.this_ami
    instance_type =  var.this_inst 
    key_name = var.this_key
    disable_api_termination =  var.this_api
    vpc_security_group_ids = [var.this_sg , aws_security_group.ws.id , data.aws_security_group.datasg.id]
    #count = var.this_count
}

resource "aws_security_group" "ws" {
    name = "webserver_sg"
    description = "Allow HTTP and SSH traffic"


    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}


data "aws_security_group" "datasg" {
        name = "launch-wizard-6"

}

output "instance_ip" { 
    value = aws_instance.webserver.public_ip
}

output "public_dns" { 
    value = aws_instance.webserver.public_dns 
}