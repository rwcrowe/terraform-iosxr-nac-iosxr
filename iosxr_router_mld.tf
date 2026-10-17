##### Router MLD #####

locals {
  router_mld = { for device in local.devices : device.name => {
    nsf_lifetime                           = try(local.device_config[device.name].router_mld.nsf_lifetime, local.defaults.iosxr.devices.configuration.router_mld.nsf_lifetime, null)
    robustness_variable                    = try(local.device_config[device.name].router_mld.robustness_variable, local.defaults.iosxr.devices.configuration.router_mld.robustness_variable, null)
    maximum_groups                         = try(local.device_config[device.name].router_mld.maximum_groups, local.defaults.iosxr.devices.configuration.router_mld.maximum_groups, null)
    maximum_groups_per_interface           = try(local.device_config[device.name].router_mld.maximum_groups_per_interface, local.defaults.iosxr.devices.configuration.router_mld.maximum_groups_per_interface, null)
    maximum_groups_per_interface_threshold = try(local.device_config[device.name].router_mld.maximum_groups_per_interface_threshold, local.defaults.iosxr.devices.configuration.router_mld.maximum_groups_per_interface_threshold, null)
    maximum_groups_per_interface_acl       = try(local.device_config[device.name].router_mld.maximum_groups_per_interface_acl, local.defaults.iosxr.devices.configuration.router_mld.maximum_groups_per_interface_acl, null)
    version                                = try(local.device_config[device.name].router_mld.version, local.defaults.iosxr.devices.configuration.router_mld.version, null)
    query_interval                         = try(local.device_config[device.name].router_mld.query_interval, local.defaults.iosxr.devices.configuration.router_mld.query_interval, null)
    query_timeout                          = try(local.device_config[device.name].router_mld.query_timeout, local.defaults.iosxr.devices.configuration.router_mld.query_timeout, null)
    query_max_response_time                = try(local.device_config[device.name].router_mld.query_max_response_time, local.defaults.iosxr.devices.configuration.router_mld.query_max_response_time, null)
    explicit_tracking                      = try(local.device_config[device.name].router_mld.explicit_tracking, local.defaults.iosxr.devices.configuration.router_mld.explicit_tracking, null)
    explicit_tracking_acl                  = try(local.device_config[device.name].router_mld.explicit_tracking_acl, local.defaults.iosxr.devices.configuration.router_mld.explicit_tracking_acl, null)
    explicit_tracking_disable              = try(local.device_config[device.name].router_mld.explicit_tracking_disable, local.defaults.iosxr.devices.configuration.router_mld.explicit_tracking_disable, null)
    access_group                           = try(local.device_config[device.name].router_mld.access_group, local.defaults.iosxr.devices.configuration.router_mld.access_group, null)
    ssm_map_query_dns                      = try(local.device_config[device.name].router_mld.ssm_map_query_dns, local.defaults.iosxr.devices.configuration.router_mld.ssm_map_query_dns, null)
    missed_packets_gen_query               = try(local.device_config[device.name].router_mld.missed_packets_gen_query, local.defaults.iosxr.devices.configuration.router_mld.missed_packets_gen_query, null)
    missed_packets_grp_spec_query          = try(local.device_config[device.name].router_mld.missed_packets_grp_spec_query, local.defaults.iosxr.devices.configuration.router_mld.missed_packets_grp_spec_query, null)
    missed_packets_ssm_query               = try(local.device_config[device.name].router_mld.missed_packets_ssm_query, local.defaults.iosxr.devices.configuration.router_mld.missed_packets_ssm_query, null)
    missed_packets_member_report           = try(local.device_config[device.name].router_mld.missed_packets_member_report, local.defaults.iosxr.devices.configuration.router_mld.missed_packets_member_report, null)
    ssm_map_statics = try(length(local.device_config[device.name].router_mld.ssm_map_statics) == 0, true) ? null : [for s in local.device_config[device.name].router_mld.ssm_map_statics : {
      address     = try(s.address, local.defaults.iosxr.devices.configuration.router_mld.ssm_map_statics.address, null)
      access_list = try(s.access_list, local.defaults.iosxr.devices.configuration.router_mld.ssm_map_statics.access_list, null)
    }]
    interfaces = try(length(local.device_config[device.name].router_mld.interfaces) == 0, true) ? null : [for intf in local.device_config[device.name].router_mld.interfaces : {
      interface_name                         = try(intf.name, local.defaults.iosxr.devices.configuration.router_mld.interfaces.name, null)
      version                                = try(intf.version, local.defaults.iosxr.devices.configuration.router_mld.interfaces.version, null)
      router_enable                          = try(intf.router_enable, local.defaults.iosxr.devices.configuration.router_mld.interfaces.router_enable, null)
      router_disable                         = try(intf.router_disable, local.defaults.iosxr.devices.configuration.router_mld.interfaces.router_disable, null)
      dvmrp_enable                           = try(intf.dvmrp_enable, local.defaults.iosxr.devices.configuration.router_mld.interfaces.dvmrp_enable, null)
      query_interval                         = try(intf.query_interval, local.defaults.iosxr.devices.configuration.router_mld.interfaces.query_interval, null)
      query_timeout                          = try(intf.query_timeout, local.defaults.iosxr.devices.configuration.router_mld.interfaces.query_timeout, null)
      query_max_response_time                = try(intf.query_max_response_time, local.defaults.iosxr.devices.configuration.router_mld.interfaces.query_max_response_time, null)
      explicit_tracking_enable               = try(intf.explicit_tracking_enable, local.defaults.iosxr.devices.configuration.router_mld.interfaces.explicit_tracking_enable, null)
      explicit_tracking_disable              = try(intf.explicit_tracking_disable, local.defaults.iosxr.devices.configuration.router_mld.interfaces.explicit_tracking_disable, null)
      explicit_tracking_acl                  = try(intf.explicit_tracking_acl, local.defaults.iosxr.devices.configuration.router_mld.interfaces.explicit_tracking_acl, null)
      access_group                           = try(intf.access_group, local.defaults.iosxr.devices.configuration.router_mld.interfaces.access_group, null)
      maximum_groups_per_interface           = try(intf.maximum_groups_per_interface, local.defaults.iosxr.devices.configuration.router_mld.interfaces.maximum_groups_per_interface, null)
      maximum_groups_per_interface_threshold = try(intf.maximum_groups_per_interface_threshold, local.defaults.iosxr.devices.configuration.router_mld.interfaces.maximum_groups_per_interface_threshold, null)
      maximum_groups_per_interface_acl       = try(intf.maximum_groups_per_interface_acl, local.defaults.iosxr.devices.configuration.router_mld.interfaces.maximum_groups_per_interface_acl, null)
      static_groups = try(length(intf.static_groups) == 0, true) ? null : [for sg in intf.static_groups : {
        group_address      = try(sg.group_address, local.defaults.iosxr.devices.configuration.router_mld.interfaces.static_groups.group_address, null)
        group_address_only = try(sg.group_address_only, local.defaults.iosxr.devices.configuration.router_mld.interfaces.static_groups.group_address_only, null)
        suppress_reports   = try(sg.suppress_reports, local.defaults.iosxr.devices.configuration.router_mld.interfaces.static_groups.suppress_reports, null)
        group_masks = try(length(sg.group_masks) == 0, true) ? null : [for gm in sg.group_masks : {
          group_inc_mask   = try(gm.group_inc_mask, local.defaults.iosxr.devices.configuration.router_mld.interfaces.static_groups.group_masks.group_inc_mask, null)
          group_count      = try(gm.group_count, local.defaults.iosxr.devices.configuration.router_mld.interfaces.static_groups.group_masks.group_count, null)
          suppress_reports = try(gm.suppress_reports, local.defaults.iosxr.devices.configuration.router_mld.interfaces.static_groups.group_masks.suppress_reports, null)
        }]
        source_addresses = try(length(sg.source_addresses) == 0, true) ? null : [for sa in sg.source_addresses : {
          source_ip        = try(sa.source_ip, local.defaults.iosxr.devices.configuration.router_mld.interfaces.static_groups.source_addresses.source_ip, null)
          suppress_reports = try(sa.suppress_reports, local.defaults.iosxr.devices.configuration.router_mld.interfaces.static_groups.source_addresses.suppress_reports, null)
        }]
        group_masks_source_addresses = try(length(sg.group_masks_source_addresses) == 0, true) ? null : [for gs in sg.group_masks_source_addresses : {
          group_inc_mask   = try(gs.group_inc_mask, local.defaults.iosxr.devices.configuration.router_mld.interfaces.static_groups.group_masks_source_addresses.group_inc_mask, null)
          source_ip        = try(gs.source_ip, local.defaults.iosxr.devices.configuration.router_mld.interfaces.static_groups.group_masks_source_addresses.source_ip, null)
          group_count      = try(gs.group_count, local.defaults.iosxr.devices.configuration.router_mld.interfaces.static_groups.group_masks_source_addresses.group_count, null)
          suppress_reports = try(gs.suppress_reports, local.defaults.iosxr.devices.configuration.router_mld.interfaces.static_groups.group_masks_source_addresses.suppress_reports, null)
        }]
      }]
      join_groups = try(length(intf.join_groups) == 0, true) ? null : [for jg in intf.join_groups : {
        group_address      = try(jg.group_address, local.defaults.iosxr.devices.configuration.router_mld.interfaces.join_groups.group_address, null)
        group_address_only = try(jg.group_address_only, local.defaults.iosxr.devices.configuration.router_mld.interfaces.join_groups.group_address_only, null)
        source_addresses = try(length(jg.source_addresses) == 0, true) ? null : [for js in jg.source_addresses : {
          source_ip = try(js.source_ip, local.defaults.iosxr.devices.configuration.router_mld.interfaces.join_groups.source_addresses.source_ip, null)
          include   = try(js.include, local.defaults.iosxr.devices.configuration.router_mld.interfaces.join_groups.source_addresses.include, null)
          exclude   = try(js.exclude, local.defaults.iosxr.devices.configuration.router_mld.interfaces.join_groups.source_addresses.exclude, null)
        }]
      }]
    }]
  } if try(local.device_config[device.name].router_mld, null) != null || try(local.defaults.iosxr.devices.configuration.router_mld, null) != null }
}

