
output "ec2_outputs" {
  value = aws_instance.this_inst.public_ip
}