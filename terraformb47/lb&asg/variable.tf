variable this_dp {
   type = bool
   default = false

} 

variable this_sg {
   type = string 
   default = "sg-0b1e8061bdcc3b242" 
}


variable this_lbtype {
    type = list
    default = ["application" , "network" , "gateway"]   
}


variable internal {
    type = map
     
    default = {
        key  = false
    }
}

variable this_name {
    type = string 
    default = "test-lb-tf"
}


