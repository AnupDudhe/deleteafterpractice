
resource "aws_instance" "this_inst" {
  ami                     = var.This_list
  instance_type           = var.This_any.string
  availability_zone       = var.This_az
  disable_api_termination = var.This_api_termination
  key_name                = var.This_map.keyone
  #security_groups         = "default"
  #count = var.This_list.1
  #vpc_security_group_ids  = [var.This_list.2]
    tags = {
      Name = var.This_list.3
  }
 
}


output "ec2_outputs" {
  value = aws_instance.this_inst.public_ip
}