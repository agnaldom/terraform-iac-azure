resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  kubernetes_version  = "1.16.7"
  location            = azurerm_resource_group.aks_demo_rg.location
  resource_group_name = azurerm_resource_group.aks_demo_rg.name
  dns_prefix          = "exampleaks1"

  addon_profile {
    aci_connector_linux {
      enabled = true
    }

    azure_policy {
      enabled = true
    }

    http_application_routing {
      enabled = true
    }

    kube_dashboard {
      enabled = true
    }

    oms_agent {
      enabled = true
    }
  }

  default_node_pool {
    enable_auto_scaling   = true 
    #enabla_node_public_ip = true
    max_count             = 10 
    max_pods              = 20
    min_count             = 1
    name                  = "default"
    node_count            = 1
    os_disk_size_gb       = 100
    type                  = "VirtualMachineScaleSets"
    vm_size               = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  #role_based_access_control {
  #  enable = true
  #}

  service_principal {
    client_id     = "00000000-0000-0000-0000-000000000000"
    client_secret = "00000000000000000000000000000000"
  }

  tags = {
    Environment = "Development"
  }
}
