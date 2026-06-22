provider "aws" {
  region     = "us-east-1"
  profile  =  "configs" 
} 

resource "aws_instance" "webserver" {
    
   key_name = "test"
   ami = "ami-0521cb2d60cfbb1a6"
   instance_type =  "t3.micro"
   vpc_security_group_ids = ["sg-0ae3d2f367ebf0641"]
   
   provisioner "file" {
    source      = "sample.txt"
    destination = "/home/ec2-user/sample/"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/new.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [

      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }



}