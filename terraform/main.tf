provider "aws" {
  region = var.region
}

//s3 bucket for backups
resource "aws_s3_bucket" "jenkins_backup" {
  bucket = "${var.project}-${var.app_env}-jenkins-backup"
}

module "jenkins" {
  source = "github.com/GSA/sectools-terraform-jenkins.git"
  subnet_private_id     = var.subnet_private_id
  vpc_id                = var.vpc_id
  instance_type         = var.instance_type
  instance_name         = var.instance_name
  aws_key_name          = var.aws_key_name
  ami_id                = var.ami_id
  jump_host_cidr_list   = var.jump_host_cidr_list
  app_env               = var.app_env
  project               = var.project
  ecr_arn               = var.ecr_arn
}
