output "app_service_name" {
  value = "${module.pass.app_service_name}"
}

output "app_service_default_hostname" {
  value = "https://${module.pass.app_service_default_hostname}"
}

/*output "database_server" {
  value = "${module.pass.database_server}"
}

output "database_name" {
  value = "${module.pass.database_name}"
}

output "database_port" {
  value = "${module.pass.database_port}"
}*/
