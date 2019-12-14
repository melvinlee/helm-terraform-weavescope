
provider "helm" {
  version = "<= 0.10.4"

  kubernetes {
    config_path = "~/.kube/config"
  }

  service_account = "tiller"
  namespace       = "kube-system"
  install_tiller  = false
}

locals {
  namespace = "monitoring"
}

resource "kubernetes_namespace" "weavescope_namespace" {
  metadata {
    name = local.namespace
  }
}

module "weavescope" {
  source             = "../../"
  helm_release_name  = "weave-scope"
  helm_namespace     = local.namespace
  helm_chart_version = "1.1.8"
  dependencies       = ["kubernetes_namespace.weavescope_namespace"]
}

resource "null_resource" "helm_list" {
  depends_on = [module.weavescope.depended_on]

  provisioner "local-exec" {
    command = "helm list --namespace ${local.namespace}"
  }

}
