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
  tags = {
      Environment = "dev",
  }
}

resource "time_sleep" "wait_time" {
  depends_on = [ aws_instance.test ]
  create_duration = "2m"
}
