provider "aws" {   
   region     = ap-south-1
   access_key =  ""
   secret_key =  ""
}


resource "aws_instance" "webserver_block" {
    ami = "ami-0f19324397f53458f"
    instance_type = "t3.micro"
    key_name = "Linux_dev"
    security_groups = "sg-02977f9ed12529e66"
    tags = {
        name = webserver
    }
   
}