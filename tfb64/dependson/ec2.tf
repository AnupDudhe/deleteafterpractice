provider "aws" {
  region = "us-east-2"
  profile = "new"
} 

resource "aws_instance" "example" {
    instance_type = "t3.micro"
    ami = "ami-0b0b78dcacbab728f"
    key_name = "sampleoh"
    vpc_security_group_ids = ["sg-0aecda28a625e1a5d"]
     

  }


resource "aws_vpc" "webservervpc" {
 cidr_block = "10.10.0.0/20"
 depends_on = [aws_instance.example]  
}

