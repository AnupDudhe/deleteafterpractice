resource "aws_instance" "this_inst" {
  ami                     = var.This_list.0
  instance_type           = var.This_any.string
  availability_zone       = var.This_map.keytwo
  disable_api_termination = var.This_api_termination
  key_name                = var.This_map.keyone
  #security_groups         = "default"
  #count = var.This_list.1
  vpc_security_group_ids  = ["sg-09d5d9601120f72dd"]
  #volume_size   = "10GiB"
  #volume_type   = "gp3"
    tags = {
      Name = "TerraEC2"  
      #batch =  
      #strength = 
  }
 
}


output "ec2_outputs" {
  value = aws_instance.this_inst.public_ip
}