resource "iosxr_router_mld" "router_mld" {
  for_each                               = local.router_mld
  device                                 = each.key
  nsf_lifetime                           = each.value.nsf_lifetime
  robustness_variable                    = each.value.robustness_variable
  maximum_groups                         = each.value.maximum_groups
  maximum_groups_per_interface           = each.value.maximum_groups_per_interface
  maximum_groups_per_interface_threshold = each.value.maximum_groups_per_interface_threshold
  maximum_groups_per_interface_acl       = each.value.maximum_groups_per_interface_acl
  version                                = each.value.version
  query_interval                         = each.value.query_interval
  query_timeout                          = each.value.query_timeout
  query_max_response_time                = each.value.query_max_response_time
  explicit_tracking                      = each.value.explicit_tracking
  explicit_tracking_acl                  = each.value.explicit_tracking_acl
  explicit_tracking_disable              = each.value.explicit_tracking_disable
  access_group                           = each.value.access_group
  ssm_map_query_dns                      = each.value.ssm_map_query_dns
  missed_packets_gen_query               = each.value.missed_packets_gen_query
  missed_packets_grp_spec_query          = each.value.missed_packets_grp_spec_query
  missed_packets_ssm_query               = each.value.missed_packets_ssm_query
  missed_packets_member_report           = each.value.missed_packets_member_report
  ssm_map_statics                        = each.value.ssm_map_statics
  interfaces                             = each.value.interfaces
}

