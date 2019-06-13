resource "aws_instance" "staging" {
  ami = "ami-0f0fb38cd5492b1aa"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  security_groups = [
    "${aws_security_group.ec2-allow-all.name}"
  ]

    tags {
    Name = "staging-environment"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("./mallachite-lev.pem")}"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
  }
}

resource "aws_instance" "development" {
  ami = "ami-0f0fb38cd5492b1aa"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  security_groups = [
    "${aws_security_group.ec2-allow-all.name}"
  ]

    tags {
    Name = "development-environment"
  }

    connection {
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("./mallachite-lev.pem")}"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
  }
}


resource "aws_instance" "production" {
  ami = "ami-0f0fb38cd5492b1aa"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  security_groups = [
    "${aws_security_group.ec2-allow-all.name}"
  ]

      tags {
    Name = "production-environment"
  }

    connection {
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("./mallachite-lev.pem")}"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
  }
}