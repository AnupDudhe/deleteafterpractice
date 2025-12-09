output "subnet_id" {
  value = aws_subnet.cbz_subnetA.id
}

output "vpc_id" {
  value = aws_vpc.cbz_vpc.id
}

output "webserver_sg" {
  value = aws_security_group.webserver_sg.id
}

output "webserver_sg_id" {
  value =  aws_security_group.webserver_sg.id  

}

output "webserver_sg_arn" {
  value =  aws_security_group.webserver_sg.arn

}