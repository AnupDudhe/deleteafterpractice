

terraform blocks 
provider - to setup a authenticaed connection between the terraform and cloud provider(aws)
resource - to creare infrastucture ec2 , s3 , vpc we use this resource block in tf
ouput
variables 
module
provisioners
backend 
data 
loops 

tf - hcl 
tfblockname  

provider "cloudprovidername-uniquename" {
      key=value 
      agruements
}

provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"

}

resource "cloudprovidername_resourcename" "uniquename" {

}

resource "aws_ec2"  "webserver" {
     instancetype = t2.micro 
     agruements
}

resource "aws_ec2"  "dbserver" {
    
}

resource "aws_instance" "webserver" {
   key_name 
   instance_type 
   vpc_security_group_ids
   disable_api_termination  
   tags = {
    Name = "Webserver"
  }

}


