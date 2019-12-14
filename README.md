# Deploying Weavescope with Helm chart

Reference the module to a specific version (recommended):

```sh
module "aks" {
    source = "git://github.com/melvinlee/helm-terraform-weavescope.git?ref=v0.1"

    helm_release_name  = var.helm_release_name
    helm_namespace     = var.helm_namespace
    helm_chart_version = var.helm_chart_version
    ...
}
```

Or get the latest version

```sh
source = "git://github.com/melvinlee/helm-terraform-weavescope.git?ref=latest"
```

## Parameters

### helm_release_name

```sh
variable "helm_release_name" {
  description = "(Required) Specify the release name."
  type        = string
}
```

### helm_namespace

```sh
variable "helm_namespace" {
  description = "(Optional) Specify the namespace where the chart gets deployed. Defaults to weavescope."
  type        = string
  default     = "weavescope"
}
```

### helm_chart_version

```sh
variable "helm_chart_version" {
  description = "(Required) Specify the chart version."
  type        = string
}
```

### values

```sh
variable "values" {
  description = "(Optional) Specify the helm overribe values files."
  type        = string
  default     = ""
}
```

### helm_repo

```sh
variable "helm_repo" {
  description = "(Optional) Specify the helm repository name. If not specifed, default to stable repository."
  type = object({
    name = string
    uri  = string
  })
  default = {
    name = "stable"
    uri  = "https://kubernetes-charts.storage.googleapis.com/"
  }
}
```

### dependencies

```sh
variable "dependencies" {
  description = "(Optional) module-to-module dependencies."
  type        = list
  default     = []
}
```

# Contribute

Pull requests are welcome to evolve this module and integrate new features.
