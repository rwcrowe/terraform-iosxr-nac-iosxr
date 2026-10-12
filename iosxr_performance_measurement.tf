##### Performance Measurement #####

locals {
  performance_measurement = { for device in local.devices : device.name => {
    source_address_ipv4                                                           = try(local.device_config[device.name].performance_measurement.source_address_ipv4, local.defaults.iosxr.devices.configuration.performance_measurement.source_address_ipv4, null)
    source_address_ipv6                                                           = try(local.device_config[device.name].performance_measurement.source_address_ipv6, local.defaults.iosxr.devices.configuration.performance_measurement.source_address_ipv6, null)
    protocol_twamp_light_measurement_delay_unauthenticated_querier_dst_port       = try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.unauthenticated.querier_dst_port, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.unauthenticated.querier_dst_port, null)
    protocol_twamp_light_measurement_delay_unauthenticated_querier_src_port       = try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.unauthenticated.querier_src_port, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.unauthenticated.querier_src_port, null)
    protocol_twamp_light_measurement_delay_unauthenticated_ipv4_timestamp1_label  = try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.unauthenticated.ipv4.timestamp1_label, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.unauthenticated.ipv4.timestamp1_label, null)
    protocol_twamp_light_measurement_delay_unauthenticated_ipv4_timestamp2_label  = try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.unauthenticated.ipv4.timestamp2_label, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.unauthenticated.ipv4.timestamp2_label, null)
    protocol_twamp_light_measurement_delay_unauthenticated_ipv6_timestamp1_label  = try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.unauthenticated.ipv6.timestamp1_label, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.unauthenticated.ipv6.timestamp1_label, null)
    protocol_twamp_light_measurement_delay_unauthenticated_ipv6_timestamp2_label  = try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.unauthenticated.ipv6.timestamp2_label, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.unauthenticated.ipv6.timestamp2_label, null)
    protocol_twamp_light_measurement_delay_responder_allow_querier_ipv4_prefixes  = try(length([for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes, []) : { address = try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes.address, null), length = try(entry.length, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes.length, null) } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes.address, ""))) == false]) == 0, true) ? null : [for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes, []) : { address = try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes.address, null), length = try(entry.length, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes.length, null) } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes.address, ""))) == false]
    protocol_twamp_light_measurement_delay_responder_allow_querier_ipv4_addresses = try(length([for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.addresses, []) : { address = try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.addresses, null) } if can(regex(":", try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.addresses, ""))) == false]) == 0, true) ? null : [for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.addresses, []) : { address = try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.addresses, null) } if can(regex(":", try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.addresses, ""))) == false]
    protocol_twamp_light_measurement_delay_responder_allow_querier_ipv6_prefixes  = try(length([for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes, []) : { address = try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes.address, null), length = try(entry.length, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes.length, null) } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes.address, ""))) == true]) == 0, true) ? null : [for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes, []) : { address = try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes.address, null), length = try(entry.length, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes.length, null) } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.prefixes.address, ""))) == true]
    protocol_twamp_light_measurement_delay_responder_allow_querier_ipv6_addresses = try(length([for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.addresses, []) : { address = try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.addresses, null) } if can(regex(":", try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.addresses, ""))) == true]) == 0, true) ? null : [for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.addresses, []) : { address = try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.addresses, null) } if can(regex(":", try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.responder.allow_querier.addresses, ""))) == true]
    protocol_twamp_light_measurement_delay_querier_allow_responder_ipv4_prefixes  = try(length([for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes, []) : { address = try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes.address, null), length = try(entry.length, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes.length, null) } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes.address, ""))) == false]) == 0, true) ? null : [for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes, []) : { address = try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes.address, null), length = try(entry.length, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes.length, null) } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes.address, ""))) == false]
    protocol_twamp_light_measurement_delay_querier_allow_responder_ipv4_addresses = try(length([for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.addresses, []) : { address = try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.addresses, null) } if can(regex(":", try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.addresses, ""))) == false]) == 0, true) ? null : [for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.addresses, []) : { address = try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.addresses, null) } if can(regex(":", try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.addresses, ""))) == false]
    protocol_twamp_light_measurement_delay_querier_allow_responder_ipv6_prefixes  = try(length([for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes, []) : { address = try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes.address, null), length = try(entry.length, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes.length, null) } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes.address, ""))) == true]) == 0, true) ? null : [for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes, []) : { address = try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes.address, null), length = try(entry.length, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes.length, null) } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.prefixes.address, ""))) == true]
    protocol_twamp_light_measurement_delay_querier_allow_responder_ipv6_addresses = try(length([for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.addresses, []) : { address = try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.addresses, null) } if can(regex(":", try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.addresses, ""))) == true]) == 0, true) ? null : [for entry in try(local.device_config[device.name].performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.addresses, []) : { address = try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.addresses, null) } if can(regex(":", try(entry, local.defaults.iosxr.devices.configuration.performance_measurement.protocol_twamp_light.measurement_delay.querier.allow_responder.addresses, ""))) == true]
    path_tracing                                                                  = try(local.device_config[device.name].performance_measurement.path_tracing.enable, local.defaults.iosxr.devices.configuration.performance_measurement.path_tracing.enable, try(local.device_config[device.name].performance_measurement.path_tracing, null) != null ? true : null)
    path_tracing_timestamp_template_st0                                           = try(local.device_config[device.name].performance_measurement.path_tracing.timestamp_template, local.defaults.iosxr.devices.configuration.performance_measurement.path_tracing.timestamp_template, null) == "st0" ? true : null
    path_tracing_timestamp_template_st1                                           = try(local.device_config[device.name].performance_measurement.path_tracing.timestamp_template, local.defaults.iosxr.devices.configuration.performance_measurement.path_tracing.timestamp_template, null) == "st1" ? true : null
    path_tracing_timestamp_template_st2                                           = try(local.device_config[device.name].performance_measurement.path_tracing.timestamp_template, local.defaults.iosxr.devices.configuration.performance_measurement.path_tracing.timestamp_template, null) == "st2" ? true : null
    path_tracing_timestamp_template_st3                                           = try(local.device_config[device.name].performance_measurement.path_tracing.timestamp_template, local.defaults.iosxr.devices.configuration.performance_measurement.path_tracing.timestamp_template, null) == "st3" ? true : null
  } if try(local.device_config[device.name].performance_measurement, null) != null || try(local.defaults.iosxr.devices.configuration.performance_measurement, null) != null }
}

