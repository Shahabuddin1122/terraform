resource "aws_instance" "tf_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "first-tf-instance"
  }
}