resource "aws_iam_role" "todo" {
    name = "todo-eks-cluster"

    assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "todo-AmazonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.todo.name
}

resource "aws_eks_cluster" "todo" {
    name = "todo"
    role_arn = aws_iam_role.todo.arn

    vpc_config {
        subnet_ids = [
            data.aws_subnet.private-eu-west-1a-subnet.id,
            data.aws_subnet.private-eu-west-1b-subnet.id,
            data.aws_subnet.public-eu-west-1a-subnet.id,
            data.aws_subnet.public-eu-west-1b-subnet.id
        ]
    }

    depends_on = [aws_iam_role_policy_attachment.todo-AmazonEKSClusterPolicy]
}
