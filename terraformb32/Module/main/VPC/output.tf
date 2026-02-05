output "subnet_id" {
   value = aws_subnet.cbz_subnetA.id 
}

output "vpc_id" {
    value = aws_vpc.cbz_vpc.id  
}

output "webserversg" { 
     value = aws_security_group.webserversg.id
  
}

output "webserversg_Arn" {
    value = aws_security_group.webserversg.arn
}