output "subnet_id" {
     value = aws_subnet.this_public.id
}

output "aws_vpc_id" {
  value = aws_vpc.this_vpc.id
}