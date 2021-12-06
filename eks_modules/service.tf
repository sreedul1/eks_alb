resource "kubernetes_service" "alb_service" {
   
  depends_on = [kubernetes_deployment.alb-ingress]

  metadata {
    name = "nodeport-service"
  }
  spec {
    selector = {
      "app.kubernetes.io/name"       = "aws-alb-ingress-controller"
    }
    session_affinity = "ClientIP"
    port {
      port        = 10254
      target_port = 10254
    }

    type = "NodePort"
  }
}

