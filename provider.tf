provider "azurerm" {
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  features {}
}

provider "kubernetes" {
  host                   = module.aks.kube_config.host
  client_certificate     = module.aks.kube_config.client_certificate
  client_key             = module.aks.kube_config.client_key
  cluster_ca_certificate = module.aks.kube_config.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = module.aks.kube_config.host
    client_certificate     = module.aks.kube_config.client_certificate
    client_key             = module.aks.kube_config.client_key
    cluster_ca_certificate = module.aks.kube_config.cluster_ca_certificate
  }
}
