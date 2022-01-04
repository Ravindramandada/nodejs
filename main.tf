# ------------------------------------------------------------------------------
# Resources
# ------------------------------------------------------------------------------

provider "aws" {
  region = var.region
}

resource "aws_ecr_repository" "ecr_repo" {
  name = var.name_prefix

  image_tag_mutability = var.image_tag_mutability ? "MUTABLE" : "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = var.enable_scan_on_push
  }

  tags = var.tags
}
