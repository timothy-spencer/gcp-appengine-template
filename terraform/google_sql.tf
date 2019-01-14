// Production/staging Postgres Database
resource "google_sql_database_instance" "rails-example-production" {
  name = "rails-production"
  database_version = "POSTGRES_9_6"
  region = "${var.region}"

  settings {
    tier = "db-f1-micro"
  }
}

resource "random_string" "postgres_password_production" {
  length  = 16
  special = true
}

resource "google_sql_user" "postgres-production" {
  name     = "postgres"
  password = "${random_string.postgres_password_production.result}"
  instance = "${google_sql_database_instance.rails-example-production.name}"
}

output "postgres_password_production" {
  value = "${random_string.postgres_password_production.result}"
  description = "Postgres production password"
}

output "postgres_username_production" {
  value = "${google_sql_user.postgres-production.name}"
  description = "Postgres production username"
}

output "postgres_instance_production" {
  value = "${google_sql_database_instance.rails-example-production.connection_name}"
  description = "Postgres production instance ID"
}


// Dev Postgres Database
resource "google_sql_database_instance" "rails-example-dev" {
  name = "rails-dev"
  database_version = "POSTGRES_9_6"
  region = "${var.region}"

  settings {
    tier = "db-f1-micro"
  }
}

resource "random_string" "postgres_password_dev" {
  length  = 16
  special = true
}

resource "google_sql_user" "postgres-dev" {
  name     = "postgres"
  password = "${random_string.postgres_password_dev.result}"
  instance = "${google_sql_database_instance.rails-example-dev.name}"
}

output "postgres_password_dev" {
  value = "${random_string.postgres_password_dev.result}"
  description = "Postgres dev password"
}

output "postgres_username_dev" {
  value = "${google_sql_user.postgres-dev.name}"
  description = "Postgres dev username"
}

output "postgres_instance_dev" {
  value = "${google_sql_database_instance.rails-example-dev.connection_name}"
  description = "Postgres dev instance ID"
}
