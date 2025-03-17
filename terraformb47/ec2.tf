resource "aws_instance" "ec2webserver" {
  ami =  "ami-05c179eced2eb9b5b"
  instance_type  = "t2.micro"
  vpc_security_group_ids = ["sg-0b1e8061bdcc3b242"]
  key_name = "b25"
  tags = {
    name = "webserver"
  }
  #subnet_id = "subnet-0ff38141a792616f5"
  #availability_zone = "ap-south-1c"

  user_data     = <<-EOF
                    #!/bin/bash
                    echo "Hello, World!" > /tmp/hello.txt
                  EOF
}

resource "aws_security_group" "webserversg" {
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


   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}