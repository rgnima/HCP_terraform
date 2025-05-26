module "s3" {
  source  = "app.terraform.io/rgnima-cloud-org/s3/aws"
  version = "0.0.1"
  # insert required variables here
  project_name = "asob"
  env = "cert"
  nrandom = 4
}