resource "iosxr_performance_measurement" "performance_measurement" {
  for_each                                                                      = local.performance_measurement
  device                                                                        = each.key
  source_address_ipv4                                                           = each.value.source_address_ipv4
  source_address_ipv6                                                           = each.value.source_address_ipv6
  protocol_twamp_light_measurement_delay_unauthenticated_querier_dst_port       = each.value.protocol_twamp_light_measurement_delay_unauthenticated_querier_dst_port
  protocol_twamp_light_measurement_delay_unauthenticated_querier_src_port       = each.value.protocol_twamp_light_measurement_delay_unauthenticated_querier_src_port
  protocol_twamp_light_measurement_delay_unauthenticated_ipv4_timestamp1_label  = each.value.protocol_twamp_light_measurement_delay_unauthenticated_ipv4_timestamp1_label
  protocol_twamp_light_measurement_delay_unauthenticated_ipv4_timestamp2_label  = each.value.protocol_twamp_light_measurement_delay_unauthenticated_ipv4_timestamp2_label
  protocol_twamp_light_measurement_delay_unauthenticated_ipv6_timestamp1_label  = each.value.protocol_twamp_light_measurement_delay_unauthenticated_ipv6_timestamp1_label
  protocol_twamp_light_measurement_delay_unauthenticated_ipv6_timestamp2_label  = each.value.protocol_twamp_light_measurement_delay_unauthenticated_ipv6_timestamp2_label
  protocol_twamp_light_measurement_delay_responder_allow_querier_ipv4_prefixes  = each.value.protocol_twamp_light_measurement_delay_responder_allow_querier_ipv4_prefixes
  protocol_twamp_light_measurement_delay_responder_allow_querier_ipv4_addresses = each.value.protocol_twamp_light_measurement_delay_responder_allow_querier_ipv4_addresses
  protocol_twamp_light_measurement_delay_responder_allow_querier_ipv6_prefixes  = each.value.protocol_twamp_light_measurement_delay_responder_allow_querier_ipv6_prefixes
  protocol_twamp_light_measurement_delay_responder_allow_querier_ipv6_addresses = each.value.protocol_twamp_light_measurement_delay_responder_allow_querier_ipv6_addresses
  protocol_twamp_light_measurement_delay_querier_allow_responder_ipv4_prefixes  = each.value.protocol_twamp_light_measurement_delay_querier_allow_responder_ipv4_prefixes
  protocol_twamp_light_measurement_delay_querier_allow_responder_ipv4_addresses = each.value.protocol_twamp_light_measurement_delay_querier_allow_responder_ipv4_addresses
  protocol_twamp_light_measurement_delay_querier_allow_responder_ipv6_prefixes  = each.value.protocol_twamp_light_measurement_delay_querier_allow_responder_ipv6_prefixes
  protocol_twamp_light_measurement_delay_querier_allow_responder_ipv6_addresses = each.value.protocol_twamp_light_measurement_delay_querier_allow_responder_ipv6_addresses
  path_tracing                                                                  = each.value.path_tracing
  path_tracing_timestamp_template_st0                                           = each.value.path_tracing_timestamp_template_st0
  path_tracing_timestamp_template_st1                                           = each.value.path_tracing_timestamp_template_st1
  path_tracing_timestamp_template_st2                                           = each.value.path_tracing_timestamp_template_st2
  path_tracing_timestamp_template_st3                                           = each.value.path_tracing_timestamp_template_st3
}

##### Performance Measurement Delay Profile #####