##### Router MLD VRF #####

locals {
  router_mld_vrf = flatten([
    for device in local.devices : [
      for vrf in try(local.device_config[device.name].router_mld.vrfs, []) : {
        key                                    = format("%s/%s", device.name, vrf.name)
        device_name                            = device.name
        vrf_name                               = try(vrf.name, local.defaults.iosxr.devices.configuration.router_mld.vrfs.name, null)
        robustness_variable                    = try(vrf.robustness_variable, local.defaults.iosxr.devices.configuration.router_mld.vrfs.robustness_variable, null)
        maximum_groups                         = try(vrf.maximum_groups, local.defaults.iosxr.devices.configuration.router_mld.vrfs.maximum_groups, null)
        maximum_groups_per_interface           = try(vrf.maximum_groups_per_interface, local.defaults.iosxr.devices.configuration.router_mld.vrfs.maximum_groups_per_interface, null)
        maximum_groups_per_interface_threshold = try(vrf.maximum_groups_per_interface_threshold, local.defaults.iosxr.devices.configuration.router_mld.vrfs.maximum_groups_per_interface_threshold, null)
        maximum_groups_per_interface_acl       = try(vrf.maximum_groups_per_interface_acl, local.defaults.iosxr.devices.configuration.router_mld.vrfs.maximum_groups_per_interface_acl, null)
        version                                = try(vrf.version, local.defaults.iosxr.devices.configuration.router_mld.vrfs.version, null)
        query_interval                         = try(vrf.query_interval, local.defaults.iosxr.devices.configuration.router_mld.vrfs.query_interval, null)
        query_timeout                          = try(vrf.query_timeout, local.defaults.iosxr.devices.configuration.router_mld.vrfs.query_timeout, null)
        query_max_response_time                = try(vrf.query_max_response_time, local.defaults.iosxr.devices.configuration.router_mld.vrfs.query_max_response_time, null)
        explicit_tracking                      = try(vrf.explicit_tracking, local.defaults.iosxr.devices.configuration.router_mld.vrfs.explicit_tracking, null)
        explicit_tracking_acl                  = try(vrf.explicit_tracking_acl, local.defaults.iosxr.devices.configuration.router_mld.vrfs.explicit_tracking_acl, null)
        explicit_tracking_disable              = try(vrf.explicit_tracking_disable, local.defaults.iosxr.devices.configuration.router_mld.vrfs.explicit_tracking_disable, null)
        access_group                           = try(vrf.access_group, local.defaults.iosxr.devices.configuration.router_mld.vrfs.access_group, null)
        ssm_map_query_dns                      = try(vrf.ssm_map_query_dns, local.defaults.iosxr.devices.configuration.router_mld.vrfs.ssm_map_query_dns, null)
        missed_packets_gen_query               = try(vrf.missed_packets_gen_query, local.defaults.iosxr.devices.configuration.router_mld.vrfs.missed_packets_gen_query, null)
        missed_packets_grp_spec_query          = try(vrf.missed_packets_grp_spec_query, local.defaults.iosxr.devices.configuration.router_mld.vrfs.missed_packets_grp_spec_query, null)
        missed_packets_ssm_query               = try(vrf.missed_packets_ssm_query, local.defaults.iosxr.devices.configuration.router_mld.vrfs.missed_packets_ssm_query, null)
        missed_packets_member_report           = try(vrf.missed_packets_member_report, local.defaults.iosxr.devices.configuration.router_mld.vrfs.missed_packets_member_report, null)
        ssm_map_statics = try(length(vrf.ssm_map_statics) == 0, true) ? null : [for s in vrf.ssm_map_statics : {
          address     = try(s.address, local.defaults.iosxr.devices.configuration.router_mld.vrfs.ssm_map_statics.address, null)
          access_list = try(s.access_list, local.defaults.iosxr.devices.configuration.router_mld.vrfs.ssm_map_statics.access_list, null)
        }]
        interfaces = try(length(vrf.interfaces) == 0, true) ? null : [for intf in vrf.interfaces : {
          interface_name                         = try(intf.name, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.name, null)
          version                                = try(intf.version, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.version, null)
          router_enable                          = try(intf.router_enable, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.router_enable, null)
          router_disable                         = try(intf.router_disable, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.router_disable, null)
          dvmrp_enable                           = try(intf.dvmrp_enable, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.dvmrp_enable, null)
          query_interval                         = try(intf.query_interval, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.query_interval, null)
          query_timeout                          = try(intf.query_timeout, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.query_timeout, null)
          query_max_response_time                = try(intf.query_max_response_time, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.query_max_response_time, null)
          explicit_tracking_enable               = try(intf.explicit_tracking_enable, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.explicit_tracking_enable, null)
          explicit_tracking_disable              = try(intf.explicit_tracking_disable, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.explicit_tracking_disable, null)
          explicit_tracking_acl                  = try(intf.explicit_tracking_acl, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.explicit_tracking_acl, null)
          access_group                           = try(intf.access_group, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.access_group, null)
          maximum_groups_per_interface           = try(intf.maximum_groups_per_interface, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.maximum_groups_per_interface, null)
          maximum_groups_per_interface_threshold = try(intf.maximum_groups_per_interface_threshold, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.maximum_groups_per_interface_threshold, null)
          maximum_groups_per_interface_acl       = try(intf.maximum_groups_per_interface_acl, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.maximum_groups_per_interface_acl, null)
          static_groups = try(length(intf.static_groups) == 0, true) ? null : [for sg in intf.static_groups : {
            group_address      = try(sg.group_address, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.static_groups.group_address, null)
            group_address_only = try(sg.group_address_only, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.static_groups.group_address_only, null)
            suppress_reports   = try(sg.suppress_reports, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.static_groups.suppress_reports, null)
            group_masks = try(length(sg.group_masks) == 0, true) ? null : [for gm in sg.group_masks : {
              group_inc_mask   = try(gm.group_inc_mask, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.static_groups.group_masks.group_inc_mask, null)
              group_count      = try(gm.group_count, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.static_groups.group_masks.group_count, null)
              suppress_reports = try(gm.suppress_reports, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.static_groups.group_masks.suppress_reports, null)
            }]
            source_addresses = try(length(sg.source_addresses) == 0, true) ? null : [for sa in sg.source_addresses : {
              source_ip        = try(sa.source_ip, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.static_groups.source_addresses.source_ip, null)
              suppress_reports = try(sa.suppress_reports, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.static_groups.source_addresses.suppress_reports, null)
            }]
            group_masks_source_addresses = try(length(sg.group_masks_source_addresses) == 0, true) ? null : [for gs in sg.group_masks_source_addresses : {
              group_inc_mask   = try(gs.group_inc_mask, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.static_groups.group_masks_source_addresses.group_inc_mask, null)
              source_ip        = try(gs.source_ip, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.static_groups.group_masks_source_addresses.source_ip, null)
              group_count      = try(gs.group_count, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.static_groups.group_masks_source_addresses.group_count, null)
              suppress_reports = try(gs.suppress_reports, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.static_groups.group_masks_source_addresses.suppress_reports, null)
            }]
          }]
          join_groups = try(length(intf.join_groups) == 0, true) ? null : [for jg in intf.join_groups : {
            group_address      = try(jg.group_address, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.join_groups.group_address, null)
            group_address_only = try(jg.group_address_only, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.join_groups.group_address_only, null)
            source_addresses = try(length(jg.source_addresses) == 0, true) ? null : [for js in jg.source_addresses : {
              source_ip = try(js.source_ip, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.join_groups.source_addresses.source_ip, null)
              include   = try(js.include, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.join_groups.source_addresses.include, null)
              exclude   = try(js.exclude, local.defaults.iosxr.devices.configuration.router_mld.vrfs.interfaces.join_groups.source_addresses.exclude, null)
            }]
          }]
        }]
      }
    ]
  ])
}

