data "aws_vpc" "main-vpc" {
    filter {
        name = "tag:Name"
        values = [var.vpc]
    }
}

data "aws_subnet" "private-eu-west-1a-subnet" {
    filter {
        name = "tag:Name"
        values = [var.private_subnet1]
    }
}

data "aws_subnet" "private-eu-west-1b-subnet" {
    filter {
        name = "tag:Name"
        values = [var.private_subnet2]
    }
}

data "aws_subnet" "public-eu-west-1a-subnet" {
    filter {
        name = "tag:Name"
        values = [var.public_subnet1]
    }
}

data "aws_subnet" "public-eu-west-1b-subnet" {
    filter {
        name = "tag:Name"
        values = [var.public_subnet2]
    }
}

