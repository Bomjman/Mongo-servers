resource "digitalocean_ssh_key" "default" {
  name       = "dokey terraform"
  public_key = "${file("/Users/terraform/.ssh/id_rsa.pub")}"
}