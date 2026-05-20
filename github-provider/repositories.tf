resource "github_repository" "first_repo_from_terraform" {
  name        = "1st-repo-from-terraform"
  description = "Test Description"
  visibility  = "public"
  auto_init   = true
}

resource "github_repository" "second_repo_from_terraform" {
  name        = "2ed-repo-from-terraform"
  description = "Test Description"
  visibility  = "public"
  auto_init   = true
}

output "first_repo_url" {
  value = github_repository.first_repo_from_terraform.html_url
}