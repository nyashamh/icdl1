module "south-network" {
  source = "./south-network"
  #region = af-south-1
}

module "south-instance" {
  source = "./south-instance"
  #region = af-south-1
}

module "north-network" {
  source = "./north-network"
  #region = eu-west-1
  providers = {
    aws = aws.north
  }

}

module "north-instance" {
  source = "./north-instance"
  #region = eu-west-1
  providers = {
    aws = aws.north
  }

}