##### Track #####

locals {
  tracks = flatten([
    for device in local.devices : [
      for track in try(local.device_config[device.name].tracks, []) : {
        key                                                 = format("%s/%s", device.name, track.name)
        device_name                                         = device.name
        track_name                                          = try(track.name, local.defaults.iosxr.devices.configuration.tracks.name, null)
        delay_up                                            = try(track.delay.up, local.defaults.iosxr.devices.configuration.tracks.delay.up, null)
        delay_down                                          = try(track.delay.down, local.defaults.iosxr.devices.configuration.tracks.delay.down, null)
        route_vrf                                           = try(track.type_route.vrf, local.defaults.iosxr.devices.configuration.tracks.type_route.vrf, null)
        line_protocol_state                                 = try(track.type_line_protocol.interface, local.defaults.iosxr.devices.configuration.tracks.type_line_protocol.interface, null)
        rtr                                                 = try(track.type_rtr, local.defaults.iosxr.devices.configuration.tracks.type_rtr, null)
        bfd_rate                                            = try(track.type_bfd.rate, local.defaults.iosxr.devices.configuration.tracks.type_bfd.rate, null)
        bfd_debounce                                        = try(track.type_bfd.debounce, local.defaults.iosxr.devices.configuration.tracks.type_bfd.debounce, null)
        bfd_interface                                       = try(track.type_bfd.interface, local.defaults.iosxr.devices.configuration.tracks.type_bfd.interface, null)
        bfd_destination_address                             = try(track.type_bfd.destination_address, local.defaults.iosxr.devices.configuration.tracks.type_bfd.destination_address, null)
        threshold_percentage_up                             = try(track.type_list.threshold_percentage.up, local.defaults.iosxr.devices.configuration.tracks.type_list.threshold_percentage.up, null)
        threshold_percentage_down                           = try(track.type_list.threshold_percentage.down, local.defaults.iosxr.devices.configuration.tracks.type_list.threshold_percentage.down, null)
        threshold_weight_up                                 = try(track.type_list.threshold_weight.up, local.defaults.iosxr.devices.configuration.tracks.type_list.threshold_weight.up, null)
        threshold_weight_down                               = try(track.type_list.threshold_weight.down, local.defaults.iosxr.devices.configuration.tracks.type_list.threshold_weight.down, null)
        line_protocol_weight_up                             = try(track.type_list.line_protocol.weight.up, local.defaults.iosxr.devices.configuration.tracks.type_list.line_protocol.weight.up, null)
        line_protocol_weight_down                           = try(track.type_list.line_protocol.weight.down, local.defaults.iosxr.devices.configuration.tracks.type_list.line_protocol.weight.down, null)
        line_protocol_percentage_up                         = try(track.type_list.line_protocol.percentage.up, local.defaults.iosxr.devices.configuration.tracks.type_list.line_protocol.percentage.up, null)
        line_protocol_percentage_down                       = try(track.type_list.line_protocol.percentage.down, local.defaults.iosxr.devices.configuration.tracks.type_list.line_protocol.percentage.down, null)
        route_ipv4_address                                  = try(try(track.type_route.address, local.defaults.iosxr.devices.configuration.tracks.type_route.address, null) != null && can(regex(":", try(track.type_route.address, local.defaults.iosxr.devices.configuration.tracks.type_route.address, ""))) == false ? try(track.type_route.address, local.defaults.iosxr.devices.configuration.tracks.type_route.address, null) : null, null)
        route_ipv4_mask                                     = try(try(track.type_route.address, local.defaults.iosxr.devices.configuration.tracks.type_route.address, null) != null && can(regex(":", try(track.type_route.address, local.defaults.iosxr.devices.configuration.tracks.type_route.address, ""))) == false ? try(provider::utils::normalize_mask(try(track.type_route.prefix_length, local.defaults.iosxr.devices.configuration.tracks.type_route.prefix_length, null), "dotted-decimal"), try(track.type_route.prefix_length, local.defaults.iosxr.devices.configuration.tracks.type_route.prefix_length, null), null) : null, null)
        route_address_prefix                                = try(try(track.type_route.address, local.defaults.iosxr.devices.configuration.tracks.type_route.address, null) != null && can(regex(":", try(track.type_route.address, local.defaults.iosxr.devices.configuration.tracks.type_route.address, ""))) == true ? try(track.type_route.address, local.defaults.iosxr.devices.configuration.tracks.type_route.address, null) : null, null)
        route_address_prefix_length                         = try(try(track.type_route.address, local.defaults.iosxr.devices.configuration.tracks.type_route.address, null) != null && can(regex(":", try(track.type_route.address, local.defaults.iosxr.devices.configuration.tracks.type_route.address, ""))) == true ? try(track.type_route.prefix_length, local.defaults.iosxr.devices.configuration.tracks.type_route.prefix_length, null) : null, null)
        bgp_neighbor_ipv4_unicast_address                   = try(track.type_bgp_neighbor.ipv4_unicast.address, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.ipv4_unicast.address, null)
        bgp_neighbor_ipv4_unicast_vrf_name                  = try(track.type_bgp_neighbor.ipv4_unicast.vrf, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.ipv4_unicast.vrf, null)
        bgp_neighbor_ipv4_unicast_disable_fib_check         = try(track.type_bgp_neighbor.ipv4_unicast.disable_fib_check, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.ipv4_unicast.disable_fib_check, null)
        bgp_neighbor_ipv4_labeled_unicast_address           = try(track.type_bgp_neighbor.ipv4_labeled_unicast.address, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.ipv4_labeled_unicast.address, null)
        bgp_neighbor_ipv4_labeled_unicast_vrf_name          = try(track.type_bgp_neighbor.ipv4_labeled_unicast.vrf, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.ipv4_labeled_unicast.vrf, null)
        bgp_neighbor_ipv4_labeled_unicast_disable_fib_check = try(track.type_bgp_neighbor.ipv4_labeled_unicast.disable_fib_check, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.ipv4_labeled_unicast.disable_fib_check, null)
        bgp_neighbor_ipv6_unicast_address                   = try(track.type_bgp_neighbor.ipv6_unicast.address, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.ipv6_unicast.address, null)
        bgp_neighbor_ipv6_unicast_vrf_name                  = try(track.type_bgp_neighbor.ipv6_unicast.vrf, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.ipv6_unicast.vrf, null)
        bgp_neighbor_ipv6_unicast_disable_fib_check         = try(track.type_bgp_neighbor.ipv6_unicast.disable_fib_check, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.ipv6_unicast.disable_fib_check, null)
        bgp_neighbor_ipv6_labeled_unicast_address           = try(track.type_bgp_neighbor.ipv6_labeled_unicast.address, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.ipv6_labeled_unicast.address, null)
        bgp_neighbor_ipv6_labeled_unicast_disable_fib_check = try(track.type_bgp_neighbor.ipv6_labeled_unicast.disable_fib_check, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.ipv6_labeled_unicast.disable_fib_check, null)
        bgp_neighbor_vpnv4_unicast_address                  = try(track.type_bgp_neighbor.vpnv4_unicast.address, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.vpnv4_unicast.address, null)
        bgp_neighbor_vpnv4_unicast_disable_fib_check        = try(track.type_bgp_neighbor.vpnv4_unicast.disable_fib_check, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.vpnv4_unicast.disable_fib_check, null)
        bgp_neighbor_vpnv6_unicast_address                  = try(track.type_bgp_neighbor.vpnv6_unicast.address, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.vpnv6_unicast.address, null)
        bgp_neighbor_vpnv6_unicast_disable_fib_check        = try(track.type_bgp_neighbor.vpnv6_unicast.disable_fib_check, local.defaults.iosxr.devices.configuration.tracks.type_bgp_neighbor.vpnv6_unicast.disable_fib_check, null)
        boolean_and_list = try(length(track.type_list.boolean_and) == 0, true) ? null : [for item in track.type_list.boolean_and : {
          object_name = try(item.name, local.defaults.iosxr.devices.configuration.tracks.type_list.boolean_and.name, null)
          not         = try(item.not, local.defaults.iosxr.devices.configuration.tracks.type_list.boolean_and.not, null)
        }]
        boolean_or_list = try(length(track.type_list.boolean_or) == 0, true) ? null : [for item in track.type_list.boolean_or : {
          object_name = try(item.name, local.defaults.iosxr.devices.configuration.tracks.type_list.boolean_or.name, null)
          not         = try(item.not, local.defaults.iosxr.devices.configuration.tracks.type_list.boolean_or.not, null)
        }]
        threshold_percentage = try(length(track.type_list.threshold_percentage.objects) == 0, true) ? null : [for item in track.type_list.threshold_percentage.objects : {
          object_name = try(item.name, local.defaults.iosxr.devices.configuration.tracks.type_list.threshold_percentage.objects.name, null)
          weight      = try(item.weight, local.defaults.iosxr.devices.configuration.tracks.type_list.threshold_percentage.objects.weight, 1)
        }]
        threshold_weight = try(length(track.type_list.threshold_weight.objects) == 0, true) ? null : [for item in track.type_list.threshold_weight.objects : {
          object_name = try(item.name, local.defaults.iosxr.devices.configuration.tracks.type_list.threshold_weight.objects.name, null)
          weight      = try(item.weight, local.defaults.iosxr.devices.configuration.tracks.type_list.threshold_weight.objects.weight, null)
        }]
        line_protocol_weight = try(length(track.type_list.line_protocol.weight.interfaces) == 0, true) ? null : [for item in track.type_list.line_protocol.weight.interfaces : {
          interface_name = try(item.name, local.defaults.iosxr.devices.configuration.tracks.type_list.line_protocol.weight.interfaces.name, null)
          weight         = try(item.weight, local.defaults.iosxr.devices.configuration.tracks.type_list.line_protocol.weight.interfaces.weight, null)
        }]
        line_protocol_percentage = try(length(track.type_list.line_protocol.percentage.interfaces) == 0, true) ? null : [for item in track.type_list.line_protocol.percentage.interfaces : {
          interface_name = try(item.name, local.defaults.iosxr.devices.configuration.tracks.type_list.line_protocol.percentage.interfaces.name, null)
        }]
        line_protocol_boolean_and = try(length(track.type_list.line_protocol.boolean_and) == 0, true) ? null : [for item in track.type_list.line_protocol.boolean_and : {
          interface_name = try(item.name, local.defaults.iosxr.devices.configuration.tracks.type_list.line_protocol.boolean_and.name, null)
        }]
        line_protocol_boolean_or = try(length(track.type_list.line_protocol.boolean_or) == 0, true) ? null : [for item in track.type_list.line_protocol.boolean_or : {
          interface_name = try(item.name, local.defaults.iosxr.devices.configuration.tracks.type_list.line_protocol.boolean_or.name, null)
        }]
        track_down_error_disable_interfaces = try(length(track.action.track_down.error_disable_interfaces) == 0, true) ? null : [for item in track.action.track_down.error_disable_interfaces : {
          interface_name = try(item.name, local.defaults.iosxr.devices.configuration.tracks.action.track_down.error_disable_interfaces.name, null)
          auto_recover   = try(item.auto_recover, local.defaults.iosxr.devices.configuration.tracks.action.track_down.error_disable_interfaces.auto_recover, null)
        }]
        track_up_error_disable_interfaces = try(length(track.action.track_up.error_disable_interfaces) == 0, true) ? null : [for item in track.action.track_up.error_disable_interfaces : {
          interface_name = try(item.name, local.defaults.iosxr.devices.configuration.tracks.action.track_up.error_disable_interfaces.name, null)
          auto_recover   = try(item.auto_recover, local.defaults.iosxr.devices.configuration.tracks.action.track_up.error_disable_interfaces.auto_recover, null)
        }]
      }
    ]
  ])
}

