variable "hetzner_api_key" {
  description = "The Hetzner Cloud API Token"
  type        = string
}

# Hetzner locations
# https://docs.hetzner.com/cloud/general/locations#what-locations-are-there
variable "region" {
  type    = string
  default = "nbg1"
}

# Hetnzer Server types:
# https://docs.hetzner.com/cloud/servers/overview/#shared-vcpu
variable "server_type" {
  type    = string
  default = "cx22"
}

variable "operating_system" {
  type    = string
  default = "ubuntu-24.04"
}

variable "server_count" {
  type    = number
  default = 1
}

variable "clickhouse_password" {
  description = "Password for ClickHouse default user"
  type        = string
  sensitive   = true  # This marks the variable as sensitive in logs
}