resource "aws_instance" "web1" {
  ami = "ami-0b99c7725b9484f9e"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.pub_sub1.id}"
  tags = {
    "Name" = "Webserver1"
  }
}

resource "aws_vpc" "VPC1" {
  tags = {"Name"  = "VPC1"}
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "pub_sub1" {
  availability_zone = "ap-south-1a"
  cidr_block = "10.0.0.0/25"
  vpc_id = "${aws_vpc.VPC1.id}"
}

resource "aws_subnet" "pvt_sub1" {
	availability_zone = "ap-south-1b"
	cidr_block = "10.0.0.64/26"
	vpc_id = "${aws_vpc.VPC1.id}"
}