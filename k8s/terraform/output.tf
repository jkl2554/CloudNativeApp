resource "local_file" "kubeconfig" {
    content     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
    filename = "${path.root}/kubeconfig"
}
output "Resource_Group_Name"{
    value = azurerm_resource_group.aks_cluster_rg.name
}
output "aks_cluster_Name"{
    value = azurerm_kubernetes_cluster.aks_cluster.name
}
output "acr_Name"{
    value = azurerm_container_registry.acr.name
}
output "kubeconfig_dir"{
    value = local_file.kubeconfig.filename
}