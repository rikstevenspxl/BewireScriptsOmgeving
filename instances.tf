provider "aws" {
    region = "${var.region}"
}
resource "aws_key_pair" "ssh_nat"{
    key_name = "${var.ssh_nat}"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfhD9NXtPDyoxRrBIENGpvKHHXRnKaPMf+4mAJZym3OStwlhd7yyldENSrg0/m4/QolaM7sLBYIqa82KOObQAJ5JYiV1uHeRcjO4ry1e46SYwGlCPVb41RfVKNi/6gDucjJ0mlto1HC6UxWcWYANeuDK4AKIl8TC4zOUaf/RVWB9xz2j/j6mkalMVA0bXjB9cTfRHHOVnq6ar4JKVK/YEDm0o3ZkE6haKVmve2tMfkpGJtE+rrRDWjiHbp+jZwkkV3510ANMv4wkbf/lPtrMQWObhKX3di9GDJLPsCL8DOGgHhREwJ+p5v15bemnuP+gHcJoc9k5OnA+XYQaiF+Ilt vagrant@CloudAutomation"
}
resource "aws_key_pair" "ssh_b-labs-accept-env-key"{
    key_name = "${var.ssh_b-labs-accept-env-key}"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVWhbK5M06B/Vq8KsGYiMafsT7S1qdbE4/HxY7TS26G7lCmN0WLzOWmInD0/Swy3tHxi9roOrDvQR883S0Dns5O4TfCVJykyRmw3+ZgrJIZW+XrHKuQsZnS7mrPq5vkUCP31U1orC5Z6ZKHmUt84zCyyDkZKsd4hPIxNPY9lMZbNhBwU17gxnNGiTcMAmrLd7yc5kF03bp6Y6qGdUBvCZZO9ch91Rnp+j24whby8n983EIxxGFfTYbgvGdYhXqxjwQtuekFhdfcwPRSYsBJRKOHe4jPoe+DIF7pXilN+A10vvwLPF9PRoLurQpZryIa8G7aApxb33Opg2as5jIcu9l vagrant@CloudAutomation"
}
resource "aws_key_pair" "ssh_jenkinsServer"{
    key_name = "${var.ssh_jenkinsServer}"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1VBs041qEEUeCcGDijEvRmDEeWqn7H4dfIBm7ktNF1ZWXJrB2Z3kaWoqHewPYaeXc05jysN8WC/bziutiH96Z6GVmqE0Q+H7LlEV7LO3rhZlS0+4rgg9Lgrc0N+Oz2NCepodux+TTpbnzhUBkdeInMTtMqCpH56KkPhhuMSEBcbBunvmLZ7C5+rgMT2zXwr/c24UEGv1YisY+Z7nL3htJkMXjnEkqkfZJPeT3MXJIDC5y8SvlBe6tQ6KQ4PC5DW6nVGO4T774cZHeYqhxhYPNM6bs+4ksHl2Vf8bsH+sK1MycHICqeoxN7oZstsP9S/UDP7Otct6XNLaeocMNjtTl vagrant@CloudAutomation"
}
resource "aws_key_pair" "ssh_SonarQubeKey"{
    key_name = "${var.ssh_SonarQubeKey}"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwG4GIECHgYz0/RTs6AOGHkUIgauiADecnFNRHdfkOXLyQ3ms3x937/OKUNaJUdboWV1+JlW33hZiXxAn/I7TgW1Q3GhX9wvLvxwUwxA6BmzSMtYWM2OULptwgL3QU4x0SB7+aeka2fQzmL4Be61APYk+FdpBMTNggWIqMQCw7GD176xQa6C4mNNNxhLmkZkGs5QApexy5T2EsasqEWQwi30bcxKRWDLv616hHFhFfhgrHbaV/URyxgFS5FvJRRWjsKrv5j7N17u1pscSgnW1egL+n0u+pro9wVCPMHv+N8OEem1kr5A3cx0N+p1GfAx6y341jUMQtiDfOWoVqm59T vagrant@CloudAutomation"
}
//Proxyserver instance
resource "aws_instance" "NAT" {
    ami                     = "${var.ami["id"]}"
    instance_type           = "t2.micro"
    key_name                ="${var.ssh_nat}"
    subnet_id               ="${aws_subnet.PublicSubnet.id}"
    vpc_security_group_ids  =["${aws_security_group.NATSecurityGroup.id}"]
    associate_public_ip_address = true
    private_ip              ="${var.NAT_server["private_ip"]}"

    root_block_device {
          volume_type       ="gp2"
          volume_size       = 8
          delete_on_termination=true
    }
    tags = {
        Name = "B-LabsNAT"
    }
}
//Acceptatie instance
resource "aws_instance" "AcceptEnv" {
    ami                     = "${var.ami["id"]}"
    instance_type           = "t2.micro"
    key_name                ="${var.ssh_b-labs-accept-env-key}"
    subnet_id               ="${aws_subnet.AcceptatieSubnet.id}"
    vpc_security_group_ids  =["${aws_security_group.AcceptatieSecurityGroup.id}"]
    associate_public_ip_address = false
    private_ip              ="${var.Acceptatie_server["private_ip"]}"

    root_block_device {
          volume_type       ="gp2"
          volume_size       = 8
          delete_on_termination=true
    }
    tags = {
        Name = "B-labsAccept-Env"
    }
}
//Jenkins Server
resource "aws_instance" "JenkinsServer" {
    ami                     = "${var.ami["id"]}"
    instance_type           = "t2.medium"
    key_name                ="${var.ssh_jenkinsServer}"
    subnet_id               ="${aws_subnet.JenkinsSubnet.id}"
    vpc_security_group_ids  = ["${aws_security_group.JenkinsSecurityGroup.id}"]
    associate_public_ip_address = false
    private_ip              ="${var.Jenkins_server["private_ip"]}"

    root_block_device {
          volume_type       ="gp2"
          volume_size       = 30
          delete_on_termination=true
    }
    tags = {
        Name = "B-labsJenkinsServer"
    }
}
//SonarQube Server
resource "aws_instance" "SonarQube" {
    ami                     = "${var.ami["id"]}"
    instance_type           = "t2.small"
    key_name                ="${var.ssh_SonarQubeKey}"
    subnet_id               ="${aws_subnet.SonarQubeSubnet.id}"
    vpc_security_group_ids  =["${aws_security_group.SonarQubeSecurityGroup.id}"]
    associate_public_ip_address = false
    private_ip              ="${var.SonarQube_server["private_ip"]}"

    root_block_device {
          volume_type       ="gp2"
          volume_size       = 30
          delete_on_termination=true
    }
    tags = {
        Name = "B-labsSonarQube"
    }
}