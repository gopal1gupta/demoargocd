
resource "azurerm_resource_group" "resource-grp" {
  name     = "cluster-rg"
  location = "Central India"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.resource-grp.location
  resource_group_name = azurerm_resource_group.resource-grp.name
  dns_prefix          = "exampleaks1"
  kubernetes_version = "1.25.6"


  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Testing"
  }
}

