# Appending Terraform state to be stored in AWS-S3
terraform {
  backend "s3" {
    bucket = "terraform-bucket-pranays"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}


# Using AWS as Terraform provider
provider "aws" {
  region = "us-east-1"
}

# Create Security Group for EC2-Instance
resource "aws_security_group" "default" {
  name = "terraform-default-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# Create EC2 instance
resource "aws_instance" "web" {
  ami                    = "${var.ami}"
  key_name               = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  source_dest_check      = false
  instance_type          = "${var.instance_type}"
  


# This is to ensure SSH comes up before we run the local exec.
 
  
  provisioner "remote-exec" { 
    inline = ["echo 'Hello World'"]

    connection {
      type = "ssh"
      host = "${aws_instance.web.public_ip}"
      user = "${var.ssh_user}"
      private_key = "${var.ssh_key}"
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i '${aws_instance.web.public_ip},' --private-key ${var.ssh_key} ../home/pranay/Terraform-Jenkins-flow-repo/apache.yml"
  }
}
