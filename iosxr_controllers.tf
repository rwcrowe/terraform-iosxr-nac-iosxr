##### Controllers: Optics #####

locals {
  controllers_optics = flatten([
    for device in local.devices : [
      for optics in try(local.device_config[device.name].controllers.optics, []) : {
        key                    = format("%s/%s", device.name, optics.name)
        device_name            = device.name
        name                   = optics.name
        breakout               = try(optics.breakout, local.defaults.iosxr.devices.configuration.controllers.optics.breakout, null)
        description            = try(optics.description, local.defaults.iosxr.devices.configuration.controllers.optics.description, null)
        link_status            = try(optics.link_status, local.defaults.iosxr.devices.configuration.controllers.optics.link_status, null)
        performance_monitoring = try(optics.performance_monitoring, local.defaults.iosxr.devices.configuration.controllers.optics.performance_monitoring, null)
        shutdown               = try(optics.shutdown, local.defaults.iosxr.devices.configuration.controllers.optics.shutdown, null)
        speed                  = try(optics.speed, local.defaults.iosxr.devices.configuration.controllers.optics.speed, null)
        speed_host_lanes       = local.device_is_25x[device.name] ? try(optics.speed_host_lanes, local.defaults.iosxr.devices.configuration.controllers.optics.speed_host_lanes, null) : null
        transceiver_disable    = try(optics.transceiver_disable, local.defaults.iosxr.devices.configuration.controllers.optics.transceiver_disable, null)
      }
    ]
  ])
}

resource "iosxr_controller_optics" "controller_optics" {
  for_each               = { for v in local.controllers_optics : v.key => v }
  device                 = each.value.device_name
  type                   = "Optics"
  name                   = each.value.name
  active                 = "act"
  breakout               = each.value.breakout
  description            = each.value.description
  link_status            = each.value.link_status
  performance_monitoring = each.value.performance_monitoring
  shutdown               = each.value.shutdown
  speed                  = each.value.speed
  speed_host_lanes       = each.value.speed_host_lanes
  transceiver_disable    = each.value.transceiver_disable
}
