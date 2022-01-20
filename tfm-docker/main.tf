
/*terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

#provider "docker" {}

resource "null_resource" "dockervol" {
  provisioner "local-exec" {
    command = "echo ${docker_container.nodered_container.name} >> containers.txt"
  }
  provisioner "local-exec" {
    command = "rm -f containers.txt"
    when = destroy
  }
}

resource "docker_image" "nodered_image" {
  name = "nodered/node-red"
}

resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}


resource "docker_container" "nodered_container" {
  name  = join("-", ["nodered", random_string.random.result])
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    external = 1880
  }
}
*/
  