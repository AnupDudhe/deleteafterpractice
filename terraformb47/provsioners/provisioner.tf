
provider "aws" {
  region = "ap-south-1"
  //access_key = ""
  //secret_key = ""
  profile = "configs"
}
resource "aws_instance" "this_aws_instance" {
  //for_each = toset(var.imageid)
  ami                    = "ami-05c179eced2eb9b5b"
  vpc_security_group_ids = ["sg-09ae24b53482e0b20"]
  key_name               = "b25"
  instance_type          = "t2.micro"
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
    private_key = file("${path.module}/id_rsa")
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