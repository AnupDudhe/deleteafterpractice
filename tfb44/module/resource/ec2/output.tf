output "instaneip" {
   value = aws_instance.webserver.public_ip
}

output "pubdns" {
  value = aws_instance.webserver.public_dns
}