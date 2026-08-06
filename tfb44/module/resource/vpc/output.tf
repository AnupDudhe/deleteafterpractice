output "subnet_id" {
    value = aws_subnet.ws_subnet.id 
}

output "vpc_id" {
    value = aws_vpc.ws_vpc.id
}