resource "google_compute_instance" "default" {
  name         = "test"
  project      = "core-rite-228614"
  machine_type = "n1-standard-1"
  zone         = "us-central1-c"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1404-lts"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}