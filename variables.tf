variable "helm_release_name" {
    description = "(Optional) Specify the release name"
    default = null
}

variable "helm_chart_name" {
    default = "weave-scope"
    description = "(Optional) Specify the Helm Chart Name. Defaults to weave-scope helm charts name"
}

variable "namespace" {
    description = "(optional) Specify the namespace where the chart gets deployed. Defaults to weavescope"
    default = "weavescope"
}

variable "namespace_annotations" {
    description = "(optional) Specify the namespace where the chart gets deployed."
    type = map(string) 
    default = null
}

variable "namespace_labels" {
    description = "(optional) Specify the namespace where the chart gets deployed."
    default = null
    type = map(string) 
}

variable "values" {
    description = "(optional) Specify the helm overribe values files."
    default = ""
}

variable "chart_version" {
    description = "(Optional) Specify the chart version"
    default = null
}

variable "helm_repo_name"{
    type = string
    default = "stable"
    description = "(Optional) Specify the helm repository name. If not specifed, default to stable repository"
}

variable "helm_repo_uri"{
    type = string
    default = "https://kubernetes-charts.storage.googleapis.com/"
    description = "(Optional) Specify the helm repository url. If not specifed, default to stable repository"
}