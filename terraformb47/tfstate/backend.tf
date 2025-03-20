provider "aws" {
      region = "us-west-2"
      profile = "configs"
      shared_credentials_files = ["/home/anup/.aws/credentials"]
    
}

#LockID
terraform {
    backend "s3" {
        bucket = "cbzbatch"
        key = "terraform.tfstate"
        dynamodb_table = "cbz24"
        region = "us-west-2"
        profile = "configs"
        shared_credentials_files = ["/home/anup/.aws/credentials"]
    }
}


resource "aws_instance" "ths_instance" {
  ami = "ami-0a38c1c38a15fed74"
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
