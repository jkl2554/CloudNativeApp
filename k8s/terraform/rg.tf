resource "azurerm_resource_group" "aks_cluster_rg"{
  name = var.rg_name
  location = var.location
}