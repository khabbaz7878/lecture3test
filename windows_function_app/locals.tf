locals {
  function_app_config = yamldecode(file("${path.module}/config.yaml"))["windowsfunctionapp"][0]
}
