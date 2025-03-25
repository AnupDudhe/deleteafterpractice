provider "aws" {
  region = "ap-south-1" # Change to your desired region
  profile = "configs"
}

resource "aws_instance" "ec2webserver" {
  ami =  var.this_ami_id
  instance_type  = var.this_instancetype
  #vpc_security_group_ids = ["sg-0b1e8061bdcc3b242"]
  key_name = var.this_keyname
  tags = {
    name = var.this_tags
  }
  user_data_base64 = var.this_b64
  count = var.this_count
  #subnet_id = "subnet-0ff38141a792616f5"
  availability_zone = var.this_availability_zone


}

resource "aws_security_group" "webserversg" {
    dependson = [aws_instance.ec2webserver]
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