variable "rg_name"{
    type=string
    description="Resource Group Name"
    default = "myakscluster-rg"
}
variable "location"{
    type=string
    description= "aks location"
    default = "koreacentral"
}
variable "cluster_name"{
    type=string
    description= "AKS Cluter Name"
    default = "myakscluster"
}
variable "acr_name"{
    type= string
    description = "acr Name"
    default = ""
}

variable "node_rg_name" {
  type= string
  description= "AKS Cluster Node Resource Group Name"
  default = "myakscluster_node-rg"
}
variable "min_node_count"{
    type= number
    description= "min node Count"
    default = 3
}
variable "max_node_count"{
    type= number
    description= "max node Count"
    default = 10
}
variable "node_count"{
    type=number
    description= "default node Count"
    default = 3
}
variable "vm_size"{
    type=string
    description= "node VM Size"
    default = "Standard_B2ms"
}
variable "max_pods"{
    type = number
    description = "Max pods per node"
    default = 30
}
variable "sku_tier"{
    type=string
    description= "AKS SLA Type"
    default = "Free"
}

variable "dns_ip"{
    type= string
    description = "core dns IP"
    default = "10.250.0.10"
}
variable "service_cidr"{
    type= string
    description = "service CIDR"
    default = "10.250.0.0/24"
}
variable "docker_bridge_cidr"{
    type= string
    description = "docker bridge CIDR"
    default = "172.17.0.1/16"
}