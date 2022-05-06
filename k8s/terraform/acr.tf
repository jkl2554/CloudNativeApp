
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.aks_cluster_rg.name
  location            = azurerm_resource_group.aks_cluster_rg.location
   sku                 = "Basic"
}

resource "azurerm_role_assignment" "acrpull" {
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}