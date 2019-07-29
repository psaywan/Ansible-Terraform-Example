# This is to ensure SSH comes up before we run the local exec.


  provisioner "remote-exec" { 
    inline = ["echo 'Hello World'"]

    connection {
      type = "ssh"
      host = "${aws_instance.web.*.public_ip}"
      user = "${var.ssh_user}"
      private_key = "${var.ssh_key}"
      timeout = "90s"
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i '${aws_instance.web.*.public_ip},' --private-key ${var.ssh_key} ../home/pranay/Terraform-Jenkins-flow-repo/apache.yml"
  }
