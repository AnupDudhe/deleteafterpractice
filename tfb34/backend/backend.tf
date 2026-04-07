provider "aws" {
      region = "us-east-1"
      profile = "configs"
      shared_credentials_files = ["/home/anup/.aws/credentials"]
    
}

terraform {
    backend "s3" {
        bucket = "b34cbznew"
        key = "terraform.tfstate"
        dynamodb_table = "b34"
        region = "us-east-1"
        profile = "configs"
        shared_credentials_files = ["/home/anup/.aws/credentials"]
    }
}

resource "aws_instance" "example" {
   instance_type = "t3.micro"
   ami = "ami-01b14b7ad41e17ba4"
    key_name = "LinuxKey"
   vpc_security_group_ids = [ "sg-0eca60a5007bc8188" ]
}