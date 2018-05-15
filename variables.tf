variable "location" {
  type = "string"
}

variable "env" {
  type = "string"
}

variable "subscription" {
  type = "string"
}

variable "resourcegroupName" {
  type = "string"
}

variable "alertName" {
  type = "string"
}

variable "alertShortName" {
  type = "string"
}

variable "alertEmailReceivers" {
  "type" = "map"
  default = {
    names = "John Smith,Jane Smith"
    emails = "john@smith.org,jane@smith.org"
  }
}

variable "alertSmsReceivers" {
  "type" = "list"
  description = <<EOF
example
[
  {
    name = "John Smith"
    countryCode = "0044"
    phoneNumber = "7777777777"
  },
  {
    name = "Jane Smith"
    countryCode = "0044"
    phoneNumber = "7777777778"
  }
EOF
}

variable "alertWebhookReceivers" {
  "type" = "list"
  description = <<EOF
example
[
  {
    name = "Slack"
    serviceUri = "https://slack.com/webhook"
  },
  {
    name = "Something else"
    serviceUri = "https://somethingelse.org/webhook"
  }
EOF
}