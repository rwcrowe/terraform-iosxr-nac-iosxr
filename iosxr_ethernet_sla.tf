##### Ethernet SLA #####

locals {
  ethernet_sla_profiles = flatten([
    for device in local.devices : [
      for profile in try(local.device_config[device.name].ethernet_sla.profiles, []) : {
        key                                           = format("%s/%s", device.name, try(profile.name, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.name, null))
        device_name                                   = device.name
        profile_name                                  = try(profile.name, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.name, null)
        type                                          = try(profile.type, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.type, null)
        probe_send_packet_once                        = try(profile.probe.send_packet_once, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_packet_once, null)
        probe_send_packet_every_interval              = try(profile.probe.send_packet_every_interval, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_packet_every_interval, null)
        probe_send_packet_every_milliseconds          = try(profile.probe.send_packet_every_unit, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_packet_every_unit, null) == "milliseconds" ? true : null
        probe_send_packet_every_seconds               = try(profile.probe.send_packet_every_unit, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_packet_every_unit, null) == "seconds" ? true : null
        probe_send_packet_every_minutes               = try(profile.probe.send_packet_every_unit, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_packet_every_unit, null) == "minutes" ? true : null
        probe_send_packet_every_hours                 = try(profile.probe.send_packet_every_unit, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_packet_every_unit, null) == "hours" ? true : null
        probe_send_burst_once                         = try(profile.probe.send_burst_once, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_burst_once, null)
        probe_send_burst_every_interval               = try(profile.probe.send_burst_every_interval, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_burst_every_interval, null)
        probe_send_burst_every_seconds                = try(profile.probe.send_burst_every_unit, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_burst_every_unit, null) == "seconds" ? true : null
        probe_send_burst_every_minutes                = try(profile.probe.send_burst_every_unit, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_burst_every_unit, null) == "minutes" ? true : null
        probe_send_burst_every_hours                  = try(profile.probe.send_burst_every_unit, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_burst_every_unit, null) == "hours" ? true : null
        probe_send_burst_packet_count                 = try(profile.probe.send_burst_packet_count, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_burst_packet_count, null)
        probe_send_burst_packet_interval_seconds      = try(profile.probe.send_burst_packet_interval_unit, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_burst_packet_interval_unit, null) == "seconds" ? try(profile.probe.send_burst_packet_interval, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_burst_packet_interval, null) : null
        probe_send_burst_packet_interval_milliseconds = try(profile.probe.send_burst_packet_interval_unit, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_burst_packet_interval_unit, null) == "milliseconds" ? try(profile.probe.send_burst_packet_interval, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.send_burst_packet_interval, null) : null
        probe_packet_size                             = try(profile.probe.packet_size, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.packet_size, null)
        probe_priority                                = try(profile.probe.priority, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.priority, null)
        probe_synthetic_loss_calculation_packets      = try(profile.probe.synthetic_loss_calculation_packets, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.probe.synthetic_loss_calculation_packets, null)
        statistics_measure = try(length(profile.statistics_measures) == 0, true) ? null : [for measure in profile.statistics_measures : {
          type                                         = try(measure.type, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.type, null)
          aggregate_none                               = try(measure.aggregate.none, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.aggregate.none, null)
          aggregate_bins                               = try(measure.aggregate.bins, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.aggregate.bins, null)
          aggregate_width                              = try(measure.aggregate.width, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.aggregate.width, null)
          aggregate_usec                               = try(measure.aggregate.width_usec, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.aggregate.width_usec, null)
          aggregate_minimum_delay                      = local.device_is_25x[device.name] ? try(measure.aggregate.minimum_delay, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.aggregate.minimum_delay, null) : null
          aggregate_usec_minimum_delay                 = local.device_is_25x[device.name] ? try(measure.aggregate.minimum_delay_usec, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.aggregate.minimum_delay_usec, null) : null
          buckets_size                                 = try(measure.buckets.size, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.buckets.size, null)
          buckets_probes                               = try(measure.buckets.size, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.buckets.size, null) != null ? true : null
          buckets_archive                              = try(measure.buckets.archive, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.buckets.archive, null)
          thresholds_stateful_log_on_max_value         = try(measure.thresholds.stateful_log.max_value, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.thresholds.stateful_log.max_value, null)
          thresholds_stateful_log_on_mean_value        = try(measure.thresholds.stateful_log.mean_value, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.thresholds.stateful_log.mean_value, null)
          thresholds_stateful_log_on_sample_count      = try(measure.thresholds.stateful_log.sample_count, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.thresholds.stateful_log.sample_count, null)
          thresholds_stateful_log_on_in_and_above_bin  = try(measure.thresholds.stateful_log.in_and_above_bin, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.thresholds.stateful_log.in_and_above_bin, null)
          thresholds_stateful_efd_on_max_value         = try(measure.thresholds.stateful_efd.max_value, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.thresholds.stateful_efd.max_value, null)
          thresholds_stateful_efd_on_mean_value        = try(measure.thresholds.stateful_efd.mean_value, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.thresholds.stateful_efd.mean_value, null)
          thresholds_stateful_efd_on_sample_count      = try(measure.thresholds.stateful_efd.sample_count, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.thresholds.stateful_efd.sample_count, null)
          thresholds_stateful_efd_on_in_and_above_bin  = try(measure.thresholds.stateful_efd.in_and_above_bin, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.thresholds.stateful_efd.in_and_above_bin, null)
          thresholds_stateless_log_on_max_value        = try(measure.thresholds.stateless_log.max_value, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.thresholds.stateless_log.max_value, null)
          thresholds_stateless_log_on_mean_value       = try(measure.thresholds.stateless_log.mean_value, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.thresholds.stateless_log.mean_value, null)
          thresholds_stateless_log_on_sample_count     = try(measure.thresholds.stateless_log.sample_count, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.thresholds.stateless_log.sample_count, null)
          thresholds_stateless_log_on_in_and_above_bin = try(measure.thresholds.stateless_log.in_and_above_bin, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.statistics_measures.thresholds.stateless_log.in_and_above_bin, null)
        }]
        schedule_every_week_on    = try(profile.schedule.every_week_on, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.schedule.every_week_on, null)
        schedule_every_day        = try(profile.schedule.every_day, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.schedule.every_day, null)
        schedule_every_minutes    = try(profile.schedule.every_unit, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.schedule.every_unit, null) == "minutes" ? try(profile.schedule.every_interval, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.schedule.every_interval, null) : null
        schedule_every_hours      = try(profile.schedule.every_unit, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.schedule.every_unit, null) == "hours" ? try(profile.schedule.every_interval, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.schedule.every_interval, null) : null
        schedule_every_at_hours   = try(parseint(split(":", try(profile.schedule.at, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.schedule.at))[0], 10), null)
        schedule_every_at_minutes = try(parseint(split(":", try(profile.schedule.at, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.schedule.at))[1], 10), null)
        schedule_every_for_time   = try(profile.schedule.for_time, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.schedule.for_time, null)
        schedule_every_for_unit   = try(profile.schedule.for_unit, local.defaults.iosxr.devices.configuration.ethernet_sla.profiles.schedule.for_unit, null)
      }
    ]
  ])
}

