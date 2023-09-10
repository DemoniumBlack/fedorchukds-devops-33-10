output "internal_ip_address_manager_yandex_cloud" {
  value = ["${yandex_compute_instance.manager.*.network_interface.0.ip_address}"]
}

output "external_ip_address_manager_yandex_cloud" {
  value = ["${yandex_compute_instance.manager.*.network_interface.0.nat_ip_address}"]
}
output "internal_ip_address_agent_yandex_cloud" {
  value = ["${yandex_compute_instance.agent.*.network_interface.0.ip_address}"]
}

output "external_ip_address_agent_yandex_cloud" {
  value = ["${yandex_compute_instance.agent.*.network_interface.0.nat_ip_address}"]
}
