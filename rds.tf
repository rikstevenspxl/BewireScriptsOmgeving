resource "aws_db_subnet_group" "RDSGroup" {
  name       = "main"
  subnet_ids = ["${aws_subnet.rdsSubnet.id}", "${aws_subnet.rdsSubnet2.id}"]
//2 subnets in 2 andere availibility zones
  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "b-labs-database" {
    allocated_storage       =20
    identifier              ="b-labs-database"
    storage_type            ="gp2"
    engine                  ="mysql"
    engine_version          ="5.7"
    instance_class          ="db.t2.micro"
    name                    ="blabsdatabase"
    username                ="admin"
    password                ="pxl2019!"
    parameter_group_name    ="default.mysql5.7"
    vpc_security_group_ids  = ["${aws_security_group.RDSSecurityGroup.id}"]
    db_subnet_group_name    = "${aws_db_subnet_group.RDSGroup.id}"
    tags = {
      Name = "b-labs-database"
    }
}