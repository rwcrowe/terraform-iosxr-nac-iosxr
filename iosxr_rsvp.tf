##### RSVP #####

locals {
  rsvp = { for device in local.devices : device.name => {
    authentication_key_chain                             = try(local.device_config[device.name].rsvp.authentication.key_chain, local.defaults.iosxr.devices.configuration.rsvp.authentication.key_chain, null)
    authentication_life_time                             = try(local.device_config[device.name].rsvp.authentication.life_time, local.defaults.iosxr.devices.configuration.rsvp.authentication.life_time, null)
    authentication_retransmit                            = try(local.device_config[device.name].rsvp.authentication.retransmit, local.defaults.iosxr.devices.configuration.rsvp.authentication.retransmit, null)
    authentication_window_size                           = try(local.device_config[device.name].rsvp.authentication.window_size, local.defaults.iosxr.devices.configuration.rsvp.authentication.window_size, null)
    bandwidth_mam_percentage_max_reservable_bandwidth    = try(local.device_config[device.name].rsvp.bandwidth.mam_percentage.max_reservable_bandwidth, local.defaults.iosxr.devices.configuration.rsvp.bandwidth.mam_percentage.max_reservable_bandwidth, null)
    bandwidth_mam_percentage_max_reservable_bc0          = try(local.device_config[device.name].rsvp.bandwidth.mam_percentage.max_reservable_bc0, local.defaults.iosxr.devices.configuration.rsvp.bandwidth.mam_percentage.max_reservable_bc0, null)
    bandwidth_mam_percentage_max_reservable_bc1          = try(local.device_config[device.name].rsvp.bandwidth.mam_percentage.max_reservable_bc1, local.defaults.iosxr.devices.configuration.rsvp.bandwidth.mam_percentage.max_reservable_bc1, null)
    bandwidth_rdm_percentage_max_reservable_bc0          = try(local.device_config[device.name].rsvp.bandwidth.rdm_percentage.max_reservable_bc0, local.defaults.iosxr.devices.configuration.rsvp.bandwidth.rdm_percentage.max_reservable_bc0, null)
    bandwidth_rdm_percentage_max_reservable_bc1          = try(local.device_config[device.name].rsvp.bandwidth.rdm_percentage.max_reservable_bc1, local.defaults.iosxr.devices.configuration.rsvp.bandwidth.rdm_percentage.max_reservable_bc1, null)
    latency_threshold                                    = try(local.device_config[device.name].rsvp.latency_threshold, local.defaults.iosxr.devices.configuration.rsvp.latency_threshold, null)
    logging_events_issu                                  = try(local.device_config[device.name].rsvp.logging_events_issu, local.defaults.iosxr.devices.configuration.rsvp.logging_events_issu, null)
    logging_events_nsr                                   = try(local.device_config[device.name].rsvp.logging_events_nsr, local.defaults.iosxr.devices.configuration.rsvp.logging_events_nsr, null)
    ltrace_buffer_multiplier                             = try(local.device_config[device.name].rsvp.ltrace.multiplier, local.defaults.iosxr.devices.configuration.rsvp.ltrace.multiplier, null)
    ltrace_buffer_multiplier_common                      = try(local.device_config[device.name].rsvp.ltrace.common, local.defaults.iosxr.devices.configuration.rsvp.ltrace.common, null)
    ltrace_buffer_multiplier_dbg_err                     = try(local.device_config[device.name].rsvp.ltrace.dbg_err, local.defaults.iosxr.devices.configuration.rsvp.ltrace.dbg_err, null)
    ltrace_buffer_multiplier_intf                        = try(local.device_config[device.name].rsvp.ltrace.intf, local.defaults.iosxr.devices.configuration.rsvp.ltrace.intf, null)
    ltrace_buffer_multiplier_rare                        = try(local.device_config[device.name].rsvp.ltrace.rare, local.defaults.iosxr.devices.configuration.rsvp.ltrace.rare, null)
    ltrace_buffer_multiplier_sig                         = try(local.device_config[device.name].rsvp.ltrace.sig, local.defaults.iosxr.devices.configuration.rsvp.ltrace.sig, null)
    ltrace_buffer_multiplier_sig_err                     = try(local.device_config[device.name].rsvp.ltrace.sig_err, local.defaults.iosxr.devices.configuration.rsvp.ltrace.sig_err, null)
    ltrace_buffer_multiplier_sync                        = try(local.device_config[device.name].rsvp.ltrace.sync, local.defaults.iosxr.devices.configuration.rsvp.ltrace.sync, null)
    signalling_checksum_disable                          = try(local.device_config[device.name].rsvp.signalling.checksum_disable, local.defaults.iosxr.devices.configuration.rsvp.signalling.checksum_disable, null)
    signalling_event_per_pulse                           = try(local.device_config[device.name].rsvp.signalling.event_per_pulse, local.defaults.iosxr.devices.configuration.rsvp.signalling.event_per_pulse, null)
    signalling_graceful_restart                          = try(local.device_config[device.name].rsvp.signalling.graceful_restart, local.defaults.iosxr.devices.configuration.rsvp.signalling.graceful_restart, null)
    signalling_graceful_restart_lsp_ctype                = try(local.device_config[device.name].rsvp.signalling.graceful_restart_lsp_ctype, local.defaults.iosxr.devices.configuration.rsvp.signalling.graceful_restart_lsp_ctype, null)
    signalling_graceful_restart_recovery_time            = try(local.device_config[device.name].rsvp.signalling.graceful_restart_recovery_time, local.defaults.iosxr.devices.configuration.rsvp.signalling.graceful_restart_recovery_time, null)
    signalling_graceful_restart_restart_time             = try(local.device_config[device.name].rsvp.signalling.graceful_restart_restart_time, local.defaults.iosxr.devices.configuration.rsvp.signalling.graceful_restart_restart_time, null)
    signalling_hello_graceful_restart_refresh_interval   = try(local.device_config[device.name].rsvp.signalling.hello_graceful_restart_refresh_interval, local.defaults.iosxr.devices.configuration.rsvp.signalling.hello_graceful_restart_refresh_interval, null)
    signalling_hello_graceful_restart_refresh_misses     = try(local.device_config[device.name].rsvp.signalling.hello_graceful_restart_refresh_misses, local.defaults.iosxr.devices.configuration.rsvp.signalling.hello_graceful_restart_refresh_misses, null)
    signalling_message_bundle_disable                    = try(local.device_config[device.name].rsvp.signalling.message_bundle_disable, local.defaults.iosxr.devices.configuration.rsvp.signalling.message_bundle_disable, null)
    signalling_nodeid_subobject_disable                  = try(local.device_config[device.name].rsvp.signalling.nodeid_subobject_disable, local.defaults.iosxr.devices.configuration.rsvp.signalling.nodeid_subobject_disable, null)
    signalling_oob_vrf                                   = try(local.device_config[device.name].rsvp.signalling.oob_vrf, local.defaults.iosxr.devices.configuration.rsvp.signalling.oob_vrf, null)
    signalling_patherr_state_removal_disable             = try(local.device_config[device.name].rsvp.signalling.patherr_state_removal_disable, local.defaults.iosxr.devices.configuration.rsvp.signalling.patherr_state_removal_disable, null)
    signalling_prefix_filtering_acl                      = try(local.device_config[device.name].rsvp.signalling.prefix_filtering_acl, local.defaults.iosxr.devices.configuration.rsvp.signalling.prefix_filtering_acl, null)
    signalling_prefix_filtering_default_deny_action_drop = try(local.device_config[device.name].rsvp.signalling.prefix_filtering_default_deny_action_drop, local.defaults.iosxr.devices.configuration.rsvp.signalling.prefix_filtering_default_deny_action_drop, null)
    neighbors = try(length(local.device_config[device.name].rsvp.neighbors) == 0, true) ? null : [for neighbor in local.device_config[device.name].rsvp.neighbors : {
      address                    = try(neighbor.address, local.defaults.iosxr.devices.configuration.rsvp.neighbors.address, null)
      authentication_key_chain   = try(neighbor.authentication.key_chain, local.defaults.iosxr.devices.configuration.rsvp.neighbors.authentication.key_chain, null)
      authentication_life_time   = try(neighbor.authentication.life_time, local.defaults.iosxr.devices.configuration.rsvp.neighbors.authentication.life_time, null)
      authentication_window_size = try(neighbor.authentication.window_size, local.defaults.iosxr.devices.configuration.rsvp.neighbors.authentication.window_size, null)
    }]
    interfaces = try(length(local.device_config[device.name].rsvp.interfaces) == 0, true) ? null : [for intf in local.device_config[device.name].rsvp.interfaces : {
      interface_name                                               = try(intf.name, local.defaults.iosxr.devices.configuration.rsvp.interfaces.name, null)
      authentication_key_chain                                     = try(intf.authentication.key_chain, local.defaults.iosxr.devices.configuration.rsvp.interfaces.authentication.key_chain, null)
      authentication_life_time                                     = try(intf.authentication.life_time, local.defaults.iosxr.devices.configuration.rsvp.interfaces.authentication.life_time, null)
      authentication_window_size                                   = try(intf.authentication.window_size, local.defaults.iosxr.devices.configuration.rsvp.interfaces.authentication.window_size, null)
      bandwidth_bc0_flow                                           = try(intf.bandwidth.bc0_flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.bc0_flow, null)
      bandwidth_bc0_total                                          = try(intf.bandwidth.bc0_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.bc0_total, null)
      bandwidth_bc1_total                                          = try(intf.bandwidth.bc1_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.bc1_total, null)
      bandwidth_default                                            = try(intf.bandwidth.default, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.default, null)
      bandwidth_flow                                               = try(intf.bandwidth.flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.flow, null)
      bandwidth_global_pool_flow                                   = try(intf.bandwidth.global_pool_flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.global_pool_flow, null)
      bandwidth_global_pool_total                                  = try(intf.bandwidth.global_pool_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.global_pool_total, null)
      bandwidth_mam_bc0_total                                      = try(intf.bandwidth.mam.bc0, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.mam.bc0, null)
      bandwidth_mam_bc1_total                                      = try(intf.bandwidth.mam.bc1, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.mam.bc1, null)
      bandwidth_mam_flow                                           = try(intf.bandwidth.mam.flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.mam.flow, null)
      bandwidth_mam_percentage_bc0_total                           = try(intf.bandwidth.mam.percentage.bc0, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.mam.percentage.bc0, null)
      bandwidth_mam_percentage_bc1_total                           = try(intf.bandwidth.mam.percentage.bc1, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.mam.percentage.bc1, null)
      bandwidth_mam_percentage_flow                                = try(intf.bandwidth.mam.percentage.flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.mam.percentage.flow, null)
      bandwidth_mam_percentage_total                               = try(intf.bandwidth.mam.percentage.total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.mam.percentage.total, null)
      bandwidth_mam_total                                          = try(intf.bandwidth.mam.total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.mam.total, null)
      bandwidth_percentage_bc0_flow                                = try(intf.bandwidth.percentage.bc0_flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.percentage.bc0_flow, null)
      bandwidth_percentage_bc0_total                               = try(intf.bandwidth.percentage.bc0_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.percentage.bc0_total, null)
      bandwidth_percentage_bc1_total                               = try(intf.bandwidth.percentage.bc1_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.percentage.bc1_total, null)
      bandwidth_percentage_flow                                    = try(intf.bandwidth.percentage.flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.percentage.flow, null)
      bandwidth_percentage_global_pool_flow                        = try(intf.bandwidth.percentage.global_pool_flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.percentage.global_pool_flow, null)
      bandwidth_percentage_global_pool_total                       = try(intf.bandwidth.percentage.global_pool_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.percentage.global_pool_total, null)
      bandwidth_percentage_sub_pool_total                          = try(intf.bandwidth.percentage.sub_pool_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.percentage.sub_pool_total, null)
      bandwidth_percentage_total                                   = try(intf.bandwidth.percentage.total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.percentage.total, null)
      bandwidth_rdm_bc0_flow                                       = try(intf.bandwidth.rdm.bc0_flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.bc0_flow, null)
      bandwidth_rdm_bc0_total                                      = try(intf.bandwidth.rdm.bc0_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.bc0_total, null)
      bandwidth_rdm_bc1_total                                      = try(intf.bandwidth.rdm.bc1_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.bc1_total, null)
      bandwidth_rdm_flow                                           = try(intf.bandwidth.rdm.flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.flow, null)
      bandwidth_rdm_global_pool_flow                               = try(intf.bandwidth.rdm.global_pool_flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.global_pool_flow, null)
      bandwidth_rdm_global_pool_total                              = try(intf.bandwidth.rdm.global_pool_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.global_pool_total, null)
      bandwidth_rdm_percentage_bc0_flow                            = try(intf.bandwidth.rdm.percentage.bc0_flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.percentage.bc0_flow, null)
      bandwidth_rdm_percentage_bc0_total                           = try(intf.bandwidth.rdm.percentage.bc0_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.percentage.bc0_total, null)
      bandwidth_rdm_percentage_bc1_total                           = try(intf.bandwidth.rdm.percentage.bc1_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.percentage.bc1_total, null)
      bandwidth_rdm_percentage_flow                                = try(intf.bandwidth.rdm.percentage.flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.percentage.flow, null)
      bandwidth_rdm_percentage_global_pool_flow                    = try(intf.bandwidth.rdm.percentage.global_pool_flow, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.percentage.global_pool_flow, null)
      bandwidth_rdm_percentage_global_pool_total                   = try(intf.bandwidth.rdm.percentage.global_pool_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.percentage.global_pool_total, null)
      bandwidth_rdm_percentage_sub_pool_total                      = try(intf.bandwidth.rdm.percentage.sub_pool_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.percentage.sub_pool_total, null)
      bandwidth_rdm_percentage_total                               = try(intf.bandwidth.rdm.percentage.total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.percentage.total, null)
      bandwidth_rdm_sub_pool_total                                 = try(intf.bandwidth.rdm.sub_pool_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.sub_pool_total, null)
      bandwidth_rdm_total                                          = try(intf.bandwidth.rdm.total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.rdm.total, null)
      bandwidth_sub_pool_total                                     = try(intf.bandwidth.sub_pool_total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.sub_pool_total, null)
      bandwidth_total                                              = try(intf.bandwidth.total, local.defaults.iosxr.devices.configuration.rsvp.interfaces.bandwidth.total, null)
      signalling_dscp                                              = try(intf.signalling.dscp, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.dscp, null)
      signalling_hello_graceful_restart_interface_based            = try(intf.signalling.hello_graceful_restart_interface_based, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.hello_graceful_restart_interface_based, null)
      signalling_rate_limit_enable                                 = try(intf.signalling.rate_limit_enable, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.rate_limit_enable, null)
      signalling_rate_limit_interval                               = try(intf.signalling.rate_limit_interval, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.rate_limit_interval, null)
      signalling_rate_limit_rate                                   = try(intf.signalling.rate_limit_rate, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.rate_limit_rate, null)
      signalling_refresh_interval                                  = try(intf.signalling.refresh_interval, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.refresh_interval, null)
      signalling_refresh_missed                                    = try(intf.signalling.refresh_missed, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.refresh_missed, null)
      signalling_refresh_oob_interval                              = try(intf.signalling.refresh_oob_interval, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.refresh_oob_interval, null)
      signalling_refresh_oob_missed                                = try(intf.signalling.refresh_oob_missed, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.refresh_oob_missed, null)
      signalling_refresh_reduction_bundle_max_size                 = try(intf.signalling.refresh_reduction_bundle_max_size, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.refresh_reduction_bundle_max_size, null)
      signalling_refresh_reduction_disable                         = try(intf.signalling.refresh_reduction_disable, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.refresh_reduction_disable, null)
      signalling_refresh_reduction_reliable_ack_hold_time          = try(intf.signalling.refresh_reduction_reliable_ack_hold_time, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.refresh_reduction_reliable_ack_hold_time, null)
      signalling_refresh_reduction_reliable_ack_max_size           = try(intf.signalling.refresh_reduction_reliable_ack_max_size, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.refresh_reduction_reliable_ack_max_size, null)
      signalling_refresh_reduction_reliable_retransmit_queue_depth = try(intf.signalling.refresh_reduction_reliable_retransmit_queue_depth, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.refresh_reduction_reliable_retransmit_queue_depth, null)
      signalling_refresh_reduction_reliable_retransmit_time        = try(intf.signalling.refresh_reduction_reliable_retransmit_time, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.refresh_reduction_reliable_retransmit_time, null)
      signalling_refresh_reduction_reliable_summary_refresh        = try(intf.signalling.refresh_reduction_reliable_summary_refresh, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.refresh_reduction_reliable_summary_refresh, null)
      signalling_refresh_reduction_summary_max_size                = try(intf.signalling.refresh_reduction_summary_max_size, local.defaults.iosxr.devices.configuration.rsvp.interfaces.signalling.refresh_reduction_summary_max_size, null)
    }]
  } if try(local.device_config[device.name].rsvp, null) != null || try(local.defaults.iosxr.devices.configuration.rsvp, null) != null }
}

