resource "aws_vpc" "Varma-VPC" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
        Name = "Varma-VPC"
    }
}

resource "aws_internet_gateway" "Varma-IGW" {
    vpc_id = "${aws_vpc.Varma-VPC.id}"
    tags {
        Name = "Varma-IGW"
    }
}

resource "aws_eip" "Varma-EIP" {
  vpc      = true
  depends_on = ["aws_internet_gateway.Varma-IGW"]
}

resource "aws_security_group" "Varma-SG" {
    name = "vpc_nat"
    description = "Allow traffic to pass from the private subnet to the internet"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    vpc_id = "${aws_vpc.Varma-VPC.id}"

}

