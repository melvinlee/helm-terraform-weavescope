
provider "helm" {
  version = "<= 0.10.4"
  
  kubernetes {
    config_path = "~/.kube/config"
  }

  service_account = "tiller"
  namespace       = "kube-system"
  install_tiller  = false
}

module "weavescope" {
    source = "../../"
    helm_release_name = "weave-scope"
    namespace = "monitoring"
    chart_version = "1.1.8"
}