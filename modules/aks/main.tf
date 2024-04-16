resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.region
  dns_prefix          = var.name
  default_node_pool {
    name                = var.node_pool_name
    node_count          = var.node_count
    enable_auto_scaling = false
    min_count           = null
    max_count           = null
    vm_size             = var.vm_size
    os_disk_size_gb     = var.disk_size_gb
    vnet_subnet_id      = var.vnet_subnet_id
  }
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "extra_pool" {
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  name                  = var.extra_node_pool_name
  node_count            = var.node_count
  vm_size               = var.extra_vm_size
  vnet_subnet_id        = var.vnet_subnet_id
  os_disk_size_gb       = var.disk_size_gb
  enable_auto_scaling   = false
  min_count             = null
  max_count             = null
  enable_node_public_ip = false

  tags = {
    SkipGPUDriverInstall = true
  }

  lifecycle {
    ignore_changes = [
      node_count
    ]
  }
}
