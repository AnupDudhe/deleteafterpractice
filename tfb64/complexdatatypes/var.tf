variable "this_list" {
    default = ["t3.micro"]
                 #0         
}

variable "this_map" {
    default = {
      amiws = "ami-0b0b78dcacbab728f" ,
      keynamews = "default"

    }
}

variable "this_any" {
   default = {
      wscount = 2 #var.this_any.wscount 
      wsami = "ami-0c398cb65a93047f2" #var.this_any.wsami
      wsinstancetype = ["t3.micro" , "t3.medium" , "t3.small"]
      amiws = {
         ami1ws = "ami-0c398cb65a93047f2" ,
         ami2ws = "ami-0c398cb65a93047f3"
      }
      wscountlist = [1 , 2 , 3]
      wskeymaps = {
        kp1 = "ohiokey"
        kp2 = "vpc"
      }
   }
      

}