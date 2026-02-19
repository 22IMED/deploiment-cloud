variable "github_owner" {
  description = "GitHub owner (user/org) du dépôt"
  type        = string
}

variable "github_token" {
  description = "Token GitHub avec droits repo"
  type        = string
  sensitive   = true
}

variable "repository_name" {
  description = "Nom du repository GitHub"
  type        = string
}

variable "collaborator_username" {
  description = "Nom d'utilisateur GitHub du collaborateur"
  type        = string
  default     = "theophilegarin"
}

variable "collaborator_permission" {
  description = "Permission à accorder au collaborateur"
  type        = string
  default     = "push"

  validation {
    condition     = contains(["pull", "push", "admin", "maintain", "triage"], var.collaborator_permission)
    error_message = "La permission doit être: pull, push, admin, maintain ou triage."
  }
}
