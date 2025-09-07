locals {
  device_router_isis = flatten([
    for device in local.devices : [
      for router_isis in try(local.device_config[device.name].router_isis, []) : {
        device_name = device.name
        process_id  = router_isis.process_id
        key         = "${device.name}-${router_isis.process_id}"

        is_type                                                               = try(router_isis.is_type, local.defaults.iosxr.configuration.router_isis_is_type, null)
        set_overload_bit_on_startup_advertise_as_overloaded                   = try(router_isis.set_overload_bit_on_startup_advertise_as_overloaded, local.defaults.iosxr.configuration.router_isis_set_overload_bit_on_startup_advertise_as_overloaded, null)
        set_overload_bit_on_startup_advertise_as_overloaded_time_to_advertise = try(router_isis.set_overload_bit_on_startup_advertise_as_overloaded_time_to_advertise, local.defaults.iosxr.configuration.router_isis_set_overload_bit_on_startup_advertise_as_overloaded_time_to_advertise, null)
        set_overload_bit_on_startup_wait_for_bgp                              = try(router_isis.set_overload_bit_on_startup_wait_for_bgp, local.defaults.iosxr.configuration.router_isis_set_overload_bit_on_startup_wait_for_bgp, null)
        set_overload_bit_advertise_external                                   = try(router_isis.set_overload_bit_advertise_external, local.defaults.iosxr.configuration.router_isis_set_overload_bit_advertise_external, null)
        set_overload_bit_advertise_interlevel                                 = try(router_isis.set_overload_bit_advertise_interlevel, local.defaults.iosxr.configuration.router_isis_set_overload_bit_advertise_interlevel, null)
        nsr                                                                   = try(router_isis.nsr, local.defaults.iosxr.configuration.router_isis_nsr, null)
        nsf_cisco                                                             = try(router_isis.nsf_cisco, local.defaults.iosxr.configuration.router_isis_nsf_cisco, null)
        nsf_ietf                                                              = try(router_isis.nsf_ietf, local.defaults.iosxr.configuration.router_isis_nsf_ietf, null)
        nsf_lifetime                                                          = try(router_isis.nsf_lifetime, local.defaults.iosxr.configuration.router_isis_nsf_lifetime, null)
        nsf_interface_timer                                                   = try(router_isis.nsf_interface_timer, local.defaults.iosxr.configuration.router_isis_nsf_interface_timer, null)
        nsf_interface_expires                                                 = try(router_isis.nsf_interface_expires, local.defaults.iosxr.configuration.router_isis_nsf_interface_expires, null)
        log_adjacency_changes                                                 = try(router_isis.log_adjacency_changes, local.defaults.iosxr.configuration.router_isis_log_adjacency_changes, null)
        lsp_gen_interval_maximum_wait                                         = try(router_isis.lsp_gen_interval_maximum_wait, local.defaults.iosxr.configuration.router_isis_lsp_gen_interval_maximum_wait, null)
        lsp_gen_interval_initial_wait                                         = try(router_isis.lsp_gen_interval_initial_wait, local.defaults.iosxr.configuration.router_isis_lsp_gen_interval_initial_wait, null)
        lsp_gen_interval_secondary_wait                                       = try(router_isis.lsp_gen_interval_secondary_wait, local.defaults.iosxr.configuration.router_isis_lsp_gen_interval_secondary_wait, null)
        lsp_refresh_interval                                                  = try(router_isis.lsp_refresh_interval, local.defaults.iosxr.configuration.router_isis_lsp_refresh_interval, null)
        max_lsp_lifetime                                                      = try(router_isis.max_lsp_lifetime, local.defaults.iosxr.configuration.router_isis_max_lsp_lifetime, null)
        lsp_password_keychain                                                 = try(router_isis.lsp_password_keychain, local.defaults.iosxr.configuration.router_isis_lsp_password_keychain, null)
        distribute_link_state_instance_id                                     = try(router_isis.distribute_link_state_instance_id, local.defaults.iosxr.configuration.router_isis_distribute_link_state_instance_id, null)
        distribute_link_state_throttle                                        = try(router_isis.distribute_link_state_throttle, local.defaults.iosxr.configuration.router_isis_distribute_link_state_throttle, null)
        distribute_link_state_level                                           = try(router_isis.distribute_link_state_level, local.defaults.iosxr.configuration.router_isis_distribute_link_state_level, null)
        set_overload_bit_levels                                               = try(router_isis.set_overload_bit_levels, local.defaults.iosxr.configuration.router_isis_set_overload_bit_levels, null)
        affinity_maps                                                         = try(router_isis.affinity_maps, local.defaults.iosxr.configuration.router_isis_affinity_maps, null)
        flex_algos                                                            = try(router_isis.flex_algos, local.defaults.iosxr.configuration.router_isis_flex_algos, null)
        nets                                                                  = try(router_isis.nets, local.defaults.iosxr.configuration.router_isis_nets, null)
        interfaces                                                            = try(router_isis.interfaces, local.defaults.iosxr.configuration.router_isis_interfaces, null)
      }
    ]
  ])
}

resource "iosxr_router_isis" "router_isis" {
  for_each = { for router_isis in local.device_router_isis : router_isis.key => router_isis }

  device     = each.value.device_name
  process_id = each.value.process_id

  is_type                                                               = each.value.is_type
  set_overload_bit_on_startup_advertise_as_overloaded                   = each.value.set_overload_bit_on_startup_advertise_as_overloaded
  set_overload_bit_on_startup_advertise_as_overloaded_time_to_advertise = each.value.set_overload_bit_on_startup_advertise_as_overloaded_time_to_advertise
  set_overload_bit_on_startup_wait_for_bgp                              = each.value.set_overload_bit_on_startup_wait_for_bgp
  set_overload_bit_advertise_external                                   = each.value.set_overload_bit_advertise_external
  set_overload_bit_advertise_interlevel                                 = each.value.set_overload_bit_advertise_interlevel
  nsr                                                                   = each.value.nsr
  nsf_cisco                                                             = each.value.nsf_cisco
  nsf_ietf                                                              = each.value.nsf_ietf
  nsf_lifetime                                                          = each.value.nsf_lifetime
  nsf_interface_timer                                                   = each.value.nsf_interface_timer
  nsf_interface_expires                                                 = each.value.nsf_interface_expires
  log_adjacency_changes                                                 = each.value.log_adjacency_changes
  lsp_gen_interval_maximum_wait                                         = each.value.lsp_gen_interval_maximum_wait
  lsp_gen_interval_initial_wait                                         = each.value.lsp_gen_interval_initial_wait
  lsp_gen_interval_secondary_wait                                       = each.value.lsp_gen_interval_secondary_wait
  lsp_refresh_interval                                                  = each.value.lsp_refresh_interval
  max_lsp_lifetime                                                      = each.value.max_lsp_lifetime
  lsp_password_keychain                                                 = each.value.lsp_password_keychain
  distribute_link_state_instance_id                                     = each.value.distribute_link_state_instance_id
  distribute_link_state_throttle                                        = each.value.distribute_link_state_throttle
  distribute_link_state_level                                           = each.value.distribute_link_state_level
  set_overload_bit_levels                                               = each.value.set_overload_bit_levels
  affinity_maps                                                         = each.value.affinity_maps
  flex_algos                                                            = each.value.flex_algos
  nets                                                                  = each.value.nets
  interfaces                                                            = each.value.interfaces
}
