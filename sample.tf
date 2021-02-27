provider "aws" {
  region = "us-east-1"
  access_key = "AKIAVU42KAVTHB6RJIS2"
  secret_key = "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"
}

data "aws_ami" "amazon-linux-2" {
 most_recent = true


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
  ami = "${data.aws_ami.amazon-linux-2.id}"
  associate_public_ip_address = true
  instance_type = "t2.micro"
  key_name = "tf-test"
  tags = {
      Name = "test"
  }
}