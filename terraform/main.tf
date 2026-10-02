# Ficiber Analytics - infraestructura (extracto) - laboratorio academico

terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

provider "aws" {
  region = "eu-west-1"
}

# Cluster EKS de produccion
resource "aws_eks_cluster" "ficiber_prod" {
  name     = "ficiber-prod-eks"
  version  = "1.27"
  role_arn = "arn:aws:iam::000000000000:role/ficiber-eks-role"

  vpc_config {
    subnet_ids = ["subnet-aaa111", "subnet-bbb222"]
  }
}

# Zona DNS
variable "domain" {
  default = "ficiber.com"
}

variable "internal_hosts" {
  default = [
    "db.internal.ficiber.com",
    "cache.internal.ficiber.com",
    "vault.internal.ficiber.com",
  ]
}
