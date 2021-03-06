provider "google" {
  version     = "~> 3.0"
  credentials = file(var.credentials)
  region      = var.region
  project     = var.project
}

provider "google-beta" {
  version     = "~> 3.0"
  credentials = file(var.credentials)

  region  = var.region
  project = var.project
}

provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}
