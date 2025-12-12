provider "aws" {
  region = "ap-south-1"
  profile = "configs"
}


resource "aws_instance" "example" {
   instance_type = "t3.micro"
   ami = "ami-00ca570c1b6d79f36"
   count =  2
}


### creating servers with different os 
resource "aws_instance" "example2" {
   instance_type = "t3.micro"
   ami = var.ami_list[count.index]
   count =  length(var.ami_list)

}

variable "ami_list"{
    default = ["ami-00ca570c1b6d79f36" , "ami-02b8269d5e85954ef"]
                  #0                       #1
}