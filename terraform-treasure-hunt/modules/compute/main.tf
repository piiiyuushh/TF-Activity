resource "aws_instance" "db" {
  ami                         = var.db_ami
  instance_type               = var.db_instance_type
  associate_public_ip_address = var.db_public_ip
  tags = {
    Name = "database"
  }
  user_data = <<EOF
#!/bin/bash
echo "mysql_root_password=Welcome123!" > /etc/db_creds
EOF
}

resource "aws_instance" "app" {
  count           = var.app_instance_count
  ami             = var.app_ami
  instance_type   = var.app_instance_type
  security_groups = [var.open_sg_id]
}
