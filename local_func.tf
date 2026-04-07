locals {
  default = {
    team         = "security-team"
    creaion_date = formatdate("DD MM YYYY hh:mm:ss", timestamp())
  }
}