resource "iosxr_ethernet_sla" "ethernet_sla" {
  for_each                                      = { for p in local.ethernet_sla_profiles : p.key => p }
  device                                        = each.value.device_name
  profile_name                                  = each.value.profile_name
  type                                          = each.value.type
  probe_send_packet_once                        = each.value.probe_send_packet_once
  probe_send_packet_every_interval              = each.value.probe_send_packet_every_interval
  probe_send_packet_every_milliseconds          = each.value.probe_send_packet_every_milliseconds
  probe_send_packet_every_seconds               = each.value.probe_send_packet_every_seconds
  probe_send_packet_every_minutes               = each.value.probe_send_packet_every_minutes
  probe_send_packet_every_hours                 = each.value.probe_send_packet_every_hours
  probe_send_burst_once                         = each.value.probe_send_burst_once
  probe_send_burst_every_interval               = each.value.probe_send_burst_every_interval
  probe_send_burst_every_seconds                = each.value.probe_send_burst_every_seconds
  probe_send_burst_every_minutes                = each.value.probe_send_burst_every_minutes
  probe_send_burst_every_hours                  = each.value.probe_send_burst_every_hours
  probe_send_burst_packet_count                 = each.value.probe_send_burst_packet_count
  probe_send_burst_packet_interval_seconds      = each.value.probe_send_burst_packet_interval_seconds
  probe_send_burst_packet_interval_milliseconds = each.value.probe_send_burst_packet_interval_milliseconds
  probe_packet_size                             = each.value.probe_packet_size
  probe_priority                                = each.value.probe_priority
  probe_synthetic_loss_calculation_packets      = each.value.probe_synthetic_loss_calculation_packets
  statistics_measure                            = each.value.statistics_measure
  schedule_every_week_on                        = each.value.schedule_every_week_on
  schedule_every_day                            = each.value.schedule_every_day
  schedule_every_minutes                        = each.value.schedule_every_minutes
  schedule_every_hours                          = each.value.schedule_every_hours
  schedule_every_at_hours                       = each.value.schedule_every_at_hours
  schedule_every_at_minutes                     = each.value.schedule_every_at_minutes
  schedule_every_for_time                       = each.value.schedule_every_for_time
  schedule_every_for_unit                       = each.value.schedule_every_for_unit
}
