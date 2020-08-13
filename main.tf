provider "aws" {}

resource "aws_key_pair" "mongokey" {
  key_name   = "terrakey"
  public_key = "${file("terrakey.pub")}"
}

resource "aws_security_group" "mongodb" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "master" {
  ami = "ami-04932daa2567651e7"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.mongodb.id}"]
  key_name = "${aws_key_pair.mongokey.id}"
}

resource "aws_instance" "slave1" {
  ami = "ami-04932daa2567651e7"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.mongodb.id}"]
  key_name = "${aws_key_pair.mongokey.id}"
}

resource "aws_instance" "slave2" {
  ami = "ami-04932daa2567651e7"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.mongodb.id}"]
  key_name = "${aws_key_pair.mongokey.id}"
}

