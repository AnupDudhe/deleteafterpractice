resource "aws_instance" "web" {
   ami = "ami-05ee755be0cd7555c"
   instance_type = "t2.micro"
   vpc_security_group_ids = ["sg-0243699f25e16090b"] 
   delete_on_termination = false
   root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }
   
  tags = {
    Name = "webserver"
    purpose = "webserverinstalled"
  }

}