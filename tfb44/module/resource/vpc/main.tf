resource "aws_vpc" "ws_vpc" {
   cidr_block = var.this_cidr
}

resource "aws_subnet" "ws_subnet" {
    availability_zone = var.this_az
    vpc_id  = aws_vpc.ws_vpc.id
    cidr_block = var.this_subcidr
}

