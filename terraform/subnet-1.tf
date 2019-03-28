/*
  Public  Subnet-1
*/
resource "aws_subnet" "Public_Subnet-1" {
    vpc_id = "${aws_vpc.Varma-VPC.id}"
    map_public_ip_on_launch= "true"
    cidr_block = "${var.public_subnet_cidr-1}"
    availability_zone = "${var.azs-1}"
    tags {
        Name = "Varma-PUBLIC-2A"
    }
}

resource "aws_route_table" "Public-Route" {
    vpc_id = "${aws_vpc.Varma-VPC.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.Varma-IGW.id}"
    }
}
resource "aws_nat_gateway" "Varma-NAT" {
    allocation_id = "${aws_eip.Varma-EIP.id}"
    subnet_id = "${aws_subnet.Public_Subnet-1.id}"
    depends_on = ["aws_internet_gateway.Varma-IGW"]
}
resource "aws_route_table_association" "Public-Route" {
    subnet_id = "${aws_subnet.Public_Subnet-1.id}"
    route_table_id = "${aws_route_table.Public-Route.id}"
}

