
resource "aws_instance" "this_inst" {
  ami                     = var.This_list
  instance_type           = var.This_any.string
  availability_zone       = var.This_az
  disable_api_termination = var.This_api_termination
  key_name                = var.This_key
  security_groups         = var.This_sg
  #count = var.This_list.1
  #vpc_security_group_ids  = This_list.2
    tags = {
      Name = var.This_tag
  }
 
}

