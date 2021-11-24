/*
resource "docker_image" "ubuntu" {
    name = "ubuntu:latest"
}

resource "docker_container" "ubuntu" {
  name    = "ubuntu"
  image   = docker_image.ubuntu.latest

  /*ports {
    external = 
    internal =
  }
}*/