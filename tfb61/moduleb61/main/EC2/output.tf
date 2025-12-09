
output "websever_pubip" {
  value =    aws_instance.webserver.public_ip 

}
output "websever_public_dns" {
  value =    aws_instance.webserver.public_dns 
  
}

