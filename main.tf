data "template_file" "actiongrouptemplate" {
  template = file("${path.module}/templates/action-group.json")
}

resource "azurerm_resource_group_template_deployment" "action-group" {
  template_content       = data.template_file.actiongrouptemplate.rendered
  name                = var.short_name_var.env
  resource_group_name = var.resourcegroup_name
  deployment_mode     = "Incremental"

  parameters_content = jsonencode({
    location             = var.location
    actionGroupName      = var.action_group_name
    shortName            = var.short_name
    emailReceiverName    = var.email_receiver_name
    emailReceiverAddress = var.email_receiver_address
  }
}

output "action_group_name" {
  value = var.action_group_name
}
