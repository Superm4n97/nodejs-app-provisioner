# minimal IAM roles & policies for EKS cluster
resource "aws_iam_role" "eks_cluster_role" {
    name = "eks-cluster-role-${var.cluster_name}"
    assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
}


data "aws_iam_policy_document" "eks_assume_role" {
    statement {
        actions = ["sts:AssumeRole"]
        principals {
            type = "Service"
            identifiers = ["eks.amazonaws.com"]
        }
    }
}


resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
    role = aws_iam_role.eks_cluster_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}


# Node group role
resource "aws_iam_role" "eks_node_role" {
    name = "eks-node-role-${var.cluster_name}"
    assume_role_policy = data.aws_iam_policy_document.node_assume_role.json
}


data "aws_iam_policy_document" "node_assume_role" {
    statement {
        actions = ["sts:AssumeRole"]
        principals {
            type = "Service"
            identifiers = ["ec2.amazonaws.com"]
        }
    }
}


resource "aws_iam_role_policy_attachment" "node_policy_ec2" {
    role = aws_iam_role.eks_node_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}


resource "aws_iam_role_policy_attachment" "node_policy_cni" {
    role = aws_iam_role.eks_node_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}


resource "aws_iam_role_policy_attachment" "node_policy_registry" {
    role = aws_iam_role.eks_node_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}