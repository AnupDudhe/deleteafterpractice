resource "aws_instance" "this_inst" {
  ami                     = "ami-0427090fd1714168b"
  instance_type           = "t2.micro"
  availability_zone       = "us-east-1a"
  disable_api_termination = "true"
  key_name                = "anupnvdev"
  #security_groups         = "default"
  count = "2"
  vpc_security_group_ids  = ["sg-09d5d9601120f72dd"]
  volume_size   = "30GiB"
  volume_type   = "gp2"




    tags = {
      Name = "TerraEC2"  
      #batch =  
      #strength = 
  }
 
}