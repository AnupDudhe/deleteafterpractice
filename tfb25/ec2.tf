resource "aws_instance" "web" {
   ami="ami-05ee755be0cd7555c"
   instance_type = "t2.micro"
   vpc_security_group_ids = ["sg-0243699f25e16090b"] 
   delete_on_termination=true
   volume_type="gp2"
   volume_size=10
   
  tags = {
    Name = "webserver"
    purpose = "webserverinstalled"
  }
  
}