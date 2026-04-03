
output "instance_ip" { 
    value = aws_instance.webserver.public_ip
}

output "public_dns" { 
    value = aws_instance.webserver.public_dns 
}