terraform {
  backend "gcs" {
    bucket  = "falabella-terraform-admin"
    project = "second-atom-252020"
  }
}
