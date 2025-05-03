locals {
  cloud_init_configs = {
    vm1 = file("${path.module}/cloud-init.yml")
    vm2 = file("${path.module}/cloud-init.yml")
    vm3 = file("${path.module}/cloud-init.yml")
    vm4 = file("${path.module}/cloud-init.yml")
    vm5 = file("${path.module}/cloud-init.yml")
  }
}