variable "app_name" {
   type = string
}

variable "lb_subnet_public" {
   type = list(string)
}

variable "lb_vpc" {
   type = string 
}