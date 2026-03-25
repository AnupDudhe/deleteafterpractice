#blocks 
#provider , resource , variable , data , output , module , provisioner , backend 
#loops , statelocking , tf workspace. 

#provider aws (Cloud provider) => terraform  


#blockname  "blockuniquename" { #arguments}

provider "aws" {
    secret_key = "" 
    access_key = ""
    region = "us-east-1"

}

# blockname  "cloudproviername_resourcetype" "uniquename" { #arguments}


resource  "aws_instance" "webserver" {
    ami = "ami-02dfbd4ff395f2a1b"
    instance_type =  "t3.micro"
    key_name = "sample"
    disable_api_termination = false 
    vpc_security_group_ids = ["sg-02a862f1a1dab84e5"]
    tags ={
        name = "Webserver"
    }
}