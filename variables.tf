#1st Change made

variable "vms_locations" {

  type = map(string)
  default = {
    "vm1" = "eastus"
    "vm2" = "westus"
  }

}

