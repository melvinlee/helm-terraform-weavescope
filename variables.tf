variable "helm_release_name" {
  description = "(Optional) Specify the release name"
  type        = string
  default     = null
}

variable "helm_chart_name" {
  description = "(Optional) Specify the Helm Chart Name. Defaults to weave-scope helm charts name"
  type        = string
  default     = "weave-scope"
}

variable "namespace" {
  description = "(optional) Specify the namespace where the chart gets deployed. Defaults to weavescope"
  type        = string
  default     = "weavescope"
}

variable "namespace_annotations" {
  description = "(optional) Specify the namespace where the chart gets deployed."
  type        = map(string)
  default     = null
}

variable "namespace_labels" {
  description = "(optional) Specify the namespace where the chart gets deployed."
  type        = map(string)
  default     = null
}

variable "values" {
  description = "(optional) Specify the helm overribe values files."
  type        = string
  default     = ""
}

variable "chart_version" {
  description = "(Optional) Specify the chart version"
  type        = string
  default     = null
}

variable "helm_repo" {
  description = "(Optional) Specify the helm repository name. If not specifed, default to stable repository"
  type = object({
    name = string
    uri  = string
  })
  default = {
    name = "stable"
    uri  = "https://kubernetes-charts.storage.googleapis.com/"
  }
}
