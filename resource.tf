resource "aws_instance" "web1" {
  ami = "ami-0b99c7725b9484f9e"
  instance = ""
  subnet_id = ""
  tags {
    "Name" = "Web1"
  }
}

resource "aws_vpc" "VPC1" {
  name = "VPC1"
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "sub1" {
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.0.0/25"
  vpc_id = "${aws_vpc.VPC1,id}"
}
