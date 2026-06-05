provider "aws" {
  region     = "us-west-2"
  profile  =  "configs" 
} 


resource "aws_instance" "webserver" {
   key_name = "abhijeet"
   ami = "ami-078f95be0757084a3" 
   instance_type = "t3.micro" 
   vpc_security_group_ids = ["sg-0e924451d7773195c"]
   tags = {
    Name = "Webserver"
  }

}

#access_key = "my-access-key"
#secret_key = "my-secret-key" 

#aws configure --profile=configs 
#disable_api_termination = true