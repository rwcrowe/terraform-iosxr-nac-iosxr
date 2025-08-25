resource "iosxr_banner" "banner" {
  for_each = {
    for banner in flatten([
      for device in local.devices : [
        for banner_config in try(local.device_config[device.name].banner, try(local.defaults.iosxr.configuration.banner, [])) : {
          device      = device.name
          banner_type = banner_config.banner_type
          line        = banner_config.line
        }
      ]
    ]) : "${banner.device}_${banner.banner_type}" => banner
  }
  device = each.value.device

  banner_type = each.value.banner_type
  line        = each.value.line
}
