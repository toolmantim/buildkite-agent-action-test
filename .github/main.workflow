workflow "Start a Buildkite Agent" {
  on = "push"
  resolves = ["Start Agent"]
}

action "Start Agent" {
  uses = "toolmantim/actions/agent@master"
  secrets = ["BUILDKITE_AGENT_TOKEN"]
  env = {
    TAGS = "github-action"
    NAME = "github-action-%n"
  }
}

workflow "Start a Buildkite Build" {
  on = "push"
  resolves = ["Create Build"]
}

action "Create Build" {
  uses = "toolmantim/actions/pipeline@master"
  secrets = ["BUILDKITE_API_ACCESS_TOKEN"]
  env = {
    PIPELINE = "tim-test-account/github-action-test"
    # Pass through commit, branch, message and author
  }
}