locals {
  performance_measurement_delay_profile = { for device in local.devices : device.name => {
    interfaces_default                                            = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default, null) != null ? true : null
    interfaces_default_probe_computation_interval                 = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.probe.computation_interval, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.probe.computation_interval, null)
    interfaces_default_probe_tx_interval                          = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.probe.tx_interval, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.probe.tx_interval, null)
    interfaces_default_probe_protocol_pm_mpls                     = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.probe.protocol, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.probe.protocol, null) == "pm-mpls" ? true : null
    interfaces_default_probe_protocol_twamp_light                 = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.probe.protocol, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.probe.protocol, null) == "twamp-light" ? true : null
    interfaces_default_probe_tos_traffic_class                    = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.probe.tos.traffic_class, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.probe.tos.traffic_class, null)
    interfaces_default_probe_tos_dscp                             = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.probe.tos.dscp, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.probe.tos.dscp, null)
    interfaces_default_probe_measurement_mode_one_way             = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.probe.measurement_mode, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.probe.measurement_mode, null) == "one-way" ? true : null
    interfaces_default_probe_measurement_mode_two_way             = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.probe.measurement_mode, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.probe.measurement_mode, null) == "two-way" ? true : null
    interfaces_default_probe_timestamp_format_ntp                 = local.device_is_25x[device.name] ? (try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.probe.timestamp_format_ntp, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.probe.timestamp_format_ntp, null)) : null
    interfaces_default_advertisement_periodic_disabled            = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.advertisement.periodic.disabled, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.advertisement.periodic.disabled, null)
    interfaces_default_advertisement_periodic_interval            = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.advertisement.periodic.interval, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.advertisement.periodic.interval, null)
    interfaces_default_advertisement_periodic_threshold           = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.advertisement.periodic.threshold, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.advertisement.periodic.threshold, null)
    interfaces_default_advertisement_periodic_minimum_change      = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.advertisement.periodic.minimum_change, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.advertisement.periodic.minimum_change, null)
    interfaces_default_advertisement_logging_delay_exceeded       = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.advertisement.logging_delay_exceeded, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.advertisement.logging_delay_exceeded, null)
    interfaces_default_advertisement_accelerated                  = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.advertisement.accelerated.enable, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.advertisement.accelerated.enable, try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.advertisement.accelerated, null) != null ? true : null)
    interfaces_default_advertisement_accelerated_threshold        = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.advertisement.accelerated.threshold, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.advertisement.accelerated.threshold, null)
    interfaces_default_advertisement_accelerated_minimum_change   = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.advertisement.accelerated.minimum_change, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.advertisement.accelerated.minimum_change, null)
    interfaces_default_advertisement_anomaly_loss_upper_bound     = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.advertisement.anomaly_loss.upper_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.advertisement.anomaly_loss.upper_bound, null)
    interfaces_default_advertisement_anomaly_loss_lower_bound     = try(local.device_config[device.name].performance_measurement.delay_profiles.interfaces_default.advertisement.anomaly_loss.lower_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.interfaces_default.advertisement.anomaly_loss.lower_bound, null)
    sr_policy_default                                             = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default, null) != null ? true : null
    sr_policy_default_probe_computation_interval                  = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.computation_interval, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.computation_interval, null)
    sr_policy_default_probe_tx_interval                           = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.tx_interval, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.tx_interval, null)
    sr_policy_default_probe_static_delay                          = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.static_delay, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.static_delay, null)
    sr_policy_default_probe_sweep_destination_ipv4                = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.sweep.destination_ipv4, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.sweep.destination_ipv4, null)
    sr_policy_default_probe_sweep_destination_range               = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.sweep.destination_range, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.sweep.destination_range, null)
    sr_policy_default_probe_protocol_pm_mpls                      = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.protocol, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.protocol, null) == "pm-mpls" ? true : null
    sr_policy_default_probe_protocol_twamp_light                  = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.protocol, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.protocol, null) == "twamp-light" ? true : null
    sr_policy_default_probe_tos_traffic_class                     = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.tos.traffic_class, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.tos.traffic_class, null)
    sr_policy_default_probe_tos_dscp                              = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.tos.dscp, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.tos.dscp, null)
    sr_policy_default_probe_measurement_mode_one_way              = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.measurement_mode, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.measurement_mode, null) == "one-way" ? true : null
    sr_policy_default_probe_measurement_mode_two_way              = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.measurement_mode, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.measurement_mode, null) == "two-way" ? true : null
    sr_policy_default_probe_measurement_mode_loopback             = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.measurement_mode, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.measurement_mode, null) == "loopback" ? true : null
    sr_policy_default_probe_collect_hbh                           = local.device_is_25x[device.name] ? (try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.collect_hbh, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.collect_hbh, null)) : null
    sr_policy_default_probe_timestamp_format_ntp                  = local.device_is_25x[device.name] ? (try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.probe.timestamp_format_ntp, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.probe.timestamp_format_ntp, null)) : null
    sr_policy_default_advertisement_logging_delay_exceeded        = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.logging_delay_exceeded, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.logging_delay_exceeded, null)
    sr_policy_default_advertisement_threshold_check_average_delay = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.threshold_check, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.threshold_check, null) == "average-delay" ? true : null
    sr_policy_default_advertisement_threshold_check_minimum_delay = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.threshold_check, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.threshold_check, null) == "minimum-delay" ? true : null
    sr_policy_default_advertisement_threshold_check_maximum_delay = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.threshold_check, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.threshold_check, null) == "maximum-delay" ? true : null
    sr_policy_default_advertisement_periodic_disabled             = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.periodic.disabled, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.periodic.disabled, null)
    sr_policy_default_advertisement_periodic_interval             = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.periodic.interval, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.periodic.interval, null)
    sr_policy_default_advertisement_periodic_threshold            = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.periodic.threshold, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.periodic.threshold, null)
    sr_policy_default_advertisement_periodic_minimum_change       = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.periodic.minimum_change, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.periodic.minimum_change, null)
    sr_policy_default_advertisement_accelerated                   = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.accelerated.enable, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.accelerated.enable, try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.accelerated, null) != null ? true : null)
    sr_policy_default_advertisement_accelerated_threshold         = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.accelerated.threshold, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.accelerated.threshold, null)
    sr_policy_default_advertisement_accelerated_minimum_change    = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.accelerated.minimum_change, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.accelerated.minimum_change, null)
    sr_policy_default_advertisement_anomaly_check_upper_bound     = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.anomaly_check.upper_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.anomaly_check.upper_bound, null)
    sr_policy_default_advertisement_anomaly_check_lower_bound     = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.anomaly_check.lower_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.anomaly_check.lower_bound, null)
    sr_policy_default_advertisement_anomaly_loss_upper_bound      = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.anomaly_loss.upper_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.anomaly_loss.upper_bound, null)
    sr_policy_default_advertisement_anomaly_loss_lower_bound      = try(local.device_config[device.name].performance_measurement.delay_profiles.sr_policy_default.advertisement.anomaly_loss.lower_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.sr_policy_default.advertisement.anomaly_loss.lower_bound, null)
    endpoint_default                                              = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default, null) != null ? true : null
    endpoint_default_probe_tx_interval                            = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.tx_interval, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.tx_interval, null)
    endpoint_default_probe_computation_interval                   = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.computation_interval, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.computation_interval, null)
    endpoint_default_probe_flow_label_explicit                    = try(length(try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.flow_label.explicit_list)) > 0, false) ? true : null
    endpoint_default_probe_flow_label_explicit_list               = try(length(try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.flow_label.explicit_list)) == 0, true) ? null : try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.flow_label.explicit_list, null)
    endpoint_default_probe_flow_label_from                        = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.flow_label.from, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.flow_label.from, null)
    endpoint_default_probe_flow_label_to                          = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.flow_label.to, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.flow_label.to, null)
    endpoint_default_probe_flow_label_increment                   = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.flow_label.increment, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.flow_label.increment, null)
    endpoint_default_probe_sweep_destination_ipv4                 = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.sweep.destination_ipv4, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.sweep.destination_ipv4, null)
    endpoint_default_probe_sweep_destination_range                = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.sweep.destination_range, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.sweep.destination_range, null)
    endpoint_default_probe_measurement_mode_one_way               = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.measurement_mode, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.measurement_mode, null) == "one-way" ? true : null
    endpoint_default_probe_measurement_mode_two_way               = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.measurement_mode, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.measurement_mode, null) == "two-way" ? true : null
    endpoint_default_probe_measurement_mode_loopback              = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.measurement_mode, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.measurement_mode, null) == "loopback" ? true : null
    endpoint_default_probe_tos_dscp                               = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.tos.dscp, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.tos.dscp, null)
    endpoint_default_probe_collect_hbh                            = local.device_is_25x[device.name] ? (try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.collect_hbh, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.collect_hbh, null)) : null
    endpoint_default_probe_timestamp_format_ntp                   = local.device_is_25x[device.name] ? (try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.probe.timestamp_format_ntp, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.probe.timestamp_format_ntp, null)) : null
    endpoint_default_advertisement_logging_delay_exceeded         = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.logging_delay_exceeded, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.logging_delay_exceeded, null)
    endpoint_default_advertisement_threshold_check_average_delay  = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.threshold_check, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.threshold_check, null) == "average-delay" ? true : null
    endpoint_default_advertisement_threshold_check_minimum_delay  = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.threshold_check, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.threshold_check, null) == "minimum-delay" ? true : null
    endpoint_default_advertisement_threshold_check_maximum_delay  = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.threshold_check, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.threshold_check, null) == "maximum-delay" ? true : null
    endpoint_default_advertisement_periodic_disabled              = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.periodic.disabled, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.periodic.disabled, null)
    endpoint_default_advertisement_periodic_interval              = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.periodic.interval, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.periodic.interval, null)
    endpoint_default_advertisement_periodic_threshold             = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.periodic.threshold, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.periodic.threshold, null)
    endpoint_default_advertisement_periodic_minimum_change        = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.periodic.minimum_change, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.periodic.minimum_change, null)
    endpoint_default_advertisement_accelerated                    = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.accelerated.enable, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.accelerated.enable, try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.accelerated, null) != null ? true : null)
    endpoint_default_advertisement_accelerated_threshold          = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.accelerated.threshold, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.accelerated.threshold, null)
    endpoint_default_advertisement_accelerated_minimum_change     = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.accelerated.minimum_change, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.accelerated.minimum_change, null)
    endpoint_default_advertisement_anomaly_check_upper_bound      = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.anomaly_check.upper_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.anomaly_check.upper_bound, null)
    endpoint_default_advertisement_anomaly_check_lower_bound      = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.anomaly_check.lower_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.anomaly_check.lower_bound, null)
    endpoint_default_advertisement_anomaly_loss_upper_bound       = try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.advertisement.anomaly_loss.upper_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.advertisement.anomaly_loss.upper_bound, null)
    endpoint_default_histogram_delay_bins_explicit                = local.device_is_25x[device.name] && !local.device_is_26x[device.name] ? (try(length(try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.histogram_delay_bins_explicit, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.histogram_delay_bins_explicit)) == 0, true) ? null : try(local.device_config[device.name].performance_measurement.delay_profiles.endpoint_default.histogram_delay_bins_explicit, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.endpoint_default.histogram_delay_bins_explicit, null)) : null
    rsvp_te_default_probe_timestamp_format_ntp                    = local.device_is_25x[device.name] ? (try(local.device_config[device.name].performance_measurement.delay_profiles.rsvp_te_default.probe.timestamp_format_ntp, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.rsvp_te_default.probe.timestamp_format_ntp, null)) : null
    profiles = try(length(local.device_config[device.name].performance_measurement.delay_profiles.profiles) == 0, true) ? null : [for profile in local.device_config[device.name].performance_measurement.delay_profiles.profiles : {
      profile_name                            = try(profile.name, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.name, null)
      probe_computation_interval              = try(profile.probe.computation_interval, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.computation_interval, null)
      probe_tx_interval                       = try(profile.probe.tx_interval, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.tx_interval, null)
      probe_static_delay                      = try(profile.probe.static_delay, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.static_delay, null)
      probe_sweep_destination_ipv4            = try(profile.probe.sweep.destination_ipv4, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.sweep.destination_ipv4, null)
      probe_sweep_destination_range           = try(profile.probe.sweep.destination_range, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.sweep.destination_range, null)
      probe_flow_label_explicit               = try(length(try(profile.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.flow_label.explicit_list)) > 0, false) ? true : null
      probe_flow_label_explicit_list          = try(length(try(profile.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.flow_label.explicit_list)) == 0, true) ? null : try(profile.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.flow_label.explicit_list, null)
      probe_flow_label_from                   = try(profile.probe.flow_label.from, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.flow_label.from, null)
      probe_flow_label_to                     = try(profile.probe.flow_label.to, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.flow_label.to, null)
      probe_flow_label_increment              = try(profile.probe.flow_label.increment, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.flow_label.increment, null)
      probe_protocol_pm_mpls                  = try(profile.probe.protocol, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.protocol, null) == "pm-mpls" ? true : null
      probe_protocol_twamp_light              = try(profile.probe.protocol, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.protocol, null) == "twamp-light" ? true : null
      probe_tos_traffic_class                 = try(profile.probe.tos.traffic_class, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.tos.traffic_class, null)
      probe_tos_dscp                          = try(profile.probe.tos.dscp, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.tos.dscp, null)
      probe_measurement_mode_one_way          = try(profile.probe.measurement_mode, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.measurement_mode, null) == "one-way" ? true : null
      probe_measurement_mode_two_way          = try(profile.probe.measurement_mode, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.measurement_mode, null) == "two-way" ? true : null
      probe_measurement_mode_loopback         = try(profile.probe.measurement_mode, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.measurement_mode, null) == "loopback" ? true : null
      probe_collect_hbh                       = local.device_is_25x[device.name] ? (try(profile.probe.collect_hbh, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.collect_hbh, null)) : null
      probe_timestamp_format_ntp              = local.device_is_25x[device.name] ? (try(profile.probe.timestamp_format_ntp, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.probe.timestamp_format_ntp, null)) : null
      advertise_logging_delay_exceeded        = try(profile.advertisement.logging_delay_exceeded, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.logging_delay_exceeded, null)
      advertise_threshold_check_average_delay = try(profile.advertisement.threshold_check, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.threshold_check, null) == "average-delay" ? true : null
      advertise_threshold_check_minimum_delay = try(profile.advertisement.threshold_check, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.threshold_check, null) == "minimum-delay" ? true : null
      advertise_threshold_check_maximum_delay = try(profile.advertisement.threshold_check, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.threshold_check, null) == "maximum-delay" ? true : null
      advertise_periodic_disabled             = try(profile.advertisement.periodic.disabled, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.periodic.disabled, null)
      advertise_periodic_interval             = try(profile.advertisement.periodic.interval, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.periodic.interval, null)
      advertise_periodic_threshold            = try(profile.advertisement.periodic.threshold, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.periodic.threshold, null)
      advertise_periodic_minimum_change       = try(profile.advertisement.periodic.minimum_change, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.periodic.minimum_change, null)
      advertise_accelerated                   = try(profile.advertisement.accelerated.enable, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.accelerated.enable, try(profile.advertisement.accelerated, null) != null ? true : null)
      advertise_accelerated_threshold         = try(profile.advertisement.accelerated.threshold, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.accelerated.threshold, null)
      advertise_accelerated_minimum_change    = try(profile.advertisement.accelerated.minimum_change, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.accelerated.minimum_change, null)
      advertise_anomaly_check_upper_bound     = try(profile.advertisement.anomaly_check.upper_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.anomaly_check.upper_bound, null)
      advertise_anomaly_check_lower_bound     = try(profile.advertisement.anomaly_check.lower_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.anomaly_check.lower_bound, null)
      advertise_anomaly_loss_upper_bound      = try(profile.advertisement.anomaly_loss.upper_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.anomaly_loss.upper_bound, null)
      advertise_anomaly_loss_lower_bound      = try(profile.advertisement.anomaly_loss.lower_bound, local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles.profiles.advertisement.anomaly_loss.lower_bound, null)
    }]
  } if try(local.device_config[device.name].performance_measurement.delay_profiles, null) != null || try(local.defaults.iosxr.devices.configuration.performance_measurement.delay_profiles, null) != null }
}

