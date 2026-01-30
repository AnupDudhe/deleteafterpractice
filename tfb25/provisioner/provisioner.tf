
provider "aws" {
  region = "us-west-2"
  //access_key = ""
  //secret_key = ""
  profile = "configs"
}
resource "aws_instance" "this_aws_instance" {
  //for_each = toset(var.imageid)
  ami                    = "ami-04158184f60ea8b5e"
  vpc_security_group_ids = ["sg-0243699f25e16090b"]
  key_name               = "tf"
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
