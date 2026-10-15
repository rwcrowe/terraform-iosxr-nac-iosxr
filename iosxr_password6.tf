##### Password6 Encryption #####

locals {
  password6 = flatten([
    for device in local.devices : [
      {
        key            = device.name
        device_name    = device.name
        encryption_aes = try(local.device_config[device.name].password6_encryption, local.defaults.iosxr.devices.configuration.password6_encryption, null) == "aes" ? true : null
      }
    ] if try(local.device_config[device.name].password6_encryption, null) != null || try(local.defaults.iosxr.devices.configuration.password6_encryption, null) != null
  ])
}

resource "iosxr_password6" "password6" {
  for_each       = { for f in local.password6 : f.key => f }
  device         = each.value.device_name
  encryption_aes = each.value.encryption_aes
}
