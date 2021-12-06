data "aws_region" "current" {}

data "aws_eks_cluster" "cluster" {
  name = aws_eks_cluster.main_ekscluster.name
}

data "aws_eks_cluster_auth" "cluster_auth" {
  name = local.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster_auth.token
}

