resource "aws_key_pair" "tf_key_pair" {
  key_name           = "tf-key-pair"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "tf_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.tf_key_pair.key_name
  security_groups = [aws_security_group.tf_security_group.name]

  tags = {
    Name = "first-tf-instance"
  }
}

resource "aws_security_group" "tf_security_group" {
  name        = "tf-security-group"
  description = "Allow SSH inbound traffic"

  dynamic "ingress" {
    for_each = [22, 80, 443]
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
