provider "aws" {
      region = "us-east-1"
      profile = "configs"
      shared_credentials_files = ["/home/anup/.aws/credentials"]
    
}

resource "aws_instance" "example" {
   instance_type = var.this_list[0]
    ami = var.this_map.amiws
    key_name = var.this_any.wskeymaps.kp1
   vpc_security_group_ids = [ "sg-0aecda28a625e1a5d" ]
   count = var.this_any.wscountlist[0]
}
