job "simplecounter" {
  region = "global"
  datacenters = ["nomad-intro"]

  # Rolling updates
  update {
    stagger = "10s"
    max_parallel = 5
  }

  group "web" {
    count = 3

    constraint {
      distinct_hosts = true
    }

    task "counter" {
      driver = "docker"
      config {
        image = "stigkj/counter"
        port_map {
          http = 80
        }
      }
      service {
        name = "counter"
        port = "http"
        check {
          type = "http"
          path = "/"
          interval = "10s"
          timeout = "2s"
        }
      }
      env {
        POSTGRES_URL = "postgres://postgres@postgres.service.consul/postgres"
      }
      resources {
        cpu = 100
        memory = 32
        network {
          mbits = 100
          port "http" {
            static = 8080
          }
        }
      }
    }
  }

  group "db" {
    count = 1

    task "pgsql" {
      driver = "docker"
      config {
        image = "kiasaki/alpine-postgres"
        port_map {
          pg = 5432
        }
      }
      service {
        name = "postgres"
        port = "pg"
      }
      resources {
        cpu = 100
        memory = 32
        network {
          mbits = 100
          port "pg" {
            static = 5432
          }
        }
      }
    }
  }
}
