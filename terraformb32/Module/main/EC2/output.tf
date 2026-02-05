output "webserver_pubip"{
    value = aws_instance.webserver.public_ip
}

output "webserver_public_dns"{
    value = aws_instance.webserver.public_dns
  
}