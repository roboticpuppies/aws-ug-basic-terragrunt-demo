variable "vpc_cidr" { default = "172.1.0.0/16" }
variable "public_subnet_cidr" { default = "172.1.1.0/24" }
variable "private_subnet_cidr" { default = "172.1.2.0/24" }
variable "availability_zone" { default = "ap-southeast-3a" }
variable "env" { default = "prod" }
