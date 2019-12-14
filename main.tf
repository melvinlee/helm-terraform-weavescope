# Hack for module-to-module dependencies.
# https://github.com/hashicorp/terraform/issues/1178#issuecomment-449158607
# and
# https://github.com/hashicorp/terraform/issues/1178#issuecomment-473091030
# Make sure to add this null_resource.dependency_getter to the `depends_on`
# attribute to all resource(s) that will be constructed first within this
# module:
resource "null_resource" "dependency_getter" {
  triggers = {
    my_dependencies = "${join(",", var.dependencies)}"
  }
}

data "helm_repository" "helm_repo" {
  name = var.helm_repo.name
  url  = var.helm_repo.uri
}

resource "helm_release" "weavescope" {
  depends_on = [null_resource.dependency_getter]
  name       = var.helm_release_name
  chart      = "weave-scope"
  namespace  = var.helm_namespace
  version    = var.helm_chart_version
  values     = trimspace(var.values) == "" && var.values == null ? [] : [var.values]
  repository = data.helm_repository.helm_repo.metadata.0.name
}

resource "null_resource" "dependency_setter" {
  # Hack for module-to-module dependencies.
  # https://github.com/hashicorp/terraform/issues/1178#issuecomment-449158607
  # List resource(s) that will be constructed last within the module.
  depends_on = [
    "helm_release.weavescope"
  ]
}