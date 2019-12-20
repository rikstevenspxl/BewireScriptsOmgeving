resource "aws_subnet" "rdsSubnet" {
  vpc_id            = "${aws_vpc.B-LabsVPC.id}"
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "rdsSubnet"
  }
}
resource "aws_subnet" "rdsSubnet2" {
  vpc_id            = "${aws_vpc.B-LabsVPC.id}"
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name  = "rdsSubnet2"
  }
}
resource "aws_subnet" "SonarQubeSubnet" {
  vpc_id            = "${aws_vpc.B-LabsVPC.id}"
  cidr_block        = "10.0.5.0/24"
  tags = {
    Name = "SonarQubeSubnet"
  }
}
resource "aws_subnet" "PublicSubnet" {
  vpc_id            = "${aws_vpc.B-LabsVPC.id}"
  cidr_block        = "10.0.0.0/24"
  tags = {
    Name = "Public Subnet"
  }
}
resource "aws_subnet" "AcceptatieSubnet" {
  vpc_id            = "${aws_vpc.B-LabsVPC.id}"
  cidr_block        = "10.0.3.0/24"
  tags = {
    Name = "Acceptatie Subnet"
  }
}
resource "aws_subnet" "JenkinsSubnet" {
  vpc_id            = "${aws_vpc.B-LabsVPC.id}"
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "Jenkins Subnet"
  }
}