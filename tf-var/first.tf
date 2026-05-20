variable name {
    description = "The name of the person to greet"
    type        = string
}

variable age {
    description = "The age of the person to greet"
    type        = number
}

output "greeting" {
    value = "Hello, ${var.name}! You are ${var.age} years old."
}