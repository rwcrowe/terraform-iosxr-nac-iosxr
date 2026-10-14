##### IPv6 #####

locals {
  ipv6 = flatten([
    for device in local.devices : [
      {
        key                                  = device.name
        device_name                          = device.name
        hop_limit                            = try(local.device_config[device.name].ipv6.hop_limit, local.defaults.iosxr.devices.configuration.ipv6.hop_limit, null)
        icmp_error_interval                  = try(local.device_config[device.name].ipv6.icmp_error_interval, local.defaults.iosxr.devices.configuration.ipv6.icmp_error_interval, null)
        icmp_error_interval_bucket_size      = try(local.device_config[device.name].ipv6.icmp_error_interval_bucket_size, local.defaults.iosxr.devices.configuration.ipv6.icmp_error_interval_bucket_size, null)
        source_route                         = try(local.device_config[device.name].ipv6.source_route, local.defaults.iosxr.devices.configuration.ipv6.source_route, null)
        assembler_timeout                    = try(local.device_config[device.name].ipv6.assembler.timeout, local.defaults.iosxr.devices.configuration.ipv6.assembler.timeout, null)
        assembler_max_packets                = try(local.device_config[device.name].ipv6.assembler.max_packets, local.defaults.iosxr.devices.configuration.ipv6.assembler.max_packets, null)
        assembler_reassembler_drop_enable    = try(local.device_config[device.name].ipv6.assembler.reassembler_drop, local.defaults.iosxr.devices.configuration.ipv6.assembler.reassembler_drop, null)
        assembler_frag_hdr_incomplete_enable = try(local.device_config[device.name].ipv6.assembler.frag_hdr_incomplete, local.defaults.iosxr.devices.configuration.ipv6.assembler.frag_hdr_incomplete, null)
        assembler_overlap_frag_drop_enable   = try(local.device_config[device.name].ipv6.assembler.overlap_frag_drop, local.defaults.iosxr.devices.configuration.ipv6.assembler.overlap_frag_drop, null)
        path_mtu_enable                      = try(local.device_config[device.name].ipv6.path_mtu.enable, local.defaults.iosxr.devices.configuration.ipv6.path_mtu.enable, null)
        path_mtu_timeout                     = try(local.device_config[device.name].ipv6.path_mtu.timeout, local.defaults.iosxr.devices.configuration.ipv6.path_mtu.timeout, null)
      }
    ] if try(local.device_config[device.name].ipv6, null) != null || try(local.defaults.iosxr.devices.configuration.ipv6, null) != null
  ])
}

resource "iosxr_ipv6" "ipv6" {
  for_each                             = { for v in local.ipv6 : v.key => v }
  device                               = each.value.device_name
  hop_limit                            = each.value.hop_limit
  icmp_error_interval                  = each.value.icmp_error_interval
  icmp_error_interval_bucket_size      = each.value.icmp_error_interval_bucket_size
  source_route                         = each.value.source_route
  assembler_timeout                    = each.value.assembler_timeout
  assembler_max_packets                = each.value.assembler_max_packets
  assembler_reassembler_drop_enable    = each.value.assembler_reassembler_drop_enable
  assembler_frag_hdr_incomplete_enable = each.value.assembler_frag_hdr_incomplete_enable
  assembler_overlap_frag_drop_enable   = each.value.assembler_overlap_frag_drop_enable
  path_mtu_enable                      = each.value.path_mtu_enable
  path_mtu_timeout                     = each.value.path_mtu_timeout
}
