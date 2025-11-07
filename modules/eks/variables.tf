variable "aws_region" {
    description = "AWS region"
    default = "us-east-1"
}


variable "cluster_name" {
    description = "EKS cluster name"
    default = "nodejs-eks-cluster"
}


variable "node_group_desired" {
    type = number
    default = 2
}


variable "public_key_path" {
    description = "Path to SSH public key for node access (optional)"
    type = string
    default = ""
}


variable "vpc_cidr" {
    default = "10.0.0.0/16"
}