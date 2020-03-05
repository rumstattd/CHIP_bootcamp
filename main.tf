

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "deployer" {
  key_name   = "rumstattd-d2"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHvMHx/bVcHPMeuppRYDYoocJB0AfuxPbEbEppd4OF2Tj2zS/kl2qwvDLvqTAXa3GDOitZymBz7DqKrSasp/9olHKkvRBSQELnC6Xev7qNqvQE1QS4KrKIQdL3bsfiNHTUtmVVkuj+ZQF0Gr+XmFL9pxsdWVjACtFzyh/WGee23ADNJN6QUB3eDNETLM7oHN2S7Hj+pGbiP8i21OeKoIQu4bz3KQrwL5C2hAqG8HO/R2mSJxgtisfiWO0GxhU+IZqbXBel2e4zWHsxUbe+PvY33PH9KgvmgzzVr/yNynp/MCKvsX1bKZyero1nsP4hNcS7sOft80i0V0AGQVHcwaY9 rumstattd@mac-rumstattd.local"
}

resource "aws_instance" "tfe" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.small"
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "RickUmstattd TFE"
  }
}
