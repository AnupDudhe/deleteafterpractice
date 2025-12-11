provider "aws" {
      region = "us-east-1"
      profile = "configs"
      shared_credentials_files = ["/home/anup/.aws/credentials"]
    
}

#Partitionkey = LockID
terraform {
    backend "s3" {
        bucket = "tfstateb61"
        key = "terraform.tfstate"
        dynamodb_table = "b61"
        region = "us-east-1"
        profile = "configs"
        shared_credentials_files = ["/home/anup/.aws/credentials"]
    }
}

resource "aws_instance" "example" {
   instance_type = "t3.micro"
   ami = "ami-0c398cb65a93047f2"
    key_name = "30july"
   vpc_security_group_ids = [ "sg-0bbfe8e7d4bf3c179" ]
}

