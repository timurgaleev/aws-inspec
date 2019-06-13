# Two-Tier example from https://github.com/terraform-providers/terraform-provider-aws

variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.

Example: ~/.ssh/terraform.pub
DESCRIPTION
  default     = "~/.ssh/id_rsa.pub"
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  default     = "Terraform"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-central-1"
}

variable "private_key_path" {
  description = "Path to SSH private key"
  default     = "~/.ssh/id_rsa"
}

# Ubuntu Precise 18.04 LTS (x64)
variable "aws_amis" {
  default = {
    eu-central-1 = "ami-090f10efc254eaf55"
  }
}
