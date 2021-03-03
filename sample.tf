provider "aws" {
  region = "us-east-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

data "aws_ami" "amazon-linux-2" {
 most_recent = true
 owners = [ "amazon" ]


 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }
}

resource "aws_instance" "test" {
  ami = "ami-0b1eccece9c5c5768"
  associate_public_ip_address = true
  instance_type = "t2.medium"
  key_name = "tf-test"
  vpc_security_group_ids = [ "aws_security_group.ansi.id" ]
  tags = {
      Environment = "dev"
      Name = "test"
  }
}

resource "aws_security_group" "ansi" {
  name = "ansi"
  description = "Sg for ansible"
  vpc_id = "vpc-08040ada704ce9276"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "time_sleep" "wait_time" {
  depends_on = [ aws_instance.test ]
  create_duration = "4m"
}
