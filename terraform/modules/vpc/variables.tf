variable "vpc_cidr"{
   type = string
   description = "subnet dla vpc"
   default = "10.0.0.0/16" 
}

variable "infra_env" {
    type = string
    description = "opis srodowiska"
    default = "test"
}

variable "env"{
    type = string
    description = "opis srodowiska"
    default = "test"
}

variable "cidr_public"{
    type = list(string)
    description = "subnet publiczny"
    default = ["10.0.10.0/24"]
}

variable "cidr_private"{
    type = list(string)
    description = "subnet prywatny"
    default = ["10.0.20.0/24"]
}


variable "az"{
    type = list(string)
    description = "zony"
}

