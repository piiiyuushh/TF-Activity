resource "aws_instance" "db" {
  ami = "ami-0abc12345deadbeef"   
  instance_type = "t2.micro"
  associate_public_ip_address = true  
  tags = {
    Name = "database"
  }
  user_data = <<EOF
#!/bin/bash
echo "mysql_root_password=Welcome123!" > /etc/db_creds
EOF
}

resource "aws_instance" "app" {
  count = 1
  ami = "ami-0abc12345deadee"
  instance_type = "t3.medium"
  security_groups = [aws_security_group.open.id]
}
