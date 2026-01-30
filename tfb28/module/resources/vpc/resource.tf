resource "aws_vpc" "webserver_vpc" {
  cidr_block =  var.this_vpc_cidr
}


resource  "aws_subnet" "this_public"  {
    vpc_id = aws_vpc.webserver_vpc.id 
    cidr_block = var.this_vpc_cidr_subnet
    map_public_ip_on_launch = var.this_map_public_ip_on_launch
    

     tags = {
     Name =  var.this_public_tags
  }
}