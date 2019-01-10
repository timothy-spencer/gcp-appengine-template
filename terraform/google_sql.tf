// MySQL Database
resource "google_sql_database_instance" "gcp-pilot-sql-mysql" {
  name = "gcppilot-mysql-example"
  database_version = "MYSQL_5_6"
  region = "${var.region}"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "mysql" {
  name      = "mysql"
  instance  = "${google_sql_database_instance.gcp-pilot-sql-mysql.name}"
}

resource "random_string" "mysql_password" {
  length  = 16
  special = true
}

variable "mysql_password" {
  type = "string"
  default = ""
}

resource "google_sql_user" "mysql" {
  name     = "mysql"
  password = "${var.mysql_password != "" ? var.mysql_password : random_string.mysql_password.result}"
  instance = "${google_sql_database_instance.gcp-pilot-sql-mysql.name}"
}

output "java_jdbc_connection_string" {
  value = "jdbc:mysql://google/${google_sql_user.mysql.name}?cloudSqlInstance=${google_sql_database_instance.gcp-pilot-sql-mysql.connection_name}&password=${google_sql_user.mysql.password}&useSSL=false"
}

