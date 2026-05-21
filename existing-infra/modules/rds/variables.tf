variable "environment" {
	description = "Deployment environment (dev/staging/prod)"
	type        = string
}

variable "identifier" {
	description = "DB instance identifier"
	type        = string
}

variable "engine" {
	description = "Database engine (postgres, mysql, etc.)"
	type        = string
	default     = "postgres"
}

variable "engine_version" {
	description = "Engine version (optional)"
	type        = string
	default     = ""
}

variable "instance_class" {
	description = "RDS instance class"
	type        = string
	default     = "db.t3.micro"
}

variable "allocated_storage" {
	description = "Storage in GB"
	type        = number
	default     = 20
}

variable "db_name" {
	description = "Initial database name"
	type        = string
	default     = "appdb"
}

variable "username" {
	description = "Master DB username"
	type        = string
	default     = "appuser"
}

variable "password" {
	description = "Master DB password. If empty a random password will be generated"
	type        = string
	default     = ""
	sensitive   = true
}

variable "subnet_ids" {
	description = "List of subnet IDs for a DB subnet group (optional)"
	type        = list(string)
	default     = []
}

variable "subnet_group_name" {
	description = "Optional name for the DB subnet group"
	type        = string
	default     = ""
}

variable "vpc_security_group_ids" {
	description = "Security group IDs to attach to the RDS instance"
	type        = list(string)
	default     = []
}

variable "parameter_group_name" {
	description = "Optional DB parameter group name"
	type        = string
	default     = ""
}

variable "option_group_name" {
	description = "Optional option group name"
	type        = string
	default     = ""
}

variable "backup_retention_period" {
	description = "Number of days to retain backups"
	type        = number
	default     = 7
}

variable "skip_final_snapshot" {
	description = "Whether to skip final snapshot on destroy"
	type        = bool
	default     = true
}

variable "publicly_accessible" {
	description = "Whether the DB should be publicly accessible"
	type        = bool
	default     = false
}

variable "prevent_destroy" {
	description = "Prevent destroy lifecycle setting"
	type        = bool
	default     = false
}

variable "create_read_replica" {
	description = "Create a read replica of the primary DB"
	type        = bool
	default     = false
}

variable "read_replica_instance_class" {
	description = "Instance class for read replica"
	type        = string
	default     = "db.t3.micro"
}

variable "tags" {
	description = "Additional tags to apply to resources"
	type        = map(string)
	default     = {}
}

