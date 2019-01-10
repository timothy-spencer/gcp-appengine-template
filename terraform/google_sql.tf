// Postgres Database
resource "google_sql_database_instance" "gcp-pilot-sql-postgres" {
  name = "gcppilot-postgres-example"
  database_version = "POSTGRES_9_6"
  region = "${var.region}"

  settings {
    tier = "db-f1-micro"
  }
}

resource "random_string" "postgres_password" {
  length  = 16
  special = true
}

resource "google_sql_user" "postgres" {
  name     = "postgres"
  password = "${random_string.postgres_password.result}"
  instance = "${google_sql_database_instance.gcp-pilot-sql-postgres.name}"
}

output "postgres_password" {
  value = "${random_string.postgres_password.result}"
  description = "Postgres password"
}

output "postgres_username" {
  value = "${google_sql_user.name}"
  description = "Postgres password"
}
