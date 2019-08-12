rds = [
{
  rds_name = "helloworld"
  vpc_tag_name = "RDS"
  subnet-tag-service = "rds"
  allocated_storage = 20
  storage_type = "gp2"
  engine = "postgres"
  engine_version = "10.6"
  instance_class = "db.t2.micro"
  username = "hello"
  password = "epam_hello"
  storage_encrypted = false
  multi_az = false
},
{
  rds_name = "helloworld2"
  vpc_tag_name = "RDS"
  subnet-tag-service = "rds"
  allocated_storage = 20
  storage_type = "gp2"
  engine = "postgres"
  engine_version = "10.6"
  instance_class = "db.t2.micro"
  username = "hello"
  password = "epam_hello"
  storage_encrypted = false
  multi_az = true
}
]
