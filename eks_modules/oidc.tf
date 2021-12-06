## OIDC Provider
data "tls_certificate" "cluster" {
  url = aws_eks_cluster.main_ekscluster.identity.0.oidc.0.issuer
}
resource "aws_iam_openid_connect_provider" "cluster" {
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.cluster.certificates.0.sha1_fingerprint]
  url = aws_eks_cluster.main_ekscluster.identity.0.oidc.0.issuer
}

resource "aws_eks_addon" "vpc_cni" {
 cluster_name     = var.cluster_name
 addon_name = "vpc-cni"

depends_on = [
    aws_eks_cluster.main_ekscluster,
    aws_eks_node_group.node_group,
    ]
}



/*
data "aws_iam_policy_document" "cluster_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.cluster.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:kube-system:aws-node"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.cluster.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "cluster" {
  assume_role_policy = data.aws_iam_policy_document.cluster_assume_role_policy.json
  name               = "cluster"
}

*/