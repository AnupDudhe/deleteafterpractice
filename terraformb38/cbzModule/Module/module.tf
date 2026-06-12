module "EC2" {
  source = "/home/anup/deleteafterpractice/terraformb38/cbzModule/Resource/EC2/"            
  this_key_name = "ohiophk" 
  this_ami = "ami-0eab37cfdc33e8e65" 
  This_instance_type = "t3.micro"
  #This_vpc_security_group_ids = "sg-0efc868be83f601ce" 
  this_count = 1 
  this_disable_api_termination = false
  this_subnetid = module.VPC.subnet_id
}

module "VPC" {
    source = "/home/anup/deleteafterpractice/terraformb38/cbzModule/Resource/VPC/"
    thisvpc_cidr = "172.30.0.0/16"
    cbz_subneta = "172.30.0.0/20"
}