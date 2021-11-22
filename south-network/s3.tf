
resource "aws_s3_bucket" "bucket" {
    bucket                      = "credentials-and-licences"
    hosted_zone_id              = "Z11KHD8FBVPUYU"
    request_payer               = "BucketOwner"
    tags                        = {
        "Creator"   = "nyasha@cloud-fundis"
        "Name"      = "credentials-and-licences"
        "CreatedBy" = "terraform"
        "Region"    = "Cape Town"
    }

    versioning {
        enabled    = false
        mfa_delete = false
    }

}


resource "aws_s3_bucket" "bucket1" {
    bucket                      = "icdl-za-backups"
    hosted_zone_id              = "Z11KHD8FBVPUYU"
    request_payer               = "BucketOwner"
    tags                        = {
        "Creator"   = "nyasha@cloud-fundis"
        "Name"      = "icdl-za-backups"
        "CreatedBy" = "terraform"
        "Region"    = "Cape Town"
    }

    versioning {
        enabled    = true
        mfa_delete = false
    }
}

resource "aws_s3_bucket" "bucket2" {
    bucket                      = "icdl-za-file-gateway"
    hosted_zone_id              = "Z11KHD8FBVPUYU"
    request_payer               = "BucketOwner"
    tags                        = {
        "Creator"   = "nyasha@cloud-fundis"
        "Name"      = "icdl-za-backups"
        "CreatedBy" = "terraform"
        "Region"    = "Cape Town"
    }

    versioning {
        enabled    = true
        mfa_delete = false
    }
}

