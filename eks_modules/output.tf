
output "server_cluster_iam_role" {
  value = aws_iam_role.server-cluster.arn
}

output "server_node_iam_role" {
  value = aws_iam_role.server-cluster.arn
}

output "eks-cluster-role" {
  value = aws_iam_role.eks-cluster-role.arn
}


output "eks_server_sg" {
  value = aws_security_group.main_eksclustersg.id
}

output ca {
  value=aws_eks_cluster.main_ekscluster.certificate_authority[0].data
}

output endpoint {
  value=aws_eks_cluster.main_ekscluster.endpoint
}