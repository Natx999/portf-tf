resource "helm_release" "argo-cd" {
    name       = "argo"
    repository = "https://argoproj.github.io/argo-helm"
    chart      = "argo-cd"

    values = [
        file("${path.module}/argo-values.yaml")
    ]
}

