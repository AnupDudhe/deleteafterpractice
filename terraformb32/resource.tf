resource "aws_instance" "webserver" {
  #arguements
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-07f4a1e0551a112e8"]
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