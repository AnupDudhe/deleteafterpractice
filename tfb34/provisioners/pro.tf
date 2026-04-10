provider "aws" {
  region = "us-east-1"
  profile = "configs"
} 

resource "aws_instance" "example" {
    instance_type = "t3.micro"
    ami = "ami-01b14b7ad41e17ba4"
    key_name = "tf"
    vpc_security_group_ids = ["sg-033f2559c156114d8"]
   
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