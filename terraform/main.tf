provider "aws" {
  region = var.region
}

//kms key for encrypted buckets
resource "aws_kms_key" "jenkins_backup_key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}


//s3 bucket for backups
resource "aws_s3_bucket" "jenkins_backup" {
  bucket = "${var.project}-${var.app_env}-jenkins-backup"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.jenkins_backup_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
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
