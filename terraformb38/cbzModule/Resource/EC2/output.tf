output "instancepubip" {
  value = aws_instance.webserver.public_ip
} 

output "instanceid" {
  value = aws_instance.webserver.id 
}