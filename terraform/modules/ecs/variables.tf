variable "app_name" {
   type = string
}

variable "lb_subnet_public" {
   type = list(string)
}


variable "lb_subnet_private" {
   type = list(string)
}


variable "lb_vpc" {
   type = string 
}

variable "aws_region" {
  type = string
  default = "eu-central-1"
}

variable "repo_url" {
   type = string
}

variable "aws_lb_listener" {
   type = string
}


variable "target_group" {
   type = string
}

variable "container_memory" {
   type = number
}


variable "container_cpu" {
   type = number
}

variable "aws_lb_sec_group" {
   type = string
}