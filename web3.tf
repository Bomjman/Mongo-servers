resource "digitalocean_droplet" "web3" {
  image = "ubuntu-16-04-x64"
  name = "web3"
  region = "ams3"
  size = "512mb"
   private_networking = true
  ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]

  connection {
    user = "root"
    type = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout = "2m"
  }
}
