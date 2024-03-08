resource "aws_s3_bucket" "main_bucket" {
  bucket = "device-firmware-updates-and-data-storage"

  tags = {
    Name = "device-firmware-updates-and-data-storage"
  }
}
