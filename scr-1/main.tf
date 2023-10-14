module "ec2" {
  source = "./EC-01"
  for_each = var.inst
  ami=each.value.ami
  instance_name=each.value.instance_name
  instance_type = each.value.instance_type
  subnet_id = module.rakesh_vpc.subnet_id
  owner = each.key
}
module "rakesh_vpc" {
  source = "./VPC-01"
  azs=var.Availability
  private_subnet_cidrs=var.private_subnet_cidr
  tags = var.tags
}