resource "iosxr_performance_measurement_delay_profile" "performance_measurement_delay_profile" {
  for_each                                                      = local.performance_measurement_delay_profile
  device                                                        = each.key
  interfaces_default                                            = each.value.interfaces_default
  interfaces_default_probe_computation_interval                 = each.value.interfaces_default_probe_computation_interval
  interfaces_default_probe_tx_interval                          = each.value.interfaces_default_probe_tx_interval
  interfaces_default_probe_protocol_pm_mpls                     = each.value.interfaces_default_probe_protocol_pm_mpls
  interfaces_default_probe_protocol_twamp_light                 = each.value.interfaces_default_probe_protocol_twamp_light
  interfaces_default_probe_tos_traffic_class                    = each.value.interfaces_default_probe_tos_traffic_class
  interfaces_default_probe_tos_dscp                             = each.value.interfaces_default_probe_tos_dscp
  interfaces_default_probe_measurement_mode_one_way             = each.value.interfaces_default_probe_measurement_mode_one_way
  interfaces_default_probe_measurement_mode_two_way             = each.value.interfaces_default_probe_measurement_mode_two_way
  interfaces_default_probe_timestamp_format_ntp                 = each.value.interfaces_default_probe_timestamp_format_ntp
  interfaces_default_advertisement_periodic_disabled            = each.value.interfaces_default_advertisement_periodic_disabled
  interfaces_default_advertisement_periodic_interval            = each.value.interfaces_default_advertisement_periodic_interval
  interfaces_default_advertisement_periodic_threshold           = each.value.interfaces_default_advertisement_periodic_threshold
  interfaces_default_advertisement_periodic_minimum_change      = each.value.interfaces_default_advertisement_periodic_minimum_change
  interfaces_default_advertisement_logging_delay_exceeded       = each.value.interfaces_default_advertisement_logging_delay_exceeded
  interfaces_default_advertisement_accelerated                  = each.value.interfaces_default_advertisement_accelerated
  interfaces_default_advertisement_accelerated_threshold        = each.value.interfaces_default_advertisement_accelerated_threshold
  interfaces_default_advertisement_accelerated_minimum_change   = each.value.interfaces_default_advertisement_accelerated_minimum_change
  interfaces_default_advertisement_anomaly_loss_upper_bound     = each.value.interfaces_default_advertisement_anomaly_loss_upper_bound
  interfaces_default_advertisement_anomaly_loss_lower_bound     = each.value.interfaces_default_advertisement_anomaly_loss_lower_bound
  sr_policy_default                                             = each.value.sr_policy_default
  sr_policy_default_probe_computation_interval                  = each.value.sr_policy_default_probe_computation_interval
  sr_policy_default_probe_tx_interval                           = each.value.sr_policy_default_probe_tx_interval
  sr_policy_default_probe_static_delay                          = each.value.sr_policy_default_probe_static_delay
  sr_policy_default_probe_sweep_destination_ipv4                = each.value.sr_policy_default_probe_sweep_destination_ipv4
  sr_policy_default_probe_sweep_destination_range               = each.value.sr_policy_default_probe_sweep_destination_range
  sr_policy_default_probe_protocol_pm_mpls                      = each.value.sr_policy_default_probe_protocol_pm_mpls
  sr_policy_default_probe_protocol_twamp_light                  = each.value.sr_policy_default_probe_protocol_twamp_light
  sr_policy_default_probe_tos_traffic_class                     = each.value.sr_policy_default_probe_tos_traffic_class
  sr_policy_default_probe_tos_dscp                              = each.value.sr_policy_default_probe_tos_dscp
  sr_policy_default_probe_measurement_mode_one_way              = each.value.sr_policy_default_probe_measurement_mode_one_way
  sr_policy_default_probe_measurement_mode_two_way              = each.value.sr_policy_default_probe_measurement_mode_two_way
  sr_policy_default_probe_measurement_mode_loopback             = each.value.sr_policy_default_probe_measurement_mode_loopback
  sr_policy_default_probe_collect_hbh                           = each.value.sr_policy_default_probe_collect_hbh
  sr_policy_default_probe_timestamp_format_ntp                  = each.value.sr_policy_default_probe_timestamp_format_ntp
  sr_policy_default_advertisement_logging_delay_exceeded        = each.value.sr_policy_default_advertisement_logging_delay_exceeded
  sr_policy_default_advertisement_threshold_check_average_delay = each.value.sr_policy_default_advertisement_threshold_check_average_delay
  sr_policy_default_advertisement_threshold_check_minimum_delay = each.value.sr_policy_default_advertisement_threshold_check_minimum_delay
  sr_policy_default_advertisement_threshold_check_maximum_delay = each.value.sr_policy_default_advertisement_threshold_check_maximum_delay
  sr_policy_default_advertisement_periodic_disabled             = each.value.sr_policy_default_advertisement_periodic_disabled
  sr_policy_default_advertisement_periodic_interval             = each.value.sr_policy_default_advertisement_periodic_interval
  sr_policy_default_advertisement_periodic_threshold            = each.value.sr_policy_default_advertisement_periodic_threshold
  sr_policy_default_advertisement_periodic_minimum_change       = each.value.sr_policy_default_advertisement_periodic_minimum_change
  sr_policy_default_advertisement_accelerated                   = each.value.sr_policy_default_advertisement_accelerated
  sr_policy_default_advertisement_accelerated_threshold         = each.value.sr_policy_default_advertisement_accelerated_threshold
  sr_policy_default_advertisement_accelerated_minimum_change    = each.value.sr_policy_default_advertisement_accelerated_minimum_change
  sr_policy_default_advertisement_anomaly_check_upper_bound     = each.value.sr_policy_default_advertisement_anomaly_check_upper_bound
  sr_policy_default_advertisement_anomaly_check_lower_bound     = each.value.sr_policy_default_advertisement_anomaly_check_lower_bound
  sr_policy_default_advertisement_anomaly_loss_upper_bound      = each.value.sr_policy_default_advertisement_anomaly_loss_upper_bound
  sr_policy_default_advertisement_anomaly_loss_lower_bound      = each.value.sr_policy_default_advertisement_anomaly_loss_lower_bound
  endpoint_default                                              = each.value.endpoint_default
  endpoint_default_probe_tx_interval                            = each.value.endpoint_default_probe_tx_interval
  endpoint_default_probe_computation_interval                   = each.value.endpoint_default_probe_computation_interval
  endpoint_default_probe_flow_label_explicit                    = each.value.endpoint_default_probe_flow_label_explicit
  endpoint_default_probe_flow_label_explicit_list               = each.value.endpoint_default_probe_flow_label_explicit_list
  endpoint_default_probe_flow_label_from                        = each.value.endpoint_default_probe_flow_label_from
  endpoint_default_probe_flow_label_to                          = each.value.endpoint_default_probe_flow_label_to
  endpoint_default_probe_flow_label_increment                   = each.value.endpoint_default_probe_flow_label_increment
  endpoint_default_probe_sweep_destination_ipv4                 = each.value.endpoint_default_probe_sweep_destination_ipv4
  endpoint_default_probe_sweep_destination_range                = each.value.endpoint_default_probe_sweep_destination_range
  endpoint_default_probe_measurement_mode_one_way               = each.value.endpoint_default_probe_measurement_mode_one_way
  endpoint_default_probe_measurement_mode_two_way               = each.value.endpoint_default_probe_measurement_mode_two_way
  endpoint_default_probe_measurement_mode_loopback              = each.value.endpoint_default_probe_measurement_mode_loopback
  endpoint_default_probe_tos_dscp                               = each.value.endpoint_default_probe_tos_dscp
  endpoint_default_probe_collect_hbh                            = each.value.endpoint_default_probe_collect_hbh
  endpoint_default_probe_timestamp_format_ntp                   = each.value.endpoint_default_probe_timestamp_format_ntp
  endpoint_default_advertisement_logging_delay_exceeded         = each.value.endpoint_default_advertisement_logging_delay_exceeded
  endpoint_default_advertisement_threshold_check_average_delay  = each.value.endpoint_default_advertisement_threshold_check_average_delay
  endpoint_default_advertisement_threshold_check_minimum_delay  = each.value.endpoint_default_advertisement_threshold_check_minimum_delay
  endpoint_default_advertisement_threshold_check_maximum_delay  = each.value.endpoint_default_advertisement_threshold_check_maximum_delay
  endpoint_default_advertisement_periodic_disabled              = each.value.endpoint_default_advertisement_periodic_disabled
  endpoint_default_advertisement_periodic_interval              = each.value.endpoint_default_advertisement_periodic_interval
  endpoint_default_advertisement_periodic_threshold             = each.value.endpoint_default_advertisement_periodic_threshold
  endpoint_default_advertisement_periodic_minimum_change        = each.value.endpoint_default_advertisement_periodic_minimum_change
  endpoint_default_advertisement_accelerated                    = each.value.endpoint_default_advertisement_accelerated
  endpoint_default_advertisement_accelerated_threshold          = each.value.endpoint_default_advertisement_accelerated_threshold
  endpoint_default_advertisement_accelerated_minimum_change     = each.value.endpoint_default_advertisement_accelerated_minimum_change
  endpoint_default_advertisement_anomaly_check_upper_bound      = each.value.endpoint_default_advertisement_anomaly_check_upper_bound
  endpoint_default_advertisement_anomaly_check_lower_bound      = each.value.endpoint_default_advertisement_anomaly_check_lower_bound
  endpoint_default_advertisement_anomaly_loss_upper_bound       = each.value.endpoint_default_advertisement_anomaly_loss_upper_bound
  endpoint_default_histogram_delay_bins_explicit                = each.value.endpoint_default_histogram_delay_bins_explicit
  rsvp_te_default_probe_timestamp_format_ntp                    = each.value.rsvp_te_default_probe_timestamp_format_ntp
  profiles                                                      = each.value.profiles

  depends_on = [
    iosxr_performance_measurement.performance_measurement
  ]
}

