terraform {
  required_version = ">= 1.5.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  owner = var.github_owner
  token = var.github_token
}

resource "github_repository_collaborator" "theophile" {
  repository = var.repository_name
  username   = var.collaborator_username
  permission = var.collaborator_permission
}
