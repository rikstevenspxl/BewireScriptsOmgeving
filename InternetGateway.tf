resource "aws_internet_gateway" "B-LabsGateway" {
  vpc_id = "${aws_vpc.B-LabsVPC.id}"

  tags = {
    Name = "B-LabsGateway"
  }
}