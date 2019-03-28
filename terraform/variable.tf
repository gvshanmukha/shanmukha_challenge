variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}
variable "azs-1" {
    description = "Availability zone US-east-1a"
    default = "us-east-1a"
}
variable "azs-2" {
    description = "Availability zone US-east-1b"
    default = "us-east-1b"
}
variable "key_name" {
    description = "Name of the Pem Key"
    default = "win10"
}
variable "ami" {
    description = "Ami for the instances"
    default = "ami-0de53d8956e8dcf80"
}
variable "instance_type" {
    description = "type of instance"
    default = "t2.micro"
}
variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "172.16.0.0/16"
}
variable "public_subnet_cidr-1" {
    description = "CIDR for the us-east-1a Public Subnet"
    default = "172.16.0.0/24"
}
variable "public_subnet_cidr-2" {
    description = "CIDR for the us-east-1b Public Subnet"
    default = "172.16.1.0/24"
}

