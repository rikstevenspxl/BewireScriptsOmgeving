resource "aws_network_acl" "main" {
  vpc_id = "${aws_vpc.B-LabsVPC.id}"

  egress {
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    protocol   ="-1"
  }

  ingress {
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    protocol   ="-1"
  }

  tags = {
    Name = "main"
  }
}