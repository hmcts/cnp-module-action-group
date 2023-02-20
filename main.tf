data "template_file" "actiongrouptemplate" {
  template = file("${path.module}/templates/action-group.json")
}

resource "azurerm_resource_group_template_deployment" "action-group" {
  template_content    = data.template_file.actiongrouptemplate.rendered
  name                = var.short_name
  resource_group_name = var.resourcegroup_name
  deployment_mode     = "Incremental"

  parameters_content = jsonencode({
    location             = { value = var.location }
    actionGroupName      = { value = var.action_group_name }
    shortName            = { value = var.short_name }
    emailReceiverName    = { value = var.email_receiver_name }
    emailReceiverAddress = { value = var.email_receiver_address }
  })
}

output "action_group_name" {
  value = var.action_group_name
}