##### Performance Measurement Liveness Profile #####

locals {
  performance_measurement_liveness_profile = { for device in local.devices : device.name => {
    sr_policy_default                                        = try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default, null) != null ? true : null
    sr_policy_default_liveness_detection_multiplier          = try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default.liveness_detection.multiplier, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.sr_policy_default.liveness_detection.multiplier, null)
    sr_policy_default_npu_offload                            = try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default.liveness_detection.npu_offload, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.sr_policy_default.liveness_detection.npu_offload, null)
    sr_policy_default_probe_tx_interval                      = try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default.probe.tx_interval, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.sr_policy_default.probe.tx_interval, null)
    sr_policy_default_probe_flow_label_explicit              = try(length(try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.sr_policy_default.probe.flow_label.explicit_list)) > 0, false) ? true : null
    sr_policy_default_probe_flow_label_explicit_list         = try(length(try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.sr_policy_default.probe.flow_label.explicit_list)) == 0, true) ? null : try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.sr_policy_default.probe.flow_label.explicit_list, null)
    sr_policy_default_probe_flow_label_from                  = try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default.probe.flow_label.from, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.sr_policy_default.probe.flow_label.from, null)
    sr_policy_default_probe_flow_label_to                    = try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default.probe.flow_label.to, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.sr_policy_default.probe.flow_label.to, null)
    sr_policy_default_probe_flow_label_increment             = try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default.probe.flow_label.increment, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.sr_policy_default.probe.flow_label.increment, null)
    sr_policy_default_probe_sweep_destination_ipv4           = try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default.probe.sweep.destination_ipv4, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.sr_policy_default.probe.sweep.destination_ipv4, null)
    sr_policy_default_probe_sweep_destination_range          = try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default.probe.sweep.destination_range, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.sr_policy_default.probe.sweep.destination_range, null)
    sr_policy_default_probe_tos_dscp                         = try(local.device_config[device.name].performance_measurement.liveness_profiles.sr_policy_default.probe.tos.dscp, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.sr_policy_default.probe.tos.dscp, null)
    endpoint_default                                         = try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default, null) != null ? true : null
    endpoint_default_liveness_detection_multiplier           = try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.liveness_detection.multiplier, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.liveness_detection.multiplier, null)
    endpoint_default_liveness_detection_logging_state_change = try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.liveness_detection.logging_state_change, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.liveness_detection.logging_state_change, null)
    endpoint_default_liveness_detection_npu_offload          = local.device_is_25x[device.name] ? (try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.liveness_detection.npu_offload, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.liveness_detection.npu_offload, null)) : null
    endpoint_default_probe_tx_interval                       = try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.probe.tx_interval, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.probe.tx_interval, null)
    endpoint_default_probe_flow_label_explicit               = try(length(try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.probe.flow_label.explicit_list)) > 0, false) ? true : null
    endpoint_default_probe_flow_label_explicit_list          = try(length(try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.probe.flow_label.explicit_list)) == 0, true) ? null : try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.probe.flow_label.explicit_list, null)
    endpoint_default_probe_flow_label_from                   = try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.probe.flow_label.from, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.probe.flow_label.from, null)
    endpoint_default_probe_flow_label_to                     = try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.probe.flow_label.to, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.probe.flow_label.to, null)
    endpoint_default_probe_flow_label_increment              = try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.probe.flow_label.increment, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.probe.flow_label.increment, null)
    endpoint_default_probe_sweep_destination_ipv4            = try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.probe.sweep.destination_ipv4, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.probe.sweep.destination_ipv4, null)
    endpoint_default_probe_sweep_destination_range           = try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.probe.sweep.destination_range, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.probe.sweep.destination_range, null)
    endpoint_default_probe_tos_dscp                          = try(local.device_config[device.name].performance_measurement.liveness_profiles.endpoint_default.probe.tos.dscp, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.endpoint_default.probe.tos.dscp, null)
    profiles = try(length(local.device_config[device.name].performance_measurement.liveness_profiles.profiles) == 0, true) ? null : [for profile in local.device_config[device.name].performance_measurement.liveness_profiles.profiles : {
      profile_name                            = try(profile.name, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.name, null)
      liveness_detection_multiplier           = try(profile.liveness_detection.multiplier, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.liveness_detection.multiplier, null)
      liveness_detection_logging_state_change = try(profile.liveness_detection.logging_state_change, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.liveness_detection.logging_state_change, null)
      npu_offload                             = try(profile.liveness_detection.npu_offload, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.liveness_detection.npu_offload, null)
      probe_tx_interval                       = try(profile.probe.tx_interval, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.probe.tx_interval, null)
      probe_flow_label_explicit               = try(length(try(profile.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.probe.flow_label.explicit_list)) > 0, false) ? true : null
      probe_flow_label_explicit_list          = try(length(try(profile.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.probe.flow_label.explicit_list)) == 0, true) ? null : try(profile.probe.flow_label.explicit_list, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.probe.flow_label.explicit_list, null)
      probe_flow_label_from                   = try(profile.probe.flow_label.from, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.probe.flow_label.from, null)
      probe_flow_label_to                     = try(profile.probe.flow_label.to, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.probe.flow_label.to, null)
      probe_flow_label_increment              = try(profile.probe.flow_label.increment, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.probe.flow_label.increment, null)
      probe_sweep_destination_ipv4            = try(profile.probe.sweep.destination_ipv4, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.probe.sweep.destination_ipv4, null)
      probe_sweep_destination_range           = try(profile.probe.sweep.destination_range, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.probe.sweep.destination_range, null)
      probe_tos_dscp                          = try(profile.probe.tos.dscp, local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles.profiles.probe.tos.dscp, null)
    }]
  } if try(local.device_config[device.name].performance_measurement.liveness_profiles, null) != null || try(local.defaults.iosxr.devices.configuration.performance_measurement.liveness_profiles, null) != null }
}

