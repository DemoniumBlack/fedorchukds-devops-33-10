resource "yandex_compute_instance" "manager" {
  count                     = 3
  name                      = format("manager-%02d", count.index +1)
  zone                      = "ru-central1-a"
  hostname                  = format("manager-%02d", count.index +1)
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu22}"
      type        = "network-hdd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.default.id}"
    nat       = true
  }

  metadata = {
    ssh-keys = "cloud-user:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_compute_instance" "agent" {
  count                     = 3
  name                      = format("agent-%02d", count.index +1)
  zone                      = "ru-central1-a"
  hostname                  = format("agent-%02d", count.index +1)
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu22}"
      type        = "network-hdd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.default.id}"
    nat       = true
  }

  metadata = {
    ssh-keys = "cloud-user:${file("~/.ssh/id_rsa.pub")}"
  }
}