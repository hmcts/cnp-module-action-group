variable "location" {
  type = "string"
}

variable "env" {
  type = "string"
}

variable "subscription" {
  type = "string"
}

variable "resourcegroup_name" {
  type = "string"
}

variable "group_name" {
  type = "string"
}

variable "group_short_name" {
  type = "string"
}

variable "alert_email_receivers" {
  "type" = "map"
  default = {
    names = "John Smith,Jane Smith"
    emails = "john@smith.org,jane@smith.org"
  }
}

variable "alert_sms_receivers" {
  "type" = "map"
  default = {}
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

variable "alert_webhook_receivers" {
  "type" = "map"
  default = {}
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