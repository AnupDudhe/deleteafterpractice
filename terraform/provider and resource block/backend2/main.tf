provider "aws" {
      region = "us-east-1"
      profile = "configs"
      shared_credentials_files = ["~/.aws/credentials"]
    
}

#LockID
terraform {
    backend "s3" {
        bucket = "cbzanup"
        key = "terraform.tfstate"
        dynamodb_table = "cbz38"
        region = "us-east-1"
        profile = "configs"
        shared_credentials_files = ["~/.aws/credentials"]
    }
}


resource "aws_instance" "ths_instance" {
  ami = "ami-012967cc5a8c9f891"
  //key_name = "anupdel"
  instance_type = "t2.micro"
  //security_groups = ["sg-02582bf615cdb71bb"]
  count = 1
  
  
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