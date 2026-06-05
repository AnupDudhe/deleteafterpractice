provider "aws" {
  region     = "us-west-2"
  profile  =  "configs" 
} 


resource "aws_instance" "webserver" {
   key_name =
   ami = 
   instance_type = 
   vpc_security_group_ids =
   disable_api_termination = 
   tags = {
    Name = "Webserver"
  }

}

#access_key = "my-access-key"
#secret_key = "my-secret-key" 

#aws configure --profile=configs 