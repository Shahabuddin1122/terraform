resource "random_password" "rds" {
	length               = 16
	special              = true
}

resource "aws_db_subnet_group" "rds" {
	count       = length(var.subnet_ids) > 0 ? 1 : 0
	name        = var.subnet_group_name != "" ? var.subnet_group_name : "rds-subnet-group-${var.environment}"
	subnet_ids  = var.subnet_ids
	description = "Managed by Terraform: subnet group for ${var.environment} RDS"
}

resource "aws_db_instance" "this" {
	identifier               = var.identifier
	allocated_storage       = var.allocated_storage
	engine                  = var.engine
	engine_version          = var.engine_version
	instance_class          = var.instance_class
	db_name                    = var.db_name
	username                = var.username
	password                = var.password != "" ? var.password : random_password.rds.result
	parameter_group_name    = var.parameter_group_name
	option_group_name       = var.option_group_name
	backup_retention_period = var.backup_retention_period
	skip_final_snapshot     = var.skip_final_snapshot
	publicly_accessible     = var.publicly_accessible
	vpc_security_group_ids  = var.vpc_security_group_ids
	db_subnet_group_name    = length(var.subnet_ids) > 0 ? aws_db_subnet_group.rds[0].name : null

	tags = merge({
		Name        = var.identifier
		Environment = var.environment
	}, var.tags)
}

resource "aws_db_instance" "read_replica" {
	count               = var.create_read_replica ? 1 : 0
	replicate_source_db = aws_db_instance.this.id
	instance_class      = var.read_replica_instance_class
	publicly_accessible = var.publicly_accessible
}

