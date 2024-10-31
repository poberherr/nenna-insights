terraform {
  required_version = ">= 0.12"
}

data "hcloud_network" "private_network" {
  name = "private-network"
}

data "template_file" "cloud_init" {
  template = file("${path.module}/cloudinit/base.yml.tftpl")
  
  vars = {
    clickhouse_password = var.clickhouse_password
  }
}

resource "hcloud_server" "clickhouse" {
  count       = var.server_count
  name        = "clickhouse-${count.index + 1}"
  server_type = var.server_type
  image       = var.operating_system
  location    = var.region
  keep_disk   = true
  labels = {
    "ssh"  = "yes",
    "http" = "yes"
  }

  user_data = data.template_file.cloud_init.rendered
  
  network {
    network_id = data.hcloud_network.private_network.id
  }

  depends_on = [data.hcloud_network.private_network]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}