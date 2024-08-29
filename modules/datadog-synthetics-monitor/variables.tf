variable "env" {
  type        = string
  description = "Environment name"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Enable or disable the synthetics test"
}

variable "dd_api_key" {
  type        = string
  description = "Datadog API Key. You can find out how to get it here: https://docs.datadoghq.com/account_management/api-app-keys/"
}

variable "dd_app_key" {
  type        = string
  description = "Datadog APP Key. You can find out how to get it here: https://docs.datadoghq.com/account_management/api-app-keys/"
}

variable "dd_api_url" {
  type        = string
  default     = "https://api.datadoghq.eu/"
  description = "Datadog API URL. You can find out what this means here: https://docs.datadoghq.com/account_management/api-app-keys/?s=api_url#configuration"
}


variable "name" {
  type        = string
  description = "Name of the synthetics test"
}

variable "service_name" {
  type        = string
  description = "Name of the service"
}

variable "notification_targets" {
  description = "List of targets to inform. For example it could be @slack-alerts or @user:marco@mistweaver.co. For more info visit https://docs.datadoghq.com/monitors/notifications/?tab=is_alert#notifications"
  type        = list(any)
}

variable "synthetics_url" {
  type = string
}

variable "synthetics_type" {
  type    = string
  default = "api"
}

variable "synthetics_subtype" {
  type    = string
  default = "http"
}

variable "synthetics_device_ids" {
  type        = list(any)
  default     = ["laptop_large"]
  description = "List of devices to run the test on. For more info visit https://docs.datadoghq.com/synthetics/monitors/browser/?tab=is_alert#synthetics-devices"
}

variable "synthetics_locations" {
  default     = ["gcp:europe-west3"]
  type        = list(any)
  description = "List of locations to run the test from. For more info visit https://docs.datadoghq.com/synthetics/monitors/browser/?tab=is_alert#synthetics-locations"
}

variable "browser_request_frequency" {
  type        = number
  default     = 300
  description = "Frequency of the test in seconds"
}

variable "synthetics_alert_down_message" {
  type        = string
  default     = "There are some problems on:"
  description = "Message to send when the test is down"
}

variable "synthetics_alert_up_message" {
  type        = string
  default     = "The problems are gone on:"
  description = "Message to send when the test is up"
}

variable "api_request_frequency" {
  type    = number
  default = 60
}

variable "api_assertion_type" {
  type        = string
  default     = "statusCode"
  description = "Type of assertion. For more info visit https://docs.datadoghq.com/synthetics/monitors/api/?tab=is_alert#synthetics-assertions"
}
variable "api_assertion_operator" {
  type        = string
  default     = "is"
  description = "Operator of the assertion. For more info visit https://docs.datadoghq.com/synthetics/monitors/api/?tab=is_alert#synthetics-assertions"
}
variable "api_assertion_target" {
  type        = string
  default     = "200"
  description = "Target of the assertion. For more info visit https://docs.datadoghq.com/synthetics/monitors/api/?tab=is_alert#synthetics-assertions"
}

variable "synthetics_ssl_port" {
  type        = string
  default     = "443"
  description = "Port to test the SSL certificate"
}

variable "synthetics_ssl_request_frequency" {
  type        = number
  default     = 900
  description = "Frequency of the test in seconds"
}

variable "synthetics_ssl_accept_self_signed" {
  type        = bool
  default     = true
  description = "Accept self signed certificates"
}

variable "ssl_assertion_type" {
  type        = string
  default     = "certificate"
  description = "Type of assertion. For more info visit https://docs.datadoghq.com/synthetics/monitors/ssl/?tab=is_alert#synthetics-assertions"
}
variable "ssl_assertion_operator" {
  type    = string
  default = "isInMoreThan"
}
variable "ssl_assertion_target" {
  type        = number
  default     = 30
  description = "Target of the assertion. For more info visit https://docs.datadoghq.com/synthetics/monitors/ssl/?tab=is_alert#synthetics-assertions"
}

variable "synthetics_status" {
  type        = string
  default     = "live"
  description = "Status of the test"
}
