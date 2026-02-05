module "ec2" {
  source = "/home/anup/deleteafterpractice/terraformb32/Module/main/EC2"
  webserver_ami = "ami-0b6c6ebed2801a5cb"
  webserver_instance_type = "t3.micro"
  webserver_keyname = "ubuntu"
  webserver_disable_api_termination = false
  webserver_sg = module.vpc.webserversg
  webserver_subnetA = module.vpc.subnet_id


} 

module "vpc" {
  source =  "/home/anup/deleteafterpractice/terraformb32/Module/main/VPC"
  vpc_cidr = "172.30.0.0/16"
  vpc_subnetA = "172.30.128.0/20"
  public_ip = true
  az = "us-east-1a"

}