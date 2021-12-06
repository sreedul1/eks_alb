
module "eks_deployment" {

  source          = "../eks_modules/"
  env             = "kong"
  cluster_name    = "eks_kong_cluster-1"
  cluster_version = "1.21"
  eks_vpc_id      = "vpc-00c578283e0f21a73"
  eks_subnet_ids  = ["subnet-05d165b54c1676f44","subnet-01dc25fcf3c3eb09c","subnet-05b48afa9834cab61"]
  instance_types  = ["t3.micro"]
  ssh_key         = "test_eks"
  tags            = { Name = "Kong_Dev_eks_cluster" }
  desired_size    = 3
  max_size        = 5
  min_size        = 3
  aws_region_name = "ap-south-1"
  k8s_namespace   = "kube-system"

}
