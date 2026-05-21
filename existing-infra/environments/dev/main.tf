module "ecr" {
  source = "../../modules/ecr"

  repository_name = "tf-frontend"
}

module "s3" {
  source = "../../modules/s3"

  environment = var.environment
}

module "rds" {
  source = "../../modules/rds"

  environment            = var.environment
  identifier             = "dev-rds"
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_name                = "appdb"
  username               = "appuser"
  password               = ""
  subnet_ids             = []
  vpc_security_group_ids = []
  tags = {
    Environment = var.environment
  }
}