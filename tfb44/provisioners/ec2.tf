provider "aws" {
  region = "us-east-1"
  profile = "configs"
} 

resource "aws_instance"  "webserver" {
    ami = var.amiid
    instance_type = var.insttype
    vpc_security_group_ids =  [ var.sg]
    key_name = var.kp


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
      "sudo yum update all",
      "sudo yum upgrade",
      "sudo systemctl enable httpd"
    ]
  }





}