resource "iosxr_performance_measurement_liveness_profile" "performance_measurement_liveness_profile" {
  for_each                                                 = local.performance_measurement_liveness_profile
  device                                                   = each.key
  sr_policy_default                                        = each.value.sr_policy_default
  sr_policy_default_liveness_detection_multiplier          = each.value.sr_policy_default_liveness_detection_multiplier
  sr_policy_default_npu_offload                            = each.value.sr_policy_default_npu_offload
  sr_policy_default_probe_tx_interval                      = each.value.sr_policy_default_probe_tx_interval
  sr_policy_default_probe_flow_label_explicit              = each.value.sr_policy_default_probe_flow_label_explicit
  sr_policy_default_probe_flow_label_explicit_list         = each.value.sr_policy_default_probe_flow_label_explicit_list
  sr_policy_default_probe_flow_label_from                  = each.value.sr_policy_default_probe_flow_label_from
  sr_policy_default_probe_flow_label_to                    = each.value.sr_policy_default_probe_flow_label_to
  sr_policy_default_probe_flow_label_increment             = each.value.sr_policy_default_probe_flow_label_increment
  sr_policy_default_probe_sweep_destination_ipv4           = each.value.sr_policy_default_probe_sweep_destination_ipv4
  sr_policy_default_probe_sweep_destination_range          = each.value.sr_policy_default_probe_sweep_destination_range
  sr_policy_default_probe_tos_dscp                         = each.value.sr_policy_default_probe_tos_dscp
  endpoint_default                                         = each.value.endpoint_default
  endpoint_default_liveness_detection_multiplier           = each.value.endpoint_default_liveness_detection_multiplier
  endpoint_default_liveness_detection_logging_state_change = each.value.endpoint_default_liveness_detection_logging_state_change
  endpoint_default_liveness_detection_npu_offload          = each.value.endpoint_default_liveness_detection_npu_offload
  endpoint_default_probe_tx_interval                       = each.value.endpoint_default_probe_tx_interval
  endpoint_default_probe_flow_label_explicit               = each.value.endpoint_default_probe_flow_label_explicit
  endpoint_default_probe_flow_label_explicit_list          = each.value.endpoint_default_probe_flow_label_explicit_list
  endpoint_default_probe_flow_label_from                   = each.value.endpoint_default_probe_flow_label_from
  endpoint_default_probe_flow_label_to                     = each.value.endpoint_default_probe_flow_label_to
  endpoint_default_probe_flow_label_increment              = each.value.endpoint_default_probe_flow_label_increment
  endpoint_default_probe_sweep_destination_ipv4            = each.value.endpoint_default_probe_sweep_destination_ipv4
  endpoint_default_probe_sweep_destination_range           = each.value.endpoint_default_probe_sweep_destination_range
  endpoint_default_probe_tos_dscp                          = each.value.endpoint_default_probe_tos_dscp
  profiles                                                 = each.value.profiles

  depends_on = [
    iosxr_performance_measurement.performance_measurement
  ]
}

