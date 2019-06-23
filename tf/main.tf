data "terraform_remote_state" "default" {
  backend = "s3"
  config = {
    bucket = "kirbyjs-terraform-statefiles"
    key    = "portfolio/backend-service/prod.tf"
    region = "us-east-1"
  }
}

provider "digitalocean" {}

data "digitalocean_ssh_key" "circleci" {
  name = "circleci"
}

data "digitalocean_ssh_key" "macbook_pro" {
  name = "macbook-pro"
}
