provider "aws" {
      region = "us-east-1"
      profile = "configs"
      shared_credentials_files = ["/home/anup/.aws/credentials"]
    
}

#Partitionkey = LockID
terraform {
    backend "s3" {
        bucket = "cbzbatchb47"
        key = "terraform.tfstate"
        dynamodb_table = "cbz24"
        region = "us-east-1"
        profile = "configs"
        shared_credentials_files = ["/home/anup/.aws/credentials"]
    }
}


resource "aws_instance" "ths_instance" {
  ami = "ami-0a7a4e87939439934"
  //key_name = ""
  instance_type = "t2.micro"
  //security_groups = [""]
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
