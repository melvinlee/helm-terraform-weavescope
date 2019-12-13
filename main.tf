data "helm_repository" "helm_repo" {
  name = var.helm_repo_name
  url  = var.helm_repo_uri
}

resource "random_pet" "helm_release_name" {
  separator = "-"
  keepers = {
    helm_chart_name = var.helm_chart_name
  }
}

resource "kubernetes_namespace" "weavescope_namespace" {
  metadata {
    annotations = var.namespace_annotations
    labels      = var.namespace_labels
    name        = var.namespace
  }
}

resource "helm_release" "helm_charts" {
  disable_webhooks = true
  name             = trimspace(var.helm_release_name) == "" || var.helm_release_name == null ? random_pet.helm_release_name.id : trimspace(var.helm_release_name)
  chart            = var.helm_chart_name
  namespace        = kubernetes_namespace.weavescope_namespace.metadata.0.name
  values           = trimspace(var.values) == "" && var.values == null ? [] : [var.values]
  version          = var.chart_version
  repository       = data.helm_repository.helm_repo.metadata.0.name
}
