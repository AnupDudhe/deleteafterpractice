provider "aws" {
  region     = "us-east-1"
  profile = "configs2" #masking
}


resource "aws_instance" "webserver2" {
    ami = "ami-0c1fe732b5494dc14"
    instance_type = "t3.micro"
    
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