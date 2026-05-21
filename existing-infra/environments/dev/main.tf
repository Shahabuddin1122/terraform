module "ecr" {
  source = "../../modules/ecr"

  repository_name = "tf-frontend"
}

module "s3" {
  source = "../../modules/s3"

  environment = var.environment
}