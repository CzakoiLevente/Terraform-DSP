variable "access_key-aws" {}
variable "secret_key-aws" {}
variable "region-aws" {}
variable "dev-ssh" {}


provider "aws" {
  access_key = "${var.access_key-aws}"
  secret_key = "${var.secret_key-aws}"
  region     = "${var.region-aws}"
}

resource "aws_security_group" "ec2-allow-ssh" {
  name = "ec2-allow-ssh"

  ingress {
    from_port = 22
    to_port   = 22

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

resource "aws_instance" "securing" {
  ami           = "ami-656be372"
  instance_type = "t2.micro"

  tags {
    Name = "mallac-lev-securing_ec2_instance"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = "${file("./mallachite-lev.pem")}"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = ".script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
  }

  connection {
    type     = "ssh"
    user     = "developer"
    password = "dev-ssh"
  }
}
