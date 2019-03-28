resource "aws_instance" "PUBLIC-instance-1" {
    ami = "${var.ami}"
    availability_zone = "${var.azs-1}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    vpc_security_group_ids = ["${aws_security_group.Varma-SG.id}"]
    subnet_id = "${aws_subnet.Public_Subnet-1.id}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "Varma-PUBLIC-1"
    }
}
resource "aws_instance" "PUBLIC-instance-2" {
    ami = "${var.ami}"
    availability_zone = "${var.azs-2}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    vpc_security_group_ids = ["${aws_security_group.Varma-SG.id}"]
    subnet_id = "${aws_subnet.Public_Subnet-2.id}"
    associate_public_ip_address = true
    source_dest_check = false

    tags {
        Name = "Varma-PUBLIC-2"
    }
}

