data "template_file" "actiongrouptemplate" {
  template = "${file("${path.module}/templates/action-group.json")}"
}

resource "azurerm_template_deployment" "action-group" {
  template_body       = "${data.template_file.actiongrouptemplate.rendered}"
  name                = "${var.alertName}"
  resource_group_name = "${var.resourcegroupName}"
  deployment_mode     = "Incremental"

  parameters = {
    location                           = "${var.location}"
    env                                = "${var.env}"
    alertName                          = "${var.alertName}"
    alertShortName                     = "${var.alertShortName}"
    alertEmailReceivers                = "${var.alertEmailReceivers}"
    alertSmsReceivers                  = "${var.alertSmsReceivers}"
    alertWebhookReceivers              = "${var.alertWebhookReceivers}"
  }
}