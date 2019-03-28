/*
  Public Subnet-2
*/
resource "aws_subnet" "Public_Subnet-2" {
    vpc_id = "${aws_vpc.Varma-VPC.id}"
    map_public_ip_on_launch= "true"
    cidr_block = "${var.public_subnet_cidr-2}"
    availability_zone = "${var.azs-2}"
    tags {
        Name = "Varma-PUBLIC-2B"
    }
}

resource "aws_route_table_association" "Public-Route-2" {
    subnet_id = "${aws_subnet.Public_Subnet-2.id}"
    route_table_id = "${aws_route_table.Public-Route.id}"
}


