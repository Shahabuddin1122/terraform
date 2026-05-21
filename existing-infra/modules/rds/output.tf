output "id" {
	description = "RDS instance id"
	value       = aws_db_instance.this.id
}

output "address" {
	description = "RDS instance address (hostname)"
	value       = aws_db_instance.this.address
}

output "endpoint" {
	description = "RDS endpoint with port"
	value       = aws_db_instance.this.endpoint
}

output "username" {
	description = "Master username for the DB"
	value       = aws_db_instance.this.username
}
