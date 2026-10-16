data "iosxr_device_info" "device" {
  for_each = toset([for d in local.devices : d.name])
  device   = each.key
}
