
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
    values = <<EOF
# Where defaults exist, the values are set to them here.
# Values with no preferred or common defaults are set to empty strings.
global:
  # global.image: the image that will be used for this release
  image:
    repository: weaveworks/scope
    tag: 1.12.0
    # global.image.pullPolicy: must be Always, IfNotPresent, or Never
    pullPolicy: "IfNotPresent"
  # global.service.*: the configuration of the service used to access the frontend
  service:
    port: 80
    type: "LoadBalancer"
EOF
}