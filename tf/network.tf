resource "digitalocean_domain" "kirbyjs" {
  name = "kirbyjs.com"
}

resource "digitalocean_floating_ip" "kirbyjs_web" {
  droplet_id = digitalocean_droplet.kirbyjs_web.id
  region     = digitalocean_droplet.kirbyjs_web.region
}

resource "digitalocean_record" "root" {
  domain = digitalocean_domain.kirbyjs.name
  type   = "A"
  name   = "@"
  value  = digitalocean_floating_ip.kirbyjs_web.ip_address
}

resource "digitalocean_record" "www" {
  domain = digitalocean_domain.kirbyjs.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
}
