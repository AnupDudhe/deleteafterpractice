output "ws_vpcid" {
  value = aws_vpc.webserver_vpc.id
}

output "ws_subnetid" {
  value = aws_subnet.webserver_subA.id
}