region = "eu-central-1"

vpc = {
  name = "B-LabsVPC"
  cidr_block = "10.0.0.0/16"
}

subnets = [
  {
    name = "rdsSubnet2"
    az   = "eu-central-1"
    cidr = "10.0.5.0/24"
  },
  {
    name = "rdsSubnet"
    az   = "eu-central-1"
    cidr = "10.0.4.0/24"
  },
  {
    name = "SonarQubeSubnet"
    az   = "eu-central-1"
    cidr = "10.0.5.0/24"
  },
  {
    name = "Public Subnet"
    az   = "eu-central-1"
    cidr = "10.0.0.0/24"
  },
  {
    name = "Acceptatie Subnet"
    az   = "eu-central-1"
    cidr = "10.0.3.0/24"
  },
  {
    name = "Jenkins Subnet"
    az   = "eu-central-1"
    cidr = "10.0.1.0/24"
  }
]

ami_NAT = {
 # id   =  "ami-0ac019f4fcb7cb7e6" # Ubuntu 18.04, 
 # user = ubuntu
  id   = "ami-0096226d67aacb877" # RHEL, login: ec2-user 
  user = "ec2-user"
}
ami_Jenkins = {
 # id   =  "ami-0ac019f4fcb7cb7e6" # Ubuntu 18.04, 
 # user = ubuntu
  id   = "ami-07b31a3e78d92b86f" # RHEL, login: ec2-user 
  user = "ubuntu"
}
ami_SonarQube = {
 # id   =  "ami-0ac019f4fcb7cb7e6" # Ubuntu 18.04, 
 # user = ubuntu
  id   = "ami-0521cf7ac0f772fd6" # RHEL, login: ec2-user 
  user = "ec2-user"
}
ami_Accept_env = {
 # id   =  "ami-0ac019f4fcb7cb7e6" # Ubuntu 18.04, 
 # user = ubuntu
  id   = "ami-0dec9f251cff504ea" # RHEL, login: ec2-user 
  user = "ec2-user"
}

NAT_server = {
  name          = "NAT_server", 
  instance_type = "t2.micro",
  private_ip    = "10.0.0.181"
}

Acceptatie_server = {
  name          = "Acceptatie_server", 
  instance_type = "t2.micro",
  private_ip    = "10.0.3.183"
}
server_three = {
    name            = "Jenkins_server",
    instance_type   = "t2.micro",
    private_ip      = "10.0.1.57"
}
server_four = {
    name            = "SonarQube_server",
    instance_type   = "t2.micro",
    private_ip      = "10.0.5.6"
}