
variable "region" {
  description = "Region to provision the resources into."
  type = "string"
  default = "eu-central-1"
}
variable "vpc" {
  type = "map"
}

variable "subnets" {
  type = "list"
}

variable "ami_NAT" {
  type = "map"
}
variable "ami_Jenkins" {
  type = "map"
}
variable "ami_SonarQube" {
  type = "map"
}
variable "ami_Accept_env" {
  type = "map"
}

variable "NAT_server" {
  type = "map"
}

variable "Acceptatie_server" {
  type = "map"
}
variable "Jenkins_server" {
    type = "map"
}
variable "SonarQube_server" {
  type = "map"
}
variable "AcceptatieSecurityGroup" {
    description = "The name used for the security group of the ec2 with The acceptation environment"
    default = "AcceptatieSecurityGroup"
}
variable "JenkinsSecurityGroup" {
    description = "the name used for the security group of the ec2 with the Jenkinsserver"
    default = "JenkinsSecurityGroup"
}
variable "SonarQubeSecurityGroup" {
    description = "the name used for the security group of the ec2 with SonarQube running on it"
    default = "SonarQubeSecurityGroup"
}
variable "RDSSecurityGroup" {
    description = "the name used for the security group of the RDS"
    default = "RDSSecurityGroup"
}
variable "ssh_nat" {
    default = "ssh_nat"
}
variable "ssh_b-labs-accept-env-key" {
    default = "ssh_b-labs-accept-env-key"
}
variable "ssh_jenkinsServer" {
    default = "ssh_jenkinsServer"
}
variable "ssh_SonarQubeKey" {
    default = "ssh_SonarQubeKey"
}