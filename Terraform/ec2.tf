resource "aws_instance" "this_inst" {
  ami                     = "ami-0427090fd1714168b"
  instance_type           = "t2.micro"
  availability_zone       = "us-east-1a"
  disable_api_termination = var.This_api_termination
  key_name                = "anupnvdev"
  #security_groups         = "default"
  count = var.This_count
  vpc_security_group_ids  = ["sg-09d5d9601120f72dd"]
  #volume_size   = "10GiB"
  #volume_type   = "gp3"
    tags = {
      Name = "TerraEC2"  
      #batch =  
      #strength = 
  }
 
}