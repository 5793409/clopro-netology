

resource "yandex_kms_symmetric_key" "s3_bucket_key" {
  name              = var.kms_key_name
  default_algorithm = var.kms_key_algorithm
  rotation_period   = var.kms_key_expiration
}

resource "yandex_storage_bucket" "image_bucket" {
  bucket = var.bucket_config.name
  acl    = var.bucket_config.access_level

  default_storage_class = var.bucket_config.storage_class
  max_size              = var.bucket_config.max_bucket_size

  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       kms_master_key_id = yandex_kms_symmetric_key.s3_bucket_key.id
  #       sse_algorithm     = var.sse_algorithm
  #     }
  #   }
  # }

}

resource "yandex_storage_object" "image_object" {
  bucket = yandex_storage_bucket.image_bucket.bucket
  key    = var.bucket_config.uploaded_name
  source = var.bucket_config.image_path

}

