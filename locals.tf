locals {
  sufix = "${var.tags.project}-${var.tags.env}-${var.tags.region}"

}
resource "random_string" "sufijo-s3" {
  length  = 8
  special = false
  upper   = false

}

locals {
  sufix-s3 = "$var.tags.project-$random_string.sufijo-s3.id"
}