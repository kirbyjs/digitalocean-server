resource "digitalocean_droplet" "kirbyjs_web" {
  name       = "kirbyjs-web"
  image      = "ubuntu-18-04-x64"
  ipv6       = true
  monitoring = true
  region     = "nyc1"
  size       = "s-1vcpu-1gb"
  user_data  = data.template_file.user_data.rendered

  ssh_keys = [
    data.digitalocean_ssh_key.circleci.id,
    data.digitalocean_ssh_key.macbook_pro.id
  ]
}

data "template_file" "user_data" {
  filename = file("${path.cwd}/resources/user-data.sh")
}
