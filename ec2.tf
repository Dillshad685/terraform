resource "aws_instance" "terraform" {
    ami = "ami-0055977a6e828a4f4"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all.id] 
    tags = {
        Name = "terraform"
        Terraform = "true"
    }
}

resource "aws_security_group" "allow-all"{
    name = "allow-all"

egress {
    from_port   = 0 #from port 0 to port 0 all ports
    to_port     = 0
    protocol    = "-1" #-1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] #internet
}

tags = {
    Name = "allow-all"
}

}