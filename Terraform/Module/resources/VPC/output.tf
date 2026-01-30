
output "aws_vpc_id" {
  value = aws_vpc.this_vpc.id
}
output "aws_subnet_this_public" {
  value = aws_subnet.this_public.id
}