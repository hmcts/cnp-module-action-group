data "template_file" "actiongrouptemplate" {
  template = "${file("${path.module}/templates/action-group.json")}"
}

resource "azurerm_template_deployment" "action-group" {
  template_body       = "${data.template_file.actiongrouptemplate.rendered}"
  name                = "${var.group_name}"
  resource_group_name = "${var.resourcegroup_name}"
  deployment_mode     = "Incremental"

  parameters = {
    location                           = "${var.location}"
    env                                = "${var.env}"
    alertName                          = "${var.group_name}"
    alertShortName                     = "${var.group_short_name}"
    emailReceiverName                  = "${var.email_receiver_name}"
    emailReceiverAddress               = "${var.email_receiver_address}"
  }
}