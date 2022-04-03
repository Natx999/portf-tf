resource "aws_subnet" "private-eu-west-1a-subnet" {
    vpc_id = aws_vpc.main-vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = var.az1

    tags = {
        "Name" = var.private_subnet1
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/todo" = "owned"
    }
}

resource "aws_subnet" "private-eu-west-1b-subnet" {
    vpc_id = aws_vpc.main-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = var.az2

    tags = {
        Name = var.private_subnet2
        "kubernetes.io/role/internal-elb" = "1"
        "kubernetes.io/cluster/todo" = "owned"
    }
}

resource "aws_subnet" "public-eu-west-1a-subnet" {
    vpc_id = aws_vpc.main-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = var.az1
    map_public_ip_on_launch = true

    tags = {
        Name = var.public_subnet1
        "kubernetes.io/role/elb" = "1"
        "kubernetes.io/cluster/todo" = "owned"
    }
}

resource "aws_subnet" "public-eu-west-1b-subnet" {
    vpc_id = aws_vpc.main-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = var.az2
    map_public_ip_on_launch = true

    tags = {
        Name = var.public_subnet2
        "kubernetes.io/role/elb" = "1"
        "kubernetes.io/cluster/todo" = "owned"
    }
}