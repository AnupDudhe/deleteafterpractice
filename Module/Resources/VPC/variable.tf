variable "this_vpc_cidr_block" {
    type = string
    default = "12.11.0.0/16"
}
variable "this_vpc_tags" {
     type = string
     default = "this_vpc"
}
variable "this_subnet_pub_cidr_block" {
     type = string
     default = "12.11.0.0/17"
}

variable "this_subnet_pub_map_ip" {
    type = bool
    default = true
}
variable "this_subnet_pub_tags" {
    type = string
    default = "pub_subnet"
}