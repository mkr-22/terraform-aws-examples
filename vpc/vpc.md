#   VPC

##  Details
This example created the following AWS Resources in a respective order
1.  Creates an AWS `VPC` `vpc-example`
2.  Iterates and creates `public` and `private subnets` as defined in `private_subnet_map` and `public_subnet_map` map variable
3.  Creates `Internet Gateway` and Associates with VPC created
4.  `Route Table` creation and assoication for Private and Public Subnets with Public Route Table containing connection from CIDR `0.0.0.0/0` to route through `Internet Gateway`
