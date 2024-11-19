variable "this_vpc_cidr_block" {
    type = string
}
variable "this_vpc_tags" {
     type = string
}
variable "this_subnet_pub_cidr_block" {
     type = string
}

variable "this_subnet_pub_map_ip" {
    type = bool
}
variable "this_subnet_pub_tags" {
    type = string
}

variable "this_vpc_az" {
  type = string

}