resource "iosxr_router_mld_vrf" "router_mld_vrf" {
  for_each                               = { for vrf in local.router_mld_vrf : vrf.key => vrf }
  device                                 = each.value.device_name
  vrf_name                               = each.value.vrf_name
  robustness_variable                    = each.value.robustness_variable
  maximum_groups                         = each.value.maximum_groups
  maximum_groups_per_interface           = each.value.maximum_groups_per_interface
  maximum_groups_per_interface_threshold = each.value.maximum_groups_per_interface_threshold
  maximum_groups_per_interface_acl       = each.value.maximum_groups_per_interface_acl
  version                                = each.value.version
  query_interval                         = each.value.query_interval
  query_timeout                          = each.value.query_timeout
  query_max_response_time                = each.value.query_max_response_time
  explicit_tracking                      = each.value.explicit_tracking
  explicit_tracking_acl                  = each.value.explicit_tracking_acl
  explicit_tracking_disable              = each.value.explicit_tracking_disable
  access_group                           = each.value.access_group
  ssm_map_query_dns                      = each.value.ssm_map_query_dns
  missed_packets_gen_query               = each.value.missed_packets_gen_query
  missed_packets_grp_spec_query          = each.value.missed_packets_grp_spec_query
  missed_packets_ssm_query               = each.value.missed_packets_ssm_query
  missed_packets_member_report           = each.value.missed_packets_member_report
  ssm_map_statics                        = each.value.ssm_map_statics
  interfaces                             = each.value.interfaces

  depends_on = [
    iosxr_vrf.vrf,
    iosxr_router_mld.router_mld
  ]
}
