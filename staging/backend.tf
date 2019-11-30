terraform {
  backend "gcs" {
    bucket  = "cmp-core-staging"
    project = "cmp-core-staging"
  }
}
