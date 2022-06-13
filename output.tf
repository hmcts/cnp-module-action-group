output "action_group_name" {
  value = "${var.action_group_name}"
}

output "action_group_id" {
  value = azurerm_template_deployment.action-group.id
}

