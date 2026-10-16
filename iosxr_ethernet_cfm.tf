##### Ethernet CFM #####

locals {
  ethernet_cfm = { for device in local.devices : device.name => {
    traceroute_cache_hold_time = try(local.device_config[device.name].ethernet_cfm.traceroute_cache_hold_time, local.defaults.iosxr.devices.configuration.ethernet_cfm.traceroute_cache_hold_time, null)
    traceroute_cache_size      = try(local.device_config[device.name].ethernet_cfm.traceroute_cache_size, local.defaults.iosxr.devices.configuration.ethernet_cfm.traceroute_cache_size, null)
    domains = try(length(local.device_config[device.name].ethernet_cfm.domains) == 0, true) ? null : [for domain in local.device_config[device.name].ethernet_cfm.domains : {
      domain_name            = try(domain.name, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.name, null)
      level                  = try(domain.level, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.level, null)
      id_dns                 = try(domain.id.dns, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.id.dns, null)
      id_mac_address         = try(provider::utils::normalize_mac(try(domain.id.mac_address.address, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.id.mac_address.address), "colon"), null)
      id_mac_address_integer = try(domain.id.mac_address.integer, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.id.mac_address.integer, null)
      id_null                = try(domain.id.no_mdid, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.id.no_mdid, null)
      id_string              = try(domain.id.string, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.id.string, null)
      services = try(length(domain.services) == 0, true) ? null : [for service in domain.services : {
        service_name                             = try(service.name, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.name, null)
        bridge_group                             = try(service.bridge_group, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.bridge_group, null)
        bridge_domain                            = try(service.bridge_domain, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.bridge_domain, null)
        down_meps                                = try(service.down_meps, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.down_meps, null)
        flexible_xconnect_vlan_aware_evi         = try(service.flexible_xconnect.vlan_aware_evi, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.flexible_xconnect.vlan_aware_evi, null)
        flexible_xconnect_vlan_unaware_name      = try(service.flexible_xconnect.vlan_unaware_name, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.flexible_xconnect.vlan_unaware_name, null)
        xconnect_mp2mp_group                     = try(service.xconnect.mp2mp, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.xconnect.mp2mp, null) != null ? try(service.xconnect.group, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.xconnect.group, null) : null
        xconnect_mp2mp_name                      = try(service.xconnect.mp2mp.name, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.xconnect.mp2mp.name, null)
        xconnect_mp2mp_ce_id                     = try(service.xconnect.mp2mp.ce_id, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.xconnect.mp2mp.ce_id, null)
        xconnect_mp2mp_remote_ce_id              = try(service.xconnect.mp2mp.remote_ce_id, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.xconnect.mp2mp.remote_ce_id, null)
        xconnect_p2p_group_name                  = try(service.xconnect.p2p, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.xconnect.p2p, null) != null ? try(service.xconnect.group, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.xconnect.group, null) : null
        xconnect_p2p_xc_name                     = try(service.xconnect.p2p, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.xconnect.p2p, null)
        id_icc_based_icc                         = try(service.id.icc_based.icc, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.id.icc_based.icc, null)
        id_icc_based_umc                         = try(service.id.icc_based.umc, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.id.icc_based.umc, null)
        id_vlan_id                               = try(service.id.vlan_id, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.id.vlan_id, null)
        id_number                                = try(service.id.number, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.id.number, null)
        id_string                                = try(service.id.string, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.id.string, null)
        id_vpn_id_oui                            = try(parseint(split(":", try(service.id.vpn_id, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.id.vpn_id))[0], 16), null)
        id_vpn_id_index                          = try(parseint(split(":", try(service.id.vpn_id, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.id.vpn_id))[1], 16), null)
        tags                                     = try(tostring(try(service.tags, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.tags)), null)
        mip_auto_create_all                      = try(service.mip_auto_create.mode, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.mip_auto_create.mode, null) == "all" ? true : null
        mip_auto_create_lower_mep_only           = try(service.mip_auto_create.mode, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.mip_auto_create.mode, null) == "lower-mep-only" ? true : null
        mip_auto_create_ccm_learning             = try(service.mip_auto_create.ccm_learning, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.mip_auto_create.ccm_learning, null)
        efd                                      = try(service.efd.enable, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.efd.enable, try(service.efd, null) != null ? true : null)
        efd_protection_switching                 = try(service.efd.protection_switching, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.efd.protection_switching, null)
        continuity_check_interval                = try(service.continuity_check.interval, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.continuity_check.interval, null)
        continuity_check_interval_loss_threshold = try(service.continuity_check.loss_threshold, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.continuity_check.loss_threshold, null)
        continuity_check_archive_hold_time       = try(service.continuity_check.archive_hold_time, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.continuity_check.archive_hold_time, null)
        continuity_check_loss_auto_traceroute    = try(service.continuity_check.loss_auto_traceroute, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.continuity_check.loss_auto_traceroute, null)
        maximum_meps                             = try(service.maximum_meps, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.maximum_meps, null)
        ais_transmission_interval                = try(service.ais.transmission_interval, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.ais.transmission_interval, null)
        ais_transmission_cos                     = try(service.ais.transmission_cos, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.ais.transmission_cos, null)
        log_continuity_check_mep_changes         = try(service.log.continuity_check_mep_changes, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.log.continuity_check_mep_changes, null)
        log_continuity_check_errors              = try(service.log.continuity_check_errors, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.log.continuity_check_errors, null)
        log_crosscheck_errors                    = try(service.log.crosscheck_errors, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.log.crosscheck_errors, null)
        log_ais                                  = try(service.log.ais, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.log.ais, null)
        log_csf                                  = try(service.log.csf, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.log.csf, null)
        log_efd                                  = try(service.log.efd, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.log.efd, null)
        mep_crosscheck_auto                      = try(service.mep_crosscheck.auto, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.mep_crosscheck.auto, null)
        mep_crosschecks = try(length(service.mep_crosscheck.meps) == 0, true) ? null : [for mep in service.mep_crosscheck.meps : {
          mep_id      = try(mep.mep_id, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.mep_crosscheck.meps.mep_id, null)
          mac_address = try(provider::utils::normalize_mac(try(mep.mac_address, local.defaults.iosxr.devices.configuration.ethernet_cfm.domains.services.mep_crosscheck.meps.mac_address), "colon"), null)
        }]
      }]
    }]
  } if try(local.device_config[device.name].ethernet_cfm, null) != null || try(local.defaults.iosxr.devices.configuration.ethernet_cfm, null) != null }
}

resource "iosxr_ethernet_cfm" "ethernet_cfm" {
  for_each                   = local.ethernet_cfm
  device                     = each.key
  traceroute_cache_hold_time = each.value.traceroute_cache_hold_time
  traceroute_cache_size      = each.value.traceroute_cache_size
  domains                    = each.value.domains
}
