variable "resource_group" {
  type    = string
  default = "SOMOS_SSK"
}

variable "azure_region" {
  default = "East US"
}

variable "vnet_name" {
  type = string
  default = "vnet-somos-us"
}

variable "address_space" {
  type    = list
  default = ["172.26.92.0/23"] #,"172.26.94.0/23","172.26.88.0/22"]
}

variable "address_prefix" {
  type    = string
  default = "172.26.92.128/25"
}

variable "subnet_name" {
  type    = string
  default = "somo-subnet-eks"
}

variable "somos_public_ip_name" {
  type    = string
  default = "somos-ip-aks-api-dev-v2"
}

variable "cluster_name" {
  type    = string
  default = "skcluster_dev"
}

variable "dns_name" {
  type    = string
  default = "somo-eks"
}

variable "kubernetes_version" {
  type    = string
  default = "1.16.7"
}

variable "agent_pools" {
  default = [
    {
      name            = "pool1"
      count           = 3
      vm_size         = "Standard_D1_v2"
      os_type         = "linux"
      os_disk_size_gb = "30"
    }
  ]
}
