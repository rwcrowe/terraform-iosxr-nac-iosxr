##### Frequency Synchronization #####

locals {
  frequency_synchronization = flatten([
    for device in local.devices : [
      {
        key                                     = device.name
        device_name                             = device.name
        clock_identity_mac_address              = try(provider::utils::normalize_mac(try(local.device_config[device.name].frequency_synchronization.clock_identity_mac_address, local.defaults.iosxr.devices.configuration.frequency_synchronization.clock_identity_mac_address, null), "colon"), null)
        clock_interface_timing_mode_independent = try(local.device_config[device.name].frequency_synchronization.clock_interface_timing_mode, local.defaults.iosxr.devices.configuration.frequency_synchronization.clock_interface_timing_mode, null) == "independent" ? true : null
        clock_interface_timing_mode_system      = try(local.device_config[device.name].frequency_synchronization.clock_interface_timing_mode, local.defaults.iosxr.devices.configuration.frequency_synchronization.clock_interface_timing_mode, null) == "system" ? true : null
        log_selection_changes                   = try(local.device_config[device.name].frequency_synchronization.log_selection, local.defaults.iosxr.devices.configuration.frequency_synchronization.log_selection, null) == "changes" ? true : null
        log_selection_errors                    = try(local.device_config[device.name].frequency_synchronization.log_selection, local.defaults.iosxr.devices.configuration.frequency_synchronization.log_selection, null) == "errors" ? true : null
        quality_itu_t_option_one                = try(local.device_config[device.name].frequency_synchronization.quality_itu_t_option, local.defaults.iosxr.devices.configuration.frequency_synchronization.quality_itu_t_option, null) == "one" ? true : null
        quality_itu_t_option_two_generation_one = try(local.device_config[device.name].frequency_synchronization.quality_itu_t_option, local.defaults.iosxr.devices.configuration.frequency_synchronization.quality_itu_t_option, null) == "two-generation-1" ? true : null
        quality_itu_t_option_two_generation_two = try(local.device_config[device.name].frequency_synchronization.quality_itu_t_option, local.defaults.iosxr.devices.configuration.frequency_synchronization.quality_itu_t_option, null) == "two-generation-2" ? true : null
        system_timing_mode_clock_only           = try(local.device_config[device.name].frequency_synchronization.system_timing_mode, local.defaults.iosxr.devices.configuration.frequency_synchronization.system_timing_mode, null) == "clock-only" ? true : null
        system_timing_mode_line_only            = try(local.device_config[device.name].frequency_synchronization.system_timing_mode, local.defaults.iosxr.devices.configuration.frequency_synchronization.system_timing_mode, null) == "line-only" ? true : null
      }
    ] if try(length(local.device_config[device.name].frequency_synchronization) > 0, false) || try(length(local.defaults.iosxr.devices.configuration.frequency_synchronization) > 0, false)
  ])
}

resource "iosxr_frequency_synchronization" "frequency_synchronization" {
  for_each                                = { for v in local.frequency_synchronization : v.key => v }
  device                                  = each.value.device_name
  clock_identity_mac_address              = each.value.clock_identity_mac_address
  clock_interface_timing_mode_independent = each.value.clock_interface_timing_mode_independent
  clock_interface_timing_mode_system      = each.value.clock_interface_timing_mode_system
  log_selection_changes                   = each.value.log_selection_changes
  log_selection_errors                    = each.value.log_selection_errors
  quality_itu_t_option_one                = each.value.quality_itu_t_option_one
  quality_itu_t_option_two_generation_one = each.value.quality_itu_t_option_two_generation_one
  quality_itu_t_option_two_generation_two = each.value.quality_itu_t_option_two_generation_two
  system_timing_mode_clock_only           = each.value.system_timing_mode_clock_only
  system_timing_mode_line_only            = each.value.system_timing_mode_line_only
}
