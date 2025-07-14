resource "aws_instance" "this" {
   ami = var.this_image_id
   instance_type =   var.this_any.instance_type_list[0]
   vpc_security_group_ids = [var.this_map.secgroup]
   root_block_device {
    volume_size = var.this_volsize
    volume_type = var.this_list[0] 
    delete_on_termination = var.this_deleteont
}

 tags = {
     Name =  var.this_any.tags_map.name
     purpose = webserver.var.this_any.tags_map.purposeec2
   }

}


resource "aws_security_group" "webserversg" {
      ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
    ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}