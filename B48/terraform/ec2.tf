provider "aws" {   
   region     = "ap-south-1"
   access_key =  ""
   secret_key =  ""
}


resource "aws_instance" "webserver_block" {
    ami = "ami-0f19324397f53458f"
    instance_type = "t3.micro"
    key_name = "Linux_dev"
    vpc_security_group_ids = ["sg-02977f9ed12529e66"]
    tags = {
        name = "webserver"
    }
   
}

resource "aws_security_group" "ws_sgblock" {
    ingress {  
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

     ingress {  
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

      egress {  
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "webserver-sg"
    }
}