# Opentofu Module Datadog Synthetics Monitor

A Opentofu module to create a Datadog 🐶 Synthetics Monitor.

## Usage

There are three operating modes: `test_browser`, `test_api`, `test_api/ssl`. 

- to choose `test_api` mode you should pass variables (`synthetics_type=api` and `synthetics_subtype=http`)
- to choose `test_api/ssl` mode you should pass variables (`synthetics_type=api` and `synthetics_subtype=ssl`)
- to choose `browser test`(it runs by default in minimal configuration) you should pass variable (`synthetics_type=browser`)


### Minimal

A minimal example to create a Datadog Synthetics Monitor.

```terraform
module "datadog_synthetics" {
  source               = "github.com/mistweaverco/opentofu-modules//modules/datadog-synthetics-monitor"
  dd_api_key           = "Datadog API Key"
  dd_app_key           = "Datadog APP Key"
  env                  = "production"
  name                 = "mistweaverco.co Frontend Test"
  service_name         = "mistweaverco.co"
  synthetics_url       = "https://mistweaverco.co"
  notification_targets = [
    "@slack-alerts",
    "@marco@mistweaverco.co"
  ]
}
```

### Full

A full example to create a Datadog Synthetics Monitor.

```terraform
module "datadog_synthetics" {
  source                            = "github.com/mistweaverco/opentofu-modules//modules/datadog-synthetics-monitor"
  enabled                           = true
  dd_api_key                        = "Datadog API Key"
  dd_app_key                        = "Datadog APP Key"
  dd_api_url                        = "Datadog API URL"
  env                               = "production"
  name                              = "mistweaverco.co Frontend Test"
  service_name                      = "mistweaverco.co"
  synthetics_url                    = "https://mistweaverco.co"
  synthetics_type                   = "browser"
  synthetics_subtype                = "laptop_large"
  synthetics_locations              = ["gcp:europe-west3"]
  synthetics_device_ids             = ["laptop_large"]
  browser_request_frequency         = 300
  synthetics_alert_down_message     = "There are some problems on:"
  synthetics_alert_up_message       = "The problems are gone on:"
  api_request_frequency             = 60
  api_assertion_type                = "statusCode"
  api_assertion_operator            = "is"
  api_assertion_target              = "200"
  synthetics_ssl_port               = "443"
  synthetics_ssl_request_frequency  = 900
  synthetics_ssl_accept_self_signed = true
  ssl_assertion_type                = "certificate"
  ssl_assertion_operator            = "isInMoreThan"
  ssl_assertion_target              = 30
  synthetics_status                 = "live"
  notification_targets              = [
    "@slack-alerts",
    "@marco@mistweaverco.co"
  ]
}
```

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_assertion_operator"></a> [api\_assertion\_operator](#input\_api\_assertion\_operator) | n/a | `string` | `"is"` | no |
| <a name="input_api_assertion_target"></a> [api\_assertion\_target](#input\_api\_assertion\_target) | n/a | `string` | `"200"` | no |
| <a name="input_api_assertion_type"></a> [api\_assertion\_type](#input\_api\_assertion\_type) | n/a | `string` | `"statusCode"` | no |
| <a name="input_api_request_frequency"></a> [api\_request\_frequency](#input\_api\_request\_frequency) | n/a | `number` | `60` | no |
| <a name="input_browser_request_frequency"></a> [browser\_request\_frequency](#input\_browser\_request\_frequency) | n/a | `number` | `300` | no |
| <a name="input_dd_api_key"></a> [dd\_api\_key](#input\_dd\_api\_key) | Datadog API Key. You can find out how to get it here: https://docs.datadoghq.com/account_management/api-app-keys/ | `any` | n/a | yes |
| <a name="input_dd_app_key"></a> [dd\_app\_key](#input\_dd\_app\_key) | Datadog APP Key. You can find out how to get it here: https://docs.datadoghq.com/account_management/api-app-keys/ | `any` | n/a | yes |
| <a name="input_dd_api_url"></a> [dd\_api\_url](#input\_dd\_api\_url) | Datadog API URL. You can find out what this means here: https://docs.datadoghq.com/account_management/api-app-keys/?s=api_url#configuration | `string` | `https://api.datadoghq.eu/` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `any` | n/a | yes |
| <a name="input_notification_targets"></a> [notification\_targets](#input\_notification\_targets) | List of targets to inform. For example it could be @slack-alerts or @user:marco@mistweaverco.co. For more info visit https://docs.datadoghq.com/monitors/notifications/?tab=is_alert#notifications | `list` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | n/a | `any` | n/a | yes |
| <a name="input_ssl_assertion_operator"></a> [ssl\_assertion\_operator](#input\_ssl\_assertion\_operator) | n/a | `string` | `"isInMoreThan"` | no |
| <a name="input_ssl_assertion_target"></a> [ssl\_assertion\_target](#input\_ssl\_assertion\_target) | n/a | `number` | `30` | no |
| <a name="input_ssl_assertion_type"></a> [ssl\_assertion\_type](#input\_ssl\_assertion\_type) | n/a | `string` | `"certificate"` | no |
| <a name="input_synthetics_alert_down_message"></a> [synthetics\_alert\_down\_message](#input\_synthetics\_alert\_down\_message) | n/a | `string` | `"There are some problems on:"` | no |
| <a name="input_synthetics_alert_up_message"></a> [synthetics\_alert\_up\_message](#input\_synthetics\_alert\_up\_message) | n/a | `string` | `"The problems are gone on:"` | no |
| <a name="input_synthetics_device_ids"></a> [synthetics\_device\_ids](#input\_synthetics\_device\_ids) | n/a | `list` | <pre>[<br>  "laptop_large"<br>]</pre> | no |
| <a name="input_synthetics_locations"></a> [synthetics\_locations](#input\_synthetics\_locations) | n/a | `list` | <pre>[<br>  "gcp:europe-west3"<br>]</pre> | no |
| <a name="input_synthetics_ssl_accept_self_signed"></a> [synthetics\_ssl\_accept\_self\_signed](#input\_synthetics\_ssl\_accept\_self\_signed) | n/a | `bool` | `true` | no |
| <a name="input_synthetics_ssl_port"></a> [synthetics\_ssl\_port](#input\_synthetics\_ssl\_port) | n/a | `string` | `"443"` | no |
| <a name="input_synthetics_ssl_request_frequency"></a> [synthetics\_ssl\_request\_frequency](#input\_synthetics\_ssl\_request\_frequency) | n/a | `number` | `900` | no |
| <a name="input_synthetics_status"></a> [synthetics\_status](#input\_synthetics\_status) | n/a | `string` | `"live"` | no |
| <a name="input_synthetics_subtype"></a> [synthetics\_subtype](#input\_synthetics\_subtype) | n/a | `string` | `"http"` | no |
| <a name="input_synthetics_type"></a> [synthetics\_type](#input\_synthetics\_type) | n/a | `string` | `"browser"` | no |
| <a name="input_synthetics_url"></a> [synthetics\_url](#input\_synthetics\_url) | n/a | `any` | n/a | yes |