resource "iosxr_track" "track" {
  for_each                                            = { for track in local.tracks : track.key => track }
  device                                              = each.value.device_name
  track_name                                          = each.value.track_name
  delay_up                                            = each.value.delay_up
  delay_down                                          = each.value.delay_down
  route_vrf                                           = each.value.route_vrf
  line_protocol_state                                 = each.value.line_protocol_state
  rtr                                                 = each.value.rtr
  bfd_rate                                            = each.value.bfd_rate
  bfd_debounce                                        = each.value.bfd_debounce
  bfd_interface                                       = each.value.bfd_interface
  bfd_destination_address                             = each.value.bfd_destination_address
  threshold_percentage_up                             = each.value.threshold_percentage_up
  threshold_percentage_down                           = each.value.threshold_percentage_down
  threshold_weight_up                                 = each.value.threshold_weight_up
  threshold_weight_down                               = each.value.threshold_weight_down
  line_protocol_weight_up                             = each.value.line_protocol_weight_up
  line_protocol_weight_down                           = each.value.line_protocol_weight_down
  line_protocol_percentage_up                         = each.value.line_protocol_percentage_up
  line_protocol_percentage_down                       = each.value.line_protocol_percentage_down
  route_ipv4_address                                  = each.value.route_ipv4_address
  route_ipv4_mask                                     = each.value.route_ipv4_mask
  route_address_prefix                                = each.value.route_address_prefix
  route_address_prefix_length                         = each.value.route_address_prefix_length
  bgp_neighbor_ipv4_unicast_address                   = each.value.bgp_neighbor_ipv4_unicast_address
  bgp_neighbor_ipv4_unicast_vrf_name                  = each.value.bgp_neighbor_ipv4_unicast_vrf_name
  bgp_neighbor_ipv4_unicast_disable_fib_check         = each.value.bgp_neighbor_ipv4_unicast_disable_fib_check
  bgp_neighbor_ipv4_labeled_unicast_address           = each.value.bgp_neighbor_ipv4_labeled_unicast_address
  bgp_neighbor_ipv4_labeled_unicast_vrf_name          = each.value.bgp_neighbor_ipv4_labeled_unicast_vrf_name
  bgp_neighbor_ipv4_labeled_unicast_disable_fib_check = each.value.bgp_neighbor_ipv4_labeled_unicast_disable_fib_check
  bgp_neighbor_ipv6_unicast_address                   = each.value.bgp_neighbor_ipv6_unicast_address
  bgp_neighbor_ipv6_unicast_vrf_name                  = each.value.bgp_neighbor_ipv6_unicast_vrf_name
  bgp_neighbor_ipv6_unicast_disable_fib_check         = each.value.bgp_neighbor_ipv6_unicast_disable_fib_check
  bgp_neighbor_ipv6_labeled_unicast_address           = each.value.bgp_neighbor_ipv6_labeled_unicast_address
  bgp_neighbor_ipv6_labeled_unicast_disable_fib_check = each.value.bgp_neighbor_ipv6_labeled_unicast_disable_fib_check
  bgp_neighbor_vpnv4_unicast_address                  = each.value.bgp_neighbor_vpnv4_unicast_address
  bgp_neighbor_vpnv4_unicast_disable_fib_check        = each.value.bgp_neighbor_vpnv4_unicast_disable_fib_check
  bgp_neighbor_vpnv6_unicast_address                  = each.value.bgp_neighbor_vpnv6_unicast_address
  bgp_neighbor_vpnv6_unicast_disable_fib_check        = each.value.bgp_neighbor_vpnv6_unicast_disable_fib_check
  boolean_and_list                                    = each.value.boolean_and_list
  boolean_or_list                                     = each.value.boolean_or_list
  threshold_percentage                                = each.value.threshold_percentage
  threshold_weight                                    = each.value.threshold_weight
  line_protocol_weight                                = each.value.line_protocol_weight
  line_protocol_percentage                            = each.value.line_protocol_percentage
  line_protocol_boolean_and                           = each.value.line_protocol_boolean_and
  line_protocol_boolean_or                            = each.value.line_protocol_boolean_or
  track_down_error_disable_interfaces                 = each.value.track_down_error_disable_interfaces
  track_up_error_disable_interfaces                   = each.value.track_up_error_disable_interfaces
}
