provider "aws" {
  region = "us-east-2"
  profile = "new"
} 

resource "aws_instance" "example" {
    instance_type = "t3.micro"
    ami = "ami-0b0b78dcacbab728f"
    key_name = "ohiokey"
    vpc_security_group_ids = ["sg-0aecda28a625e1a5d"]
   
    provisioner "file" {
    source      = "sample.txt"
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