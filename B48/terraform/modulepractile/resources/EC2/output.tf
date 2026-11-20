output "this_instancepubIP" {
  value = aws_instance.webserver_block.public_ip
}

output "this_instanceprivatedns" {
  value = aws_instance.webserver_block.private_dns
}

output "this_instanceid" {
  value = aws_instance.webserver_block.id 
}
