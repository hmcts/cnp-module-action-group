data "template_file" "actiongrouptemplate" {
  template = "${file("${path.module}/templates/action-group.json")}"
}

data "template_file" "email_receivers" {
  template = "${file("${path.module}/templates/email-receivers.json")}"
  count    = "${length(var.email_receivers)}"
  vars {
    email = "${element(values(var.email_receivers[count.index]), 0)}"
    name = "${element(keys(var.email_receivers[count.index]), 0)}"
  }
}

resource "azurerm_template_deployment" "action-group" {
  template_body       = "${data.template_file.actiongrouptemplate.rendered}"
  name                = "${var.short_name}_${var.env}"
  resource_group_name = "${var.resourcegroup_name}"
  deployment_mode     = "Incremental"

  parameters = {
    location             = "${var.location}"
    actionGroupName      = "${var.action_group_name}"
    shortName            = "${var.short_name}"
    emailReceivers       = "${join(",", data.template_file.email_receivers.*.rendered)}"
  }
}

output "action_group_name" {
  value = "${var.action_group_name}"
}
