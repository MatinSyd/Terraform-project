# Creating Security Group 
resource "aws_security_group" "tf-sg" { 
 vpc_id = "vpc-0e971a2c2041b0474" 
# Inbound Rules 
# HTTP access from anywhere 
ingress { 
 from_port = 80 
 to_port = 80 
 protocol = "tcp" 
 cidr_blocks = ["0.0.0.0/0"] 
} 
# HTTPS access from anywhere 
ingress { 
 from_port = 443 
 to_port = 443 
 protocol = "tcp" 
 cidr_blocks = ["0.0.0.0/0"] 
} 
# SSH access from anywhere 
ingress { 
 from_port = 22 
 to_port = 22 
 protocol = "tcp" 
 cidr_blocks = ["0.0.0.0/0"] 
} 
# Outbound Rules 
# Internet access to anywhere 
egress { 
 from_port = 0 
 to_port = 0 
 protocol = "-1" 
 cidr_blocks = ["0.0.0.0/0"] 
} 
tags = { 
 Name = "tf-sg" 
} 
}
