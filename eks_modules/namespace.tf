resource "kubernetes_namespace" "alb_namespace" {
  metadata {
    annotations = {
      name = "AWS ALB Ingress Controlle"
    }

    labels = {
      mylabel = "alb_ingress_controllere"
    }

    name = "alb-namespace"
  }
}