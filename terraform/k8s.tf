resource "kubernetes_namespace" "mytestspace" {
  metadata {
    # name = "k8s-ns-by-tf"
    name = var.resourcenamemeta
  }
}

resource "kubernetes_deployment" "mytestspace" {
  metadata {
    name = var.resourcenamemetadeployment
    labels = {
      test = "MyExampleApp"
    }
    namespace = "k8s-ns-by-tf"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        test = "MyExampleApp"
      }
    }
    template {
      metadata {
        labels = {
          test = "MyExampleApp"
        }
      }
      spec {
        container {
          image = {{$built_Docker_image}}
          name = "example"
        }
      }
    }
  }
}
