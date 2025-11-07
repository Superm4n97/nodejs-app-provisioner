output "kubeconfig-cmd" {
    description = "Command to configure kubectl using awscli"
    value = "aws eks update-kubeconfig --name ${module.eks.cluster_id} --region ${var.aws_region}"
}


output "cluster_endpoint" {
    value = module.eks.cluster_endpoint
}


output "cluster_ca_certificate" {
    value = module.eks.cluster_security_group_id
}