resource "aws_vpc" "cbz_vpc" {
    cidr_block = var.vpc_cidr
}

resource "aws_subnet" "cbz_subnetA" {
    vpc_id = aws_vpc.cbz_vpc.id
    cidr_block = var.vpc_subnetA
    map_public_ip_on_launch = var.public_ip  
}


resource "aws_security_group" "webserver_sg" {
   vpc_id = aws_vpc.cbz_vpc.id
   ingress {
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

   }

   ingress {
      from_port = 8080
      to_port   = 8080
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

   } 

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}