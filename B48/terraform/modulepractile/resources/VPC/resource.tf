resource "aws_vpc" "webserver_vpc" {
     cidr_block = var.vpc_cidr
}

resource "aws_subnet" "webserver_subA" {
    vpc_id = aws_vpc.webserver_vpc.id
    cidr_block = var.subnet_cidr
}