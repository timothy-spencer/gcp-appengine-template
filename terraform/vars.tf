variable "region" {
  type = "string"
  default = "us-east1"
}

variable "project_id" {
  type = "string"
}

resource "random_string" "rails_secret" {
  length  = 128
  special = false
}

output "rails_secret" {
  value = "${random_string.rails_secret.result}"
  description = "Rails secret string"
}