##### Performance Measurement Interface #####

locals {
  performance_measurement_interfaces = flatten([
    for device in local.devices : [
      for interface in try(local.device_config[device.name].performance_measurement.interfaces, []) : {
        key                                 = format("%s/%s", device.name, interface.interface_name)
        device_name                         = device.name
        interface_name                      = try(interface.interface_name, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.interface_name, null)
        delay_measurement                   = try(interface.delay_measurement.enable, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.delay_measurement.enable, try(interface.delay_measurement, null) != null ? true : null)
        delay_measurement_fallback          = try(interface.delay_measurement.fallback, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.delay_measurement.fallback, null)
        delay_measurement_advertise_delay   = try(interface.delay_measurement.advertise_delay, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.delay_measurement.advertise_delay, null)
        delay_measurement_profile_name      = try(interface.delay_measurement.profile_name, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.delay_measurement.profile_name, null)
        delay_measurement_static_delay      = try(interface.delay_measurement.static_delay, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.delay_measurement.static_delay, null)
        next_hop_ipv4                       = try(interface.next_hop.ipv4, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.next_hop.ipv4, null)
        next_hop_ipv6                       = try(interface.next_hop.ipv6, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.next_hop.ipv6, null)
        path_tracing                        = try(interface.path_tracing.enable, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.path_tracing.enable, try(interface.path_tracing, null) != null ? true : null)
        path_tracing_interface_id           = try(interface.path_tracing.interface_id, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.path_tracing.interface_id, null)
        path_tracing_timestamp_template_st0 = try(interface.path_tracing.timestamp_template, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.path_tracing.timestamp_template, null) == "st0" ? true : null
        path_tracing_timestamp_template_st1 = try(interface.path_tracing.timestamp_template, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.path_tracing.timestamp_template, null) == "st1" ? true : null
        path_tracing_timestamp_template_st2 = try(interface.path_tracing.timestamp_template, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.path_tracing.timestamp_template, null) == "st2" ? true : null
        path_tracing_timestamp_template_st3 = try(interface.path_tracing.timestamp_template, local.defaults.iosxr.devices.configuration.performance_measurement.interfaces.path_tracing.timestamp_template, null) == "st3" ? true : null
      }
    ]
  ])
}

resource "iosxr_performance_measurement_interface" "performance_measurement_interface" {
  for_each                            = { for interface in local.performance_measurement_interfaces : interface.key => interface }
  device                              = each.value.device_name
  interface_name                      = each.value.interface_name
  delay_measurement                   = each.value.delay_measurement
  delay_measurement_fallback          = each.value.delay_measurement_fallback
  delay_measurement_advertise_delay   = each.value.delay_measurement_advertise_delay
  delay_measurement_profile_name      = each.value.delay_measurement_profile_name
  delay_measurement_static_delay      = each.value.delay_measurement_static_delay
  next_hop_ipv4                       = each.value.next_hop_ipv4
  next_hop_ipv6                       = each.value.next_hop_ipv6
  path_tracing                        = each.value.path_tracing
  path_tracing_interface_id           = each.value.path_tracing_interface_id
  path_tracing_timestamp_template_st0 = each.value.path_tracing_timestamp_template_st0
  path_tracing_timestamp_template_st1 = each.value.path_tracing_timestamp_template_st1
  path_tracing_timestamp_template_st2 = each.value.path_tracing_timestamp_template_st2
  path_tracing_timestamp_template_st3 = each.value.path_tracing_timestamp_template_st3

  depends_on = [
    iosxr_performance_measurement.performance_measurement,
    iosxr_performance_measurement_delay_profile.performance_measurement_delay_profile
  ]
}

##### Performance Measurement Endpoint IPV4 #####

