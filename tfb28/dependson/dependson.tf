provider "aws" {
  region = "us-east-1" # Change to your desired region
  profile = "configs"
}

resource "aws_instance" "ec2webserver" {
  ami =  var.this_ami_id.ami_id
  instance_type  = var.this_any.instance_type_list[1] 
  key_name = var.this_any.this_keyname
  tags = {
    name = var.this_any.tags_map.purposeec2
  }
  user_data_base64 = var.this_b64
  count = var.this_count
  #subnet_id = "subnet-0ff38141a792616f5"
  availability_zone = var.this_availability_zone


}

resource "aws_instance" "ec2webserver2" {
  ami =  var.this_ami_id.ami_idaws
  instance_type  = var.this_instancetype[0]
  key_name = var.this_any.this_keyname
  tags = {
    name = var.this_tags
  }
  user_data_base64 = var.this_b64
  count = var.this_count
  #subnet_id = "subnet-0ff38141a792616f5"
  availability_zone = var.this_availability_zone


}

resource "aws_security_group" "webserversg" {
    depends_on = [aws_instance.ec2webserver]
      ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}


variable "this_instancetype" {
    type = list
    default = ["t3.micro" ,  "t3.medium"  , "t2.small"]
                  #0             #1              #2 
}

variable "this_ami_id" {
    type = map 
    default = {
         ami_id = "ami-08982f1c5bf93d976"
         ami_idaws = "ami-0360c520857e3138f"
            #key = value 
    } 
    
}



variable "this_keyname" {
    type = string
    default = "tf"

}

variable "this_tags" {
    type = string
    default = "webserver"
}


variable "this_count" {
    type =  number
    default = 2
}

variable "this_availability_zone" {
   type = string
   default = "us-west-2b"
}

variable "this_b64" {
   type = bool
   default = true
}



variable "this_any" {
    type = any 
    default = {
        this_keyname = "b28-key" 
        count = 1
        api_termination_ec2 = false
        api_stop_ec2 = false 
        ami_ec2 = "ami-05ee755be0cd7555c" 
        instance_type_list = ["t2.micro" , "t3.small" , "t3.large"]
        tags_map = {
           purposeec2 = "webserver" 
           name = "webserver"
        }

 }

}