resource "iosxr_rsvp" "rsvp" {
  for_each                                             = local.rsvp
  device                                               = each.key
  authentication_key_chain                             = each.value.authentication_key_chain
  authentication_life_time                             = each.value.authentication_life_time
  authentication_retransmit                            = each.value.authentication_retransmit
  authentication_window_size                           = each.value.authentication_window_size
  bandwidth_mam_percentage_max_reservable_bandwidth    = each.value.bandwidth_mam_percentage_max_reservable_bandwidth
  bandwidth_mam_percentage_max_reservable_bc0          = each.value.bandwidth_mam_percentage_max_reservable_bc0
  bandwidth_mam_percentage_max_reservable_bc1          = each.value.bandwidth_mam_percentage_max_reservable_bc1
  bandwidth_rdm_percentage_max_reservable_bc0          = each.value.bandwidth_rdm_percentage_max_reservable_bc0
  bandwidth_rdm_percentage_max_reservable_bc1          = each.value.bandwidth_rdm_percentage_max_reservable_bc1
  latency_threshold                                    = each.value.latency_threshold
  logging_events_issu                                  = each.value.logging_events_issu
  logging_events_nsr                                   = each.value.logging_events_nsr
  ltrace_buffer_multiplier                             = each.value.ltrace_buffer_multiplier
  ltrace_buffer_multiplier_common                      = each.value.ltrace_buffer_multiplier_common
  ltrace_buffer_multiplier_dbg_err                     = each.value.ltrace_buffer_multiplier_dbg_err
  ltrace_buffer_multiplier_intf                        = each.value.ltrace_buffer_multiplier_intf
  ltrace_buffer_multiplier_rare                        = each.value.ltrace_buffer_multiplier_rare
  ltrace_buffer_multiplier_sig                         = each.value.ltrace_buffer_multiplier_sig
  ltrace_buffer_multiplier_sig_err                     = each.value.ltrace_buffer_multiplier_sig_err
  ltrace_buffer_multiplier_sync                        = each.value.ltrace_buffer_multiplier_sync
  signalling_checksum_disable                          = each.value.signalling_checksum_disable
  signalling_event_per_pulse                           = each.value.signalling_event_per_pulse
  signalling_graceful_restart                          = each.value.signalling_graceful_restart
  signalling_graceful_restart_lsp_ctype                = each.value.signalling_graceful_restart_lsp_ctype
  signalling_graceful_restart_recovery_time            = each.value.signalling_graceful_restart_recovery_time
  signalling_graceful_restart_restart_time             = each.value.signalling_graceful_restart_restart_time
  signalling_hello_graceful_restart_refresh_interval   = each.value.signalling_hello_graceful_restart_refresh_interval
  signalling_hello_graceful_restart_refresh_misses     = each.value.signalling_hello_graceful_restart_refresh_misses
  signalling_message_bundle_disable                    = each.value.signalling_message_bundle_disable
  signalling_nodeid_subobject_disable                  = each.value.signalling_nodeid_subobject_disable
  signalling_oob_vrf                                   = each.value.signalling_oob_vrf
  signalling_patherr_state_removal_disable             = each.value.signalling_patherr_state_removal_disable
  signalling_prefix_filtering_acl                      = each.value.signalling_prefix_filtering_acl
  signalling_prefix_filtering_default_deny_action_drop = each.value.signalling_prefix_filtering_default_deny_action_drop
  neighbors                                            = each.value.neighbors
  interfaces                                           = each.value.interfaces

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_ipv4_access_list.ipv4_access_list
  ]
}
