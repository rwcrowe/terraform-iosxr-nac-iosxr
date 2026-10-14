##### MACsec #####

locals {
  macsec = flatten([
    for device in local.devices : [
      {
        key         = device.name
        device_name = device.name
        shutdown    = try(local.device_config[device.name].macsec.shutdown, local.defaults.iosxr.devices.configuration.macsec.shutdown, null)
        fips        = try(local.device_config[device.name].macsec.fips, local.defaults.iosxr.devices.configuration.macsec.fips, null)
      }
    ] if try(local.device_config[device.name].macsec.shutdown, local.defaults.iosxr.devices.configuration.macsec.shutdown, null) != null ||
    try(local.device_config[device.name].macsec.fips, local.defaults.iosxr.devices.configuration.macsec.fips, null) != null
  ])
}

resource "iosxr_macsec" "macsec" {
  for_each = { for v in local.macsec : v.key => v }
  device   = each.value.device_name
  shutdown = each.value.shutdown
  fips     = each.value.fips
}

##### MACsec Policy #####

locals {
  macsec_policies = flatten([
    for device in local.devices : [
      for policy in try(local.device_config[device.name].macsec.policies, []) : {
        key                                = format("%s/%s", device.name, policy.name)
        device_name                        = device.name
        policy_name                        = policy.name
        allow_lacp_in_clear                = try(policy.allow_lacp_in_clear, local.defaults.iosxr.devices.configuration.macsec.policies.allow_lacp_in_clear, null)
        allow_lldp_in_clear                = try(policy.allow_lldp_in_clear, local.defaults.iosxr.devices.configuration.macsec.policies.allow_lldp_in_clear, null)
        allow_pause_frame_in_clear         = try(policy.allow_pause_frame_in_clear, local.defaults.iosxr.devices.configuration.macsec.policies.allow_pause_frame_in_clear, null)
        allow_ptp_in_clear                 = local.device_is_26x[device.name] ? try(policy.allow_ptp_in_clear, local.defaults.iosxr.devices.configuration.macsec.policies.allow_ptp_in_clear, null) : null
        cipher_suite                       = try(policy.cipher_suite, local.defaults.iosxr.devices.configuration.macsec.policies.cipher_suite, null)
        conf_offset                        = try(policy.conf_offset, local.defaults.iosxr.devices.configuration.macsec.policies.conf_offset, null)
        delay_protection                   = try(policy.delay_protection, local.defaults.iosxr.devices.configuration.macsec.policies.delay_protection, null)
        enable_fault_detection             = local.device_is_26x[device.name] ? try(policy.enable_fault_detection, local.defaults.iosxr.devices.configuration.macsec.policies.enable_fault_detection, null) : null
        enable_legacy_fallback             = try(policy.enable_legacy_fallback, local.defaults.iosxr.devices.configuration.macsec.policies.enable_legacy_fallback, null)
        enable_legacy_sak_write            = try(policy.enable_legacy_sak_write, local.defaults.iosxr.devices.configuration.macsec.policies.enable_legacy_sak_write, null)
        impose_overhead_on_bundle          = try(policy.impose_overhead_on_bundle, local.defaults.iosxr.devices.configuration.macsec.policies.impose_overhead_on_bundle, null)
        include_icv_indicator              = try(policy.include_icv_indicator, local.defaults.iosxr.devices.configuration.macsec.policies.include_icv_indicator, null)
        key_server_priority                = try(policy.key_server_priority, local.defaults.iosxr.devices.configuration.macsec.policies.key_server_priority, null)
        logging_sak_rekey_disable          = try(policy.logging_sak_rekey_disable, local.defaults.iosxr.devices.configuration.macsec.policies.logging_sak_rekey_disable, null)
        logging_sak_rekey_summary_interval = try(policy.logging_sak_rekey_summary_interval, local.defaults.iosxr.devices.configuration.macsec.policies.logging_sak_rekey_summary_interval, null)
        max_an                             = try(tostring(try(policy.max_an, local.defaults.iosxr.devices.configuration.macsec.policies.max_an, null)), null)
        policy_exception                   = try(policy.policy_exception, local.defaults.iosxr.devices.configuration.macsec.policies.policy_exception, null)
        ppk                                = try(policy.ppk_sks_profile, local.defaults.iosxr.devices.configuration.macsec.policies.ppk_sks_profile, null) != null ? true : null
        ppk_sks_profile                    = try(policy.ppk_sks_profile, local.defaults.iosxr.devices.configuration.macsec.policies.ppk_sks_profile, null)
        sak_rekey_interval_minutes         = try(policy.sak_rekey_interval_minutes, local.defaults.iosxr.devices.configuration.macsec.policies.sak_rekey_interval_minutes, null)
        sak_rekey_interval_seconds         = try(policy.sak_rekey_interval_seconds, local.defaults.iosxr.devices.configuration.macsec.policies.sak_rekey_interval_seconds, null)
        security_policy                    = try(policy.security_policy, local.defaults.iosxr.devices.configuration.macsec.policies.security_policy, null)
        suspend_for_disable                = try(policy.suspend_for_disable, local.defaults.iosxr.devices.configuration.macsec.policies.suspend_for_disable, null)
        suspend_on_request_disable         = try(policy.suspend_on_request_disable, local.defaults.iosxr.devices.configuration.macsec.policies.suspend_on_request_disable, null)
        use_eapol_pae_in_icv               = try(policy.use_eapol_pae_in_icv, local.defaults.iosxr.devices.configuration.macsec.policies.use_eapol_pae_in_icv, null)
        vlan_tags_in_clear                 = try(policy.vlan_tags_in_clear, local.defaults.iosxr.devices.configuration.macsec.policies.vlan_tags_in_clear, null)
        window_size                        = try(policy.window_size, local.defaults.iosxr.devices.configuration.macsec.policies.window_size, null)
      }
    ]
  ])
}

