terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.81.0"
    }
  }
}

variable "sshkey" {
  description = "DigitalOcean SSH key name"
  default = ""
}

provider "digitalocean" {
  token = var.do_token
}

variable "do_token" {
  description = "DigitalOcean API token"
}

data "digitalocean_ssh_key" "terraform" {
  count = var.sshkey == "" ? 0: 1
  name  = var.sshkey
}
