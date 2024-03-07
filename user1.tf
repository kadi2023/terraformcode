resource "aws_lightsail_instance" "centos_instance" {
  name              = "centos-instance"
  availability_zone = "us-east-1a"  
  blueprint_id      = "centos_7_1901_01"
  bundle_id         = "nano_2_0"
  user_data = <<-EOF
    sudo yum update -y 
    sudo yum install unzip wget httpd -y  ( apt install wget unzip -y )
    sudo wget https://github.com/utrains/static-resume/archive/refs/heads/main.zip
    sudo unzip main.zip
    #sudo rm -rf /var/www/html/*
    sudo cp -r static-resume-main/* /var/www/html/  
    sudo systemctl start httpd
    sudo systemctl enable httpd 
    EOF
}