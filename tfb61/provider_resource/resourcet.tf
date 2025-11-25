resource "aws_instance" "example" {
   
   instance_type = "t3.micro"
   ami = "ami-0fa3fe0fa7920f68e"
    key_name = "30july"
   vpc_security_group_ids = [ "sg-0bbfe8e7d4bf3c179" ]
}