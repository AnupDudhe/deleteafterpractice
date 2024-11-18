output "instance_id" {
    value = aws_instance.this_ubuntu.id
  
}

output "instancepublic_ip" {
    value = aws_instance.this_ubuntu.public_ip
  
}