resource "iosxr_macsec_policy" "macsec_policy" {
  for_each                           = { for v in local.macsec_policies : v.key => v }
  device                             = each.value.device_name
  policy_name                        = each.value.policy_name
  allow_lacp_in_clear                = each.value.allow_lacp_in_clear
  allow_lldp_in_clear                = each.value.allow_lldp_in_clear
  allow_pause_frame_in_clear         = each.value.allow_pause_frame_in_clear
  allow_ptp_in_clear                 = each.value.allow_ptp_in_clear
  cipher_suite                       = each.value.cipher_suite
  conf_offset                        = each.value.conf_offset
  delay_protection                   = each.value.delay_protection
  enable_fault_detection             = each.value.enable_fault_detection
  enable_legacy_fallback             = each.value.enable_legacy_fallback
  enable_legacy_sak_write            = each.value.enable_legacy_sak_write
  impose_overhead_on_bundle          = each.value.impose_overhead_on_bundle
  include_icv_indicator              = each.value.include_icv_indicator
  key_server_priority                = each.value.key_server_priority
  logging_sak_rekey_disable          = each.value.logging_sak_rekey_disable
  logging_sak_rekey_summary_interval = each.value.logging_sak_rekey_summary_interval
  max_an                             = each.value.max_an
  policy_exception                   = each.value.policy_exception
  ppk                                = each.value.ppk
  ppk_sks_profile                    = each.value.ppk_sks_profile
  sak_rekey_interval_minutes         = each.value.sak_rekey_interval_minutes
  sak_rekey_interval_seconds         = each.value.sak_rekey_interval_seconds
  security_policy                    = each.value.security_policy
  suspend_for_disable                = each.value.suspend_for_disable
  suspend_on_request_disable         = each.value.suspend_on_request_disable
  use_eapol_pae_in_icv               = each.value.use_eapol_pae_in_icv
  vlan_tags_in_clear                 = each.value.vlan_tags_in_clear
  window_size                        = each.value.window_size
}
