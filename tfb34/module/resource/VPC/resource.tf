resource "aws_vpc" "ws_vpc" {
   cidr_block = var.cidrbloc
    
}


resource "aws_subnet" "ws_subnet" {
    vpc_id = aws_vpc.ws_vpc.id
    cidr_block = var.subnetbloc
}

