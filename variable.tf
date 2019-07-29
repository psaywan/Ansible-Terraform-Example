####

variable "ssh_key" {
  description = "Path to your ssh key on the local system."
  default     = "~/.ssh/id_rsa"
}
variable "key_name" {
  description = "Private key name to use with instance"
  default     = "terraform"
}

variable "instance_type" {
  description = "AWS instance type"
  default     = "t2.micro"
}

variable "ami" {
  description = "Base AMI to launch the instances"

  # Bitnami NGINX AMI
  default = "ami-021acbdb89706aa89"
}

variable "ssh_user" {
  description = "SSH user name to connect to your instance."
  default     = "bitnami"
}
