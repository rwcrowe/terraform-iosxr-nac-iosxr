##### ICMP #####

locals {
  icmp = flatten([
    for device in local.devices : [
      {
        key                                    = device.name
        device_name                            = device.name
        ipv4_source_vrf                        = try(local.device_config[device.name].icmp.ipv4.source, local.defaults.iosxr.devices.configuration.icmp.ipv4.source, null) == "vrf" ? true : null
        ipv4_source_rfc                        = try(local.device_config[device.name].icmp.ipv4.source, local.defaults.iosxr.devices.configuration.icmp.ipv4.source, null) == "rfc" ? true : null
        ipv4_rate_limit_unreachable_rate       = try(tonumber(try(local.device_config[device.name].icmp.ipv4.rate_limit_unreachable_rate, local.defaults.iosxr.devices.configuration.icmp.ipv4.rate_limit_unreachable_rate, null)), null)
        ipv4_rate_limit_unreachable_disable    = try(local.device_config[device.name].icmp.ipv4.rate_limit_unreachable_rate, local.defaults.iosxr.devices.configuration.icmp.ipv4.rate_limit_unreachable_rate, null) == "disable" ? true : null
        ipv4_rate_limit_unreachable_df_rate    = try(tonumber(try(local.device_config[device.name].icmp.ipv4.rate_limit_unreachable_df_rate, local.defaults.iosxr.devices.configuration.icmp.ipv4.rate_limit_unreachable_df_rate, null)), null)
        ipv4_rate_limit_unreachable_df_disable = try(local.device_config[device.name].icmp.ipv4.rate_limit_unreachable_df_rate, local.defaults.iosxr.devices.configuration.icmp.ipv4.rate_limit_unreachable_df_rate, null) == "disable" ? true : null
        ipv4_mpls_extended_diagnostics         = local.device_is_25x[device.name] ? try(local.device_config[device.name].icmp.ipv4.mpls_extended_diagnostics, local.defaults.iosxr.devices.configuration.icmp.ipv4.mpls_extended_diagnostics, null) : null
        ipv4_vrfs                              = local.device_is_25x[device.name] ? (try(length(local.device_config[device.name].icmp.ipv4.vrfs) == 0, true) ? null : [for vrf in local.device_config[device.name].icmp.ipv4.vrfs : { vrf_name = vrf.name, extended_diagnostics_permitted_remote_addresses = [for prefix in try(vrf.permitted_remote_addresses, []) : { address = split("/", prefix)[0], length = tonumber(split("/", prefix)[1]) }] }]) : null
        ipv6_source_vrf                        = try(local.device_config[device.name].icmp.ipv6.source, local.defaults.iosxr.devices.configuration.icmp.ipv6.source, null) == "vrf" ? true : null
        ipv6_source_rfc                        = try(local.device_config[device.name].icmp.ipv6.source, local.defaults.iosxr.devices.configuration.icmp.ipv6.source, null) == "rfc" ? true : null
        ipv6_mpls_extended_diagnostics         = local.device_is_25x[device.name] ? try(local.device_config[device.name].icmp.ipv6.mpls_extended_diagnostics, local.defaults.iosxr.devices.configuration.icmp.ipv6.mpls_extended_diagnostics, null) : null
        ipv6_vrfs                              = local.device_is_25x[device.name] ? (try(length(local.device_config[device.name].icmp.ipv6.vrfs) == 0, true) ? null : [for vrf in local.device_config[device.name].icmp.ipv6.vrfs : { vrf_name = vrf.name, extended_diagnostics_permitted_remote_addresses = [for prefix in try(vrf.permitted_remote_addresses, []) : { address = split("/", prefix)[0], length = tonumber(split("/", prefix)[1]) }] }]) : null
      }
    ] if try(local.device_config[device.name].icmp, null) != null || try(local.defaults.iosxr.devices.configuration.icmp, null) != null
  ])
}

resource "iosxr_icmp" "icmp" {
  for_each                               = { for v in local.icmp : v.key => v }
  device                                 = each.value.device_name
  ipv4_source_vrf                        = each.value.ipv4_source_vrf
  ipv4_source_rfc                        = each.value.ipv4_source_rfc
  ipv4_rate_limit_unreachable_rate       = each.value.ipv4_rate_limit_unreachable_rate
  ipv4_rate_limit_unreachable_disable    = each.value.ipv4_rate_limit_unreachable_disable
  ipv4_rate_limit_unreachable_df_rate    = each.value.ipv4_rate_limit_unreachable_df_rate
  ipv4_rate_limit_unreachable_df_disable = each.value.ipv4_rate_limit_unreachable_df_disable
  ipv4_mpls_extended_diagnostics         = each.value.ipv4_mpls_extended_diagnostics
  ipv4_vrfs                              = each.value.ipv4_vrfs
  ipv6_source_vrf                        = each.value.ipv6_source_vrf
  ipv6_source_rfc                        = each.value.ipv6_source_rfc
  ipv6_mpls_extended_diagnostics         = each.value.ipv6_mpls_extended_diagnostics
  ipv6_vrfs                              = each.value.ipv6_vrfs
}
