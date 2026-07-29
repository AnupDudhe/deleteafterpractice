resource = instance , s3, iam , any aws services , to create these we use resource block.
provider = tf (iaac) --> aws(services create)  
provider block provides right full authentication and permission to cloud provider 



provider "aws" {
  region = "us-east-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"

}

resource "cloudprovider_resource" "unique_blockname" {
     key = value 
     arguements 
}

resource "aws_instance"  "webserver" {
     ami = 
     instance_type =
     vpc_security_group_ids = 
     key_name = 




}