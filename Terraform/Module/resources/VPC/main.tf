resource "aws_vpc" "this_vpc" {
  cidr_block = var.this_vpc_cidr_block //"192.168.0.0/16"
  tags = {
    Name = var.this_vpc_cidr_tags //"vpc"
  }
}
resource "aws_subnet" "this_public" {
  vpc_id     = aws_vpc.this_vpc.id
  cidr_block = var.this_public_cidr_block //"192.168.0.0/17"
       // = default_route_table_id'
  map_public_ip_on_launch = var.this_public_map_pub //true
  tags = {
    Name = var.this_public_tags
  }
}