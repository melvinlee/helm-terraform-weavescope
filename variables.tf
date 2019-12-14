variable "helm_release_name" {
  description = "(Required) Specify the release name."
  type        = string
}

variable "helm_namespace" {
  description = "(Optional) Specify the namespace where the chart gets deployed. Defaults to weavescope."
  type        = string
  default     = "weavescope"
}

variable "helm_chart_version" {
  description = "(Required) Specify the chart version."
  type        = string
}

variable "values" {
  description = "(Optional) Specify the helm overribe values files."
  type        = string
  default     = ""
}

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

variable "dependencies" {
  description = "(Optional) module-to-module dependencies."
  type        = list
  default     = []
}
