variable "vpc_tag" {
    type = string
    default = "main-vpc"
}

variable "region" {
    type = string
    default = "eu-west-1"
}

variable "cluster" {
    type = string
    default = "todo"
}


variable "az1" {
    type = string
    default = "eu-west-1a"
}

variable "az2" {
    type = string
    default = "eu-west-1b"
}

variable "subnet_cidr" {
    type = string
    default = "10.0.0.0/19"
}

variable "rt_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "private_subnet1" {
    type = string
    default = "private-eu-west-1a-subnet"
}

variable "private_subnet2" {
    type = string
    default = "private-eu-west-1b-subnet"
}

variable "public_subnet1" {
    type = string
    default = "public-eu-west-1a-subnet"
}

variable "public_subnet2" {
    type = string
    default = "public-eu-west-1b-subnet"
}

variable "private_rt" {
    type = string
    default = "private-rt"
}

variable "public_rt" {
    type = string
    default = "public-rt"
}