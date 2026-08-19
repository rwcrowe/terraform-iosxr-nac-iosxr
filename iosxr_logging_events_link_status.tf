resource "iosxr_logging_events_link_status" "logging_events_link_status" {
  for_each            = { for device in local.devices : device.name => device if try(local.device_config[device.name].logging.link_status, null) != null || try(local.defaults.iosxr.devices.configuration.logging.link_status, null) != null }
  device              = each.value.name
  software_interfaces = try(local.device_config[each.value.name].logging.link_status, local.defaults.iosxr.devices.configuration.logging.link_status, null) == "software-interfaces" ? true : null
  disable             = try(local.device_config[each.value.name].logging.link_status, local.defaults.iosxr.devices.configuration.logging.link_status, null) == "disable" ? true : null
}
