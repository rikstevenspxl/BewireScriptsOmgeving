resource "aws_security_group" "NATSecurityGroup" {
    name        = "NATSecurityGroup"
    description = "SecurityGroup NAT-server"
    vpc_id      = "${aws_vpc.B-LabsVPC.id}"

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/16"]
    }
      ingress {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    ingress {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/16"]
    }

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["94.143.189.241/32"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "NATSecurityGroup"
    }
}
resource "aws_security_group" "AcceptatieSecurityGroup" {
    name        = "AcceptEnvSecurityGroup"
    description = "SecurityGroup Acceptatie-env"
    vpc_id      = "${aws_vpc.B-LabsVPC.id}"

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/16"]
    }
    ingress {
        from_port       = 9000
        to_port         = 9000
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/16"] //sonarqube
    }
      ingress {
        from_port       = 8080
        to_port         = 8080
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/16"] //dockerport
    }
    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/16"] //ssh from nat
    }

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["10.0.1.0/24"] //ssh from jenkins
    }
    ingress {
        from_port       = 8079
        to_port         = 8079
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/16"] //not really sure
    }

    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "AcceptatieSecurityGroup"
    }
}
resource "aws_security_group" "JenkinsSecurityGroup" {
    name        = "JenkinsSecurityGroup"
    description = "SecurityGroup Jenkins Server"
    vpc_id      = "${aws_vpc.B-LabsVPC.id}"

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["193.190.154.174/32"]
    }
    ingress {
        from_port       = 8080
        to_port         = 8080
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/24"] 
    }
    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/16"] //ssh from nat
    }

    ingress {
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        cidr_blocks     = ["193.190.154.174/32"]
    }
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "JenkinsSecurityGroup"
    }
}
resource "aws_security_group" "SonarQubeSecurityGroup" {
    name        = "SonarQubeSecurityGroup"
    description = "SecurityGroup SonarQube"
    vpc_id      = "${aws_vpc.B-LabsVPC.id}"

    ingress {
        from_port       = 9000
        to_port         = 9000
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.181/32"]
    }
    ingress {
        from_port       = 9000
        to_port         = 9000
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"] 
    }
    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.181/32"] //ssh from nat
    }
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "SonarQubeSecurityGroup"
    }
}
resource "aws_security_group" "RDSSecurityGroup" {
    name        = "RDSSecurityGroup"
    description = "SecurityGroup Relation Database"
    vpc_id      = "${aws_vpc.B-LabsVPC.id}"

    ingress {
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        cidr_blocks     = ["10.0.2.6/32"]//SonarQube
    }
    ingress {
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        cidr_blocks     = ["10.0.3.183/32"]//Accept-env 
    }
    ingress {
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        cidr_blocks     = ["10.0.1.0/24"] //Jenkins
    }
    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags = {
        Name = "RDSSecurityGroup"
    }
}