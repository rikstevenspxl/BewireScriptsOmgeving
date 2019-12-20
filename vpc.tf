resource "aws_vpc" "B-labsVPC" {
    cidr_block              = ${var.vpc["cidr_block"]}"

    tags = {
         Name       = "${var.vpc["name"]}"
    }
}