locals {
  performance_measurement_endpoints_ipv4 = flatten([
    for device in local.devices : [
      for endpoint in try(local.device_config[device.name].performance_measurement.endpoints, []) : {
        key                                           = format("%s/%s/%s", device.name, endpoint.address, endpoint.vrf_name)
        device_name                                   = device.name
        address                                       = try(endpoint.address, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.address, null)
        vrf_name                                      = try(endpoint.vrf_name, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.vrf_name, null)
        source_address_ipv4                           = try(endpoint.source_address, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.source_address, null)
        description                                   = try(endpoint.description, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.description, null)
        delay_measurement                             = try(endpoint.delay_measurement.enable, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.delay_measurement.enable, try(endpoint.delay_measurement, null) != null ? true : null)
        delay_measurement_profile_name                = try(endpoint.delay_measurement.profile_name, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.delay_measurement.profile_name, null)
        liveness_detection                            = try(endpoint.liveness_detection.enable, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.liveness_detection.enable, try(endpoint.liveness_detection, null) != null ? true : null)
        liveness_detection_profile_name               = try(endpoint.liveness_detection.profile_name, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.liveness_detection.profile_name, null)
        liveness_detection_collect_hbh                = local.device_is_25x[device.name] ? null : try(endpoint.liveness_detection.collect_hbh, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.liveness_detection.collect_hbh, null)
        segment_routing                               = try(endpoint.segment_routing.enable, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.segment_routing.enable, try(endpoint.segment_routing, null) != null ? true : null)
        segment_routing_te_explicit_reverse_path_list = try(endpoint.segment_routing.te_explicit_reverse_path_list, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.segment_routing.te_explicit_reverse_path_list, null)
        segment_list_names = try(length(endpoint.segment_list_names) == 0, true) ? null : [for list_name in endpoint.segment_list_names : {
          list_name = try(list_name, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.segment_list_names, null)
        }]
        segment_routing_te_explicit_segment_lists = try(length(endpoint.segment_routing.te_explicit_segment_lists) == 0, true) ? null : [for segment_list in endpoint.segment_routing.te_explicit_segment_lists : {
          list_name                 = try(segment_list.name, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.segment_routing.te_explicit_segment_lists.name, null)
          reverse_path_segment_list = try(segment_list.reverse_path_segment_list, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.segment_routing.te_explicit_segment_lists.reverse_path_segment_list, null)
          insert_srh_sl_zero        = try(segment_list.insert_srh_sl_zero, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.segment_routing.te_explicit_segment_lists.insert_srh_sl_zero, null)
        }]
      } if can(regex(":", try(endpoint.address, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.address, ""))) == false
    ]
  ])
}

resource "iosxr_performance_measurement_endpoint_ipv4" "performance_measurement_endpoint_ipv4" {
  for_each                                      = { for endpoint in local.performance_measurement_endpoints_ipv4 : endpoint.key => endpoint }
  device                                        = each.value.device_name
  address                                       = each.value.address
  vrf_name                                      = each.value.vrf_name
  source_address_ipv4                           = each.value.source_address_ipv4
  description                                   = each.value.description
  delay_measurement                             = each.value.delay_measurement
  delay_measurement_profile_name                = each.value.delay_measurement_profile_name
  liveness_detection                            = each.value.liveness_detection
  liveness_detection_profile_name               = each.value.liveness_detection_profile_name
  liveness_detection_collect_hbh                = each.value.liveness_detection_collect_hbh
  segment_routing                               = each.value.segment_routing
  segment_routing_te_explicit_reverse_path_list = each.value.segment_routing_te_explicit_reverse_path_list
  segment_list_names                            = each.value.segment_list_names
  segment_routing_te_explicit_segment_lists     = each.value.segment_routing_te_explicit_segment_lists

  depends_on = [
    iosxr_performance_measurement.performance_measurement,
    iosxr_performance_measurement_delay_profile.performance_measurement_delay_profile,
    iosxr_performance_measurement_liveness_profile.performance_measurement_liveness_profile
  ]
}

##### Performance Measurement Endpoint IPV6 #####

locals {
  performance_measurement_endpoints_ipv6 = flatten([
    for device in local.devices : [
      for endpoint in try(local.device_config[device.name].performance_measurement.endpoints, []) : {
        key                                           = format("%s/%s/%s", device.name, endpoint.address, endpoint.vrf_name)
        device_name                                   = device.name
        address                                       = try(endpoint.address, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.address, null)
        vrf_name                                      = try(endpoint.vrf_name, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.vrf_name, null)
        source_address_ipv6                           = try(endpoint.source_address, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.source_address, null)
        description                                   = try(endpoint.description, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.description, null)
        delay_measurement                             = try(endpoint.delay_measurement.enable, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.delay_measurement.enable, try(endpoint.delay_measurement, null) != null ? true : null)
        delay_measurement_profile_name                = try(endpoint.delay_measurement.profile_name, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.delay_measurement.profile_name, null)
        liveness_detection                            = try(endpoint.liveness_detection.enable, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.liveness_detection.enable, try(endpoint.liveness_detection, null) != null ? true : null)
        liveness_detection_profile_name               = try(endpoint.liveness_detection.profile_name, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.liveness_detection.profile_name, null)
        liveness_detection_collect_hbh                = local.device_is_25x[device.name] ? null : try(endpoint.liveness_detection.collect_hbh, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.liveness_detection.collect_hbh, null)
        segment_routing                               = try(endpoint.segment_routing.enable, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.segment_routing.enable, try(endpoint.segment_routing, null) != null ? true : null)
        segment_routing_te_explicit_reverse_path_list = try(endpoint.segment_routing.te_explicit_reverse_path_list, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.segment_routing.te_explicit_reverse_path_list, null)
        segment_list_names = try(length(endpoint.segment_list_names) == 0, true) ? null : [for list_name in endpoint.segment_list_names : {
          list_name = try(list_name, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.segment_list_names, null)
        }]
        segment_routing_te_explicit_segment_lists = try(length(endpoint.segment_routing.te_explicit_segment_lists) == 0, true) ? null : [for segment_list in endpoint.segment_routing.te_explicit_segment_lists : {
          list_name                 = try(segment_list.name, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.segment_routing.te_explicit_segment_lists.name, null)
          reverse_path_segment_list = try(segment_list.reverse_path_segment_list, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.segment_routing.te_explicit_segment_lists.reverse_path_segment_list, null)
          insert_srh_sl_zero        = try(segment_list.insert_srh_sl_zero, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.segment_routing.te_explicit_segment_lists.insert_srh_sl_zero, null)
        }]
      } if can(regex(":", try(endpoint.address, local.defaults.iosxr.devices.configuration.performance_measurement.endpoints.address, ""))) == true
    ]
  ])
}

resource "iosxr_performance_measurement_endpoint_ipv6" "performance_measurement_endpoint_ipv6" {
  for_each                                      = { for endpoint in local.performance_measurement_endpoints_ipv6 : endpoint.key => endpoint }
  device                                        = each.value.device_name
  address                                       = each.value.address
  vrf_name                                      = each.value.vrf_name
  source_address_ipv6                           = each.value.source_address_ipv6
  description                                   = each.value.description
  delay_measurement                             = each.value.delay_measurement
  delay_measurement_profile_name                = each.value.delay_measurement_profile_name
  liveness_detection                            = each.value.liveness_detection
  liveness_detection_profile_name               = each.value.liveness_detection_profile_name
  liveness_detection_collect_hbh                = each.value.liveness_detection_collect_hbh
  segment_routing                               = each.value.segment_routing
  segment_routing_te_explicit_reverse_path_list = each.value.segment_routing_te_explicit_reverse_path_list
  segment_list_names                            = each.value.segment_list_names
  segment_routing_te_explicit_segment_lists     = each.value.segment_routing_te_explicit_segment_lists

  depends_on = [
    iosxr_performance_measurement.performance_measurement,
    iosxr_performance_measurement_delay_profile.performance_measurement_delay_profile,
    iosxr_performance_measurement_liveness_profile.performance_measurement_liveness_profile
  ]
}
