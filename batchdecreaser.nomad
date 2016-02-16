job "batchdecreaser" {
  region = "global"
  datacenters = ["nomad-intro"]

  type = "batch"

  periodic {
    cron = "*/1 * * * * *"
    prohibit_overlap = true
  }

  group "batch" {
    count = 3

    task "dec" {
      driver = "exec"
      config {
        command = "curl"
        args = ["10.7.0.21:8080/counter?type=decr"]
      }

      resources {
        cpu = 100
        memory = 32
        network {
          mbits = 100
        }
      }
    }
  }
}
