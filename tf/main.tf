terraform {
  backend "s3" {
    bucket = "kirbyjs-terraform-statefiles"
    key    = "digitalocean-server/prod.tf"
    region = "us-east-1"
  }
}

provider "digitalocean" {}

data "digitalocean_ssh_key" "github" {
  name = "github"
}

data "digitalocean_ssh_key" "macbook_pro" {
  name = "macbook-pro"
}
