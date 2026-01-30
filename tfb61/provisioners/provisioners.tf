provider "aws" {
  region = "us-east-1"
  profile = "configs"
} 

resource "aws_instance" "example" {
   instance_type = "t3.micro"
   ami = "ami-068c0051b15cdb816"
    key_name = "anupnv"
   vpc_security_group_ids = [ "sg-0bbfe8e7d4bf3c179" ]
   
    provisioner "file" {
    source      = "hello.txt"
    destination = "/home/ec2-user/aws/"
  }

     provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt" 
   }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/tf.pem")
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
