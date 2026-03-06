variable "vpc_cidr" { default = "172.2.0.0/16" }
variable "public_subnet_cidr" { default = "172.2.1.0/24" }
variable "private_subnet_cidr" { default = "172.2.2.0/24" }
variable "availability_zone" { default = "ap-southeast-3b" }
variable "env" { default = "pre-prod" }
