resource "aws_instance" "this_inst" {
  ami                     = var.This_ami
  instance_type           = var.This_inst
  availability_zone       = var.This_az
  disable_api_termination = var.This_api_termination
  key_name                = var.This_key
  #vpc_security_group_ids  = var.This_sg
  tags = {
      Name = var.This_tag
     }
 
}