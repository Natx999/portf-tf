resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.main-vpc.id

    route = [
        {
            cidr_block = var.rt_cidr
            nat_gateway_id = aws_nat_gateway.nat.id
            carrier_gateway_id = ""
            destination_prefix_list_id = ""
            egress_only_gateway_id = ""
            gateway_id = ""
            instance_id = ""
            ipv6_cidr_block = ""
            local_gateway_id = ""
            network_interface_id = ""
            transit_gateway_id = ""
            vpc_endpoint_id = ""
            vpc_peering_connection_id = ""
        },
    ]

    tags = {
        Name = var.private_rt
    }
}

resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.main-vpc.id

    route = [
        {
            cidr_block = var.rt_cidr
            gateway_id = aws_internet_gateway.igw.id
            nat_gateway_id = ""
            carrier_gateway_id = ""
            destination_prefix_list_id = ""
            egress_only_gateway_id = ""
            instance_id = ""
            ipv6_cidr_block = ""
            local_gateway_id = ""
            network_interface_id = ""
            transit_gateway_id = ""
            vpc_endpoint_id = ""
            vpc_peering_connection_id = ""
        },
    ]

    tags = {
        Name = var.public_rt
    }
}

resource "aws_route_table_association" "private-eu-west-1a" {
    subnet_id = aws_subnet.private-eu-west-1a-subnet.id
    route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private-eu-west-1b" {
    subnet_id = aws_subnet.private-eu-west-1b-subnet.id
    route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "public-eu-west-1a" {
    subnet_id = aws_subnet.public-eu-west-1a-subnet.id
    route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public-eu-west-1b" {
    subnet_id = aws_subnet.public-eu-west-1b-subnet.id
    route_table_id = aws_route_table.public-rt.id
}
