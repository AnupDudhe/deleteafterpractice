resource "aws_instance" "this_ubuntu" {
    ami = var.this_image_id    #var.this_image_id 
    disable_api_stop  = var.this_any.api_stop_ec2  #var.this_disable_api_stop 
    disable_api_termination =  var.this_any.api_termination_ec2  #var.this_disable_api_termination  
    instance_type = var.this_list[0]  #var.this_any.instance_type_list[0]
    #key_name=""
    #vpc_security_group_ids = [var.this_vpc_security_group_ids]
      depends_on = [aws_subnet.this_subnet_pub]
    subnet_id =  aws_subnet.this_subnet_pub.id
    #count =    var.this_any.count   #var.this_count  #loop #var.this_list[1]
    tags = {
       purpose = var.this_map.purposeec2    #var.this_any.tags_map.purposeec2
       #purpose = "webserver"
    } 
    

}    


resource "aws_vpc" "this_vpc" {
    cidr_block = var.this_vpc_cidr_block //"12.11.0.0/16"
    tags =  {
        Name = var.this_vpc_tags //"this_vpc"
    }
}

resource "aws_subnet" "this_subnet_pub" {
  vpc_id     = aws_vpc.this_vpc.id  #referedresourceblock'sProvider_referedresourceblock'sresourcetype.referedresourceblocksuniqueresourceblockname.attributeofresource
  availability_zone = "ap-south-1a"
  cidr_block = var.this_subnet_pub_cidr_block      //"12.11.0.0/17"  
  map_public_ip_on_launch = var.this_subnet_pub_map_ip //true
  tags = {
    Name = var.this_subnet_pub_tags //"pub_subnet"
  }
}


