data "template_file" "actiongrouptemplate" {
  template = "${file("${path.module}/templates/action-group.json")}"
}

resource "azurerm_template_deployment" "action-group" {
  template_body       = "${data.template_file.actiongrouptemplate.rendered}"
  name                = "${var.template_name}"
  resource_group_name = "${var.resourcegroup_name}"
  deployment_mode     = "Incremental"

  parameters = {
    location             = "${var.location}"
    actionGroupName      = "${var.action_group_name}"
    shortName            = "${var.short_name}"
    emailReceiverName    = "${var.email_receiver_name}"
    emailReceiverAddress = "${var.email_receiver_address}"
  }
}
