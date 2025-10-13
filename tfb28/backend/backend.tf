provider "aws" {
      region = "us-east-1"
      profile = "configs"
      shared_credentials_files = ["/home/anup/.aws/credentials"]
    
}

#Partitionkey = LockID
terraform {
    backend "s3" {
        bucket = "cbzbatchb28new"
        key = "terraform.tfstate"
        dynamodb_table = "cbz"
        region = "us-east-1"
        profile = "configs"
        shared_credentials_files = ["/home/anup/.aws/credentials"]
    }
}


resource "aws_instance" "ths_instance" {
  ami = var.this_aws_ami
  //key_name = ""
  instance_type = var.this_aws_instance_instance_type
  count = var.this_aws_instance_count
  
  
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo echo "hello world this is Batc24" >> /var/www/html/index.html
    EOF
   tags = {
    Name = "first_terraform_instance"

  } 
    
}