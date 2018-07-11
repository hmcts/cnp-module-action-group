# moj-module-action-group

A module that lets you create Action Groups in Azure

## Variables

### Contextual variables

#### `location`
The azure data center location.

#### `env`
The application insights environment. Use `prod` for production, `sandbox` for sandbox, etc.

#### `resourcegroup_name`
The name of the azure resource group, such as `cmc-claim-store-prod`.

### Action Group definition variables

#### `action_group_name`
The name to give to the new action group.

#### `short_name`
A short (12-character maximum) human-readable name for the action group.

#### `email_receiver_name`
The name of the only action created by this action group - by convention the name of the email recipient.

#### `email_receiver_address`
The email address to associate with this action group.
