# moj-module-action-group

A module that lets you create Action Groups in Azure.

## Variables

### Configuration

All parameters are required by this module

- `location` The azure data center location.
- `env` The application insights environment. Use `prod` for production, `sandbox` for sandbox, etc.
- `resourcegroup_name` The name of the azure resource group, such as `cmc-claim-store-prod`.
- `action_group_name` The name to give to the new action group.
- `short_name` A short (12-character maximum) human-readable name for the action group.
- `email_receiver_name` The name of the only action created by this action group - by convention the name of the email recipient.
- `email_receiver_address` The email address to associate with this action group.

### Output

The following variables are provided by the module for use in other modules

- `action_group_name` The name of the newly created action group

## Usage

The following example shows how to use the module to create an action group.

```terraform
module "custom-action-group" {
  source = "git@github.com:hmcts/cnp-module-action-group"
  location = "${var.location}"
  env = "prod"
  resourcegroup_name = "${azurerm_resource_group.rg.name}"
  action_group_name = "My Custom Action Group"
  short_name = "custom AG"
  email_receiver_name = "My Mailing List"
  email_receiver_address = "mailinglist@hmcts.net"
}
```