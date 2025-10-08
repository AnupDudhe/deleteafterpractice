output "ec2_instance_id" {
  value = aws_instance.webserver.*.id
  
}

output "ec2_instance_ip" {
   value = aws_instance.webserver.*.public_ip
}