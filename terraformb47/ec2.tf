resource "aws_instance" "ec2webserver" {
  ami =  "ami-05c179eced2eb9b5b"
  instance_type  = "t2.micro"
  vpc_security_group_ids = ["sg-0b1e8061bdcc3b242"]
  key_name = "b25"
  tags = {
    name = "webserver"
  }
  subnet_id = "subnet-0ff38141a792616f5"
}
