##### Segment Routing #####

locals {
  segment_routing = [
    for device in local.devices : {
      device_name              = device.name
      enable                   = try(local.device_config[device.name].segment_routing.enable, local.defaults.iosxr.devices.configuration.segment_routing.enable, null)
      global_block_lower_bound = try(local.device_config[device.name].segment_routing.global_block_from, local.defaults.iosxr.devices.configuration.segment_routing.global_block_from, null)
      global_block_upper_bound = try(local.device_config[device.name].segment_routing.global_block_to, local.defaults.iosxr.devices.configuration.segment_routing.global_block_to, null)
      local_block_lower_bound  = try(local.device_config[device.name].segment_routing.local_block_from, local.defaults.iosxr.devices.configuration.segment_routing.local_block_from, null)
      local_block_upper_bound  = try(local.device_config[device.name].segment_routing.local_block_to, local.defaults.iosxr.devices.configuration.segment_routing.local_block_to, null)
    } if try(local.device_config[device.name].segment_routing, null) != null || try(local.defaults.iosxr.devices.configuration.segment_routing, null) != null
  ]
}

resource "iosxr_segment_routing" "segment_routing" {
  for_each                 = { for sr in local.segment_routing : sr.device_name => sr }
  device                   = each.value.device_name
  enable                   = each.value.enable
  global_block_lower_bound = each.value.global_block_lower_bound
  global_block_upper_bound = each.value.global_block_upper_bound
  local_block_lower_bound  = each.value.local_block_lower_bound
  local_block_upper_bound  = each.value.local_block_upper_bound
}

##### Segment Routing Mapping Server #####

locals {
  segment_routing_mapping_server = [
    for device in local.devices : {
      device_name = device.name
      mapping_prefix_sid_address_family = try(length(local.device_config[device.name].segment_routing.mapping_server) == 0, true) ? null : [
        for af in local.device_config[device.name].segment_routing.mapping_server : {
          af_name = try(af.address_family, local.defaults.iosxr.devices.configuration.segment_routing.mapping_server.address_family, null)
          prefix_addresses = try(length(af.prefix_sid_maps) == 0, true) ? null : [
            for entry in af.prefix_sid_maps : {
              address   = try(entry.prefix, local.defaults.iosxr.devices.configuration.segment_routing.mapping_server.prefix_sid_maps.prefix, null)
              length    = try(entry.length, local.defaults.iosxr.devices.configuration.segment_routing.mapping_server.prefix_sid_maps.length, null)
              sid_index = try(entry.sid_index, local.defaults.iosxr.devices.configuration.segment_routing.mapping_server.prefix_sid_maps.sid_index, null)
              range     = try(entry.range, local.defaults.iosxr.devices.configuration.segment_routing.mapping_server.prefix_sid_maps.range, null)
              attached  = try(entry.attached, local.defaults.iosxr.devices.configuration.segment_routing.mapping_server.prefix_sid_maps.attached, null)
            }
          ]
        }
      ]
    } if try(local.device_config[device.name].segment_routing.mapping_server, null) != null || try(local.defaults.iosxr.devices.configuration.segment_routing.mapping_server, null) != null
  ]
}

resource "iosxr_segment_routing_mapping_server" "segment_routing_mapping_server" {
  for_each                          = { for ms in local.segment_routing_mapping_server : ms.device_name => ms }
  device                            = each.value.device_name
  mapping_prefix_sid_address_family = each.value.mapping_prefix_sid_address_family

  depends_on = [
    iosxr_segment_routing.segment_routing,
  ]
}

##### Segment Routing v6 #####

locals {
  segment_routing_v6 = [
    for device in local.devices : {
      device_name = device.name
      enable      = try(local.device_config[device.name].segment_routing.srv6.enable, local.defaults.iosxr.devices.configuration.segment_routing.srv6.enable, null)
      encapsulation_hop_limit_option = try(
        can(tonumber(try(local.device_config[device.name].segment_routing.srv6.encapsulation.hop_limit, ""))) ? "count" : try(local.device_config[device.name].segment_routing.srv6.encapsulation.hop_limit, null),
        can(tonumber(try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.hop_limit, ""))) ? "count" : try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.hop_limit, null),
        null
      )
      encapsulation_hop_limit_value = try(
        can(tonumber(try(local.device_config[device.name].segment_routing.srv6.encapsulation.hop_limit, ""))) ? tonumber(local.device_config[device.name].segment_routing.srv6.encapsulation.hop_limit) : try(local.device_config[device.name].segment_routing.srv6.encapsulation.hop_limit, null) != null ? 0 : null,
        can(tonumber(try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.hop_limit, ""))) ? tonumber(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.hop_limit) : try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.hop_limit, null) != null ? 0 : null,
        null
      )
      encapsulation_source_address = try(local.device_config[device.name].segment_routing.srv6.encapsulation.source_address, local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.source_address, null)
      encapsulation_traffic_class_option = try(
        can(tonumber(try(local.device_config[device.name].segment_routing.srv6.encapsulation.traffic_class, ""))) ? "value" : try(local.device_config[device.name].segment_routing.srv6.encapsulation.traffic_class, null),
        can(tonumber(try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.traffic_class, ""))) ? "value" : try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.traffic_class, null),
        null
      )
      encapsulation_traffic_class_value = try(
        can(tonumber(try(local.device_config[device.name].segment_routing.srv6.encapsulation.traffic_class, ""))) ? tonumber(local.device_config[device.name].segment_routing.srv6.encapsulation.traffic_class) : try(local.device_config[device.name].segment_routing.srv6.encapsulation.traffic_class, null) != null ? 0 : null,
        can(tonumber(try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.traffic_class, ""))) ? tonumber(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.traffic_class) : try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.traffic_class, null) != null ? 0 : null,
        null
      )
      logging_locator_status = try(local.device_config[device.name].segment_routing.srv6.logging_locator_status, local.defaults.iosxr.devices.configuration.segment_routing.srv6.logging_locator_status, null)
      sid_holdtime           = try(local.device_config[device.name].segment_routing.srv6.sid_holdtime, local.defaults.iosxr.devices.configuration.segment_routing.srv6.sid_holdtime, null)
      formats = try(length(local.device_config[device.name].segment_routing.srv6.formats) == 0, true) ? null : [
        for format in local.device_config[device.name].segment_routing.srv6.formats : {
          name                                         = try(format.name, local.defaults.iosxr.devices.configuration.segment_routing.srv6.formats.name, null)
          usid_local_id_block_ranges_lib_start         = try(format.usid_local_id_block_explicit_from, local.defaults.iosxr.devices.configuration.segment_routing.srv6.formats.usid_local_id_block_explicit_from, null)
          usid_local_id_block_ranges_explict_lib_start = try(format.usid_local_id_block_explict_to, local.defaults.iosxr.devices.configuration.segment_routing.srv6.formats.usid_local_id_block_explict_to, null)
          usid_wide_local_id_block_explicit_range      = try(format.usid_wide_local_id_block_start, local.defaults.iosxr.devices.configuration.segment_routing.srv6.formats.usid_wide_local_id_block_start, null)
        }
      ]
      locators = try(length(local.device_config[device.name].segment_routing.srv6.locators) == 0, true) ? null : [
        for locator in local.device_config[device.name].segment_routing.srv6.locators : {
          name                   = try(locator.name, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.name, null)
          algorithm              = try(locator.algorithm, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.algorithm, null)
          anycast                = try(locator.anycast, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.anycast, null)
          micro_segment_behavior = try(locator.micro_segment_behavior_unode, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.micro_segment_behavior_unode, null) == "psp-usd" ? "unode-psp-usd" : try(locator.micro_segment_behavior_unode, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.micro_segment_behavior_unode, null) == "shift-only" ? "unode-shift-only" : null
          prefix                 = try(locator.prefix, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.prefix, null)
          prefix_length          = try(locator.mask, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.mask, null)
        }
      ]
    } if try(local.device_config[device.name].segment_routing.srv6, null) != null || try(local.defaults.iosxr.devices.configuration.segment_routing.srv6, null) != null
  ]
}

resource "iosxr_segment_routing_v6" "segment_routing_v6" {
  for_each                           = { for srv6 in local.segment_routing_v6 : srv6.device_name => srv6 }
  device                             = each.value.device_name
  enable                             = each.value.enable
  encapsulation_hop_limit_option     = each.value.encapsulation_hop_limit_option
  encapsulation_hop_limit_value      = each.value.encapsulation_hop_limit_value
  encapsulation_source_address       = each.value.encapsulation_source_address
  encapsulation_traffic_class_option = each.value.encapsulation_traffic_class_option
  encapsulation_traffic_class_value  = each.value.encapsulation_traffic_class_value
  formats                            = each.value.formats
  locators                           = each.value.locators
  logging_locator_status             = each.value.logging_locator_status
  sid_holdtime                       = each.value.sid_holdtime

  lifecycle {
    replace_triggered_by = [terraform_data.segment_routing_v6_replace[each.key]]
  }

  depends_on = [
    iosxr_segment_routing.segment_routing
  ]
}

##### Trigger a replace if the formats or locators change. Cannot modify locators when formats are present. #####

resource "terraform_data" "segment_routing_v6_replace" {
  for_each = { for srv6 in local.segment_routing_v6 : srv6.device_name => srv6 }
  input = sha256(jsonencode({
    formats  = each.value.formats
    locators = each.value.locators
  }))
}

##### Segment Routing TE #####

locals {
  segment_routing_te = flatten([
    for device in local.devices : [
      {
        key                                                  = device.name
        device_name                                          = device.name
        te_latency                                           = try(local.device_config[device.name].segment_routing.traffic_engineering.te_latency, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.te_latency, null)
        max_install_standby_paths                            = try(local.device_config[device.name].segment_routing.traffic_engineering.max_install_standby_paths, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.max_install_standby_paths, null)
        kshortest_paths                                      = try(local.device_config[device.name].segment_routing.traffic_engineering.kshortest_paths, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.kshortest_paths, null)
        maximum_sid_depth                                    = try(local.device_config[device.name].segment_routing.traffic_engineering.maximum_sid_depth, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.maximum_sid_depth, null)
        cspf_cache_size                                      = try(local.device_config[device.name].segment_routing.traffic_engineering.cspf_cache_size, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.cspf_cache_size, null)
        separate_next_hop                                    = try(local.device_config[device.name].segment_routing.traffic_engineering.separate_next_hop, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.separate_next_hop, null)
        bfd_timers_session_bringup                           = try(local.device_config[device.name].segment_routing.traffic_engineering.bfd_session_bringup, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.bfd_session_bringup, null)
        binding_sid_rules_dynamic                            = try(local.device_config[device.name].segment_routing.traffic_engineering.binding_sids.dynamic, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.binding_sids.dynamic, null)
        binding_sid_rules_explicit                           = try(local.device_config[device.name].segment_routing.traffic_engineering.binding_sids.explicit, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.binding_sids.explicit, null)
        distribute_link_state                                = try(local.device_config[device.name].segment_routing.traffic_engineering.distribute_link_state.enable, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.distribute_link_state.enable, null)
        distribute_link_state_throttle                       = try(local.device_config[device.name].segment_routing.traffic_engineering.distribute_link_state.throttle, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.distribute_link_state.throttle, null)
        distribute_link_state_report_candidate_path_inactive = try(local.device_config[device.name].segment_routing.traffic_engineering.distribute_link_state.report_candidate_path_inactive, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.distribute_link_state.report_candidate_path_inactive, null)
        logging_pcep_peer_status                             = try(local.device_config[device.name].segment_routing.traffic_engineering.logging.pcep_peer_status, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.logging.pcep_peer_status, null)
        logging_policy_status                                = try(local.device_config[device.name].segment_routing.traffic_engineering.logging.policy_status, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.logging.policy_status, null)
        steering_labeled_services_disable_all_policies       = try(local.device_config[device.name].segment_routing.traffic_engineering.steering.labeled_services.disable_all, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.steering.labeled_services.disable_all, null)
        steering_labeled_services_disable_bgp_sr_te_policies = try(local.device_config[device.name].segment_routing.traffic_engineering.steering.labeled_services.disable_bgp_sr_te, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.steering.labeled_services.disable_bgp_sr_te, null)
        steering_labeled_services_disable_local_policies     = try(local.device_config[device.name].segment_routing.traffic_engineering.steering.labeled_services.disable_local, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.steering.labeled_services.disable_local, null)
        steering_labeled_services_disable_on_demand_policies = try(local.device_config[device.name].segment_routing.traffic_engineering.steering.labeled_services.disable_on_demand, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.steering.labeled_services.disable_on_demand, null)
        steering_labeled_services_disable_pcep_policies      = try(local.device_config[device.name].segment_routing.traffic_engineering.steering.labeled_services.disable_pcep, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.steering.labeled_services.disable_pcep, null)
        timers_candidate_path_cleanup_delay                  = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.candidate_path_cleanup_delay, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.candidate_path_cleanup_delay, null)
        timers_cleanup_delay                                 = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.cleanup_delay, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.cleanup_delay, null)
        timers_delete_delay                                  = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.delete_delay, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.delete_delay, null)
        timers_initial_verify_restart                        = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.initial_verify_restart, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.initial_verify_restart, null)
        timers_initial_verify_startup                        = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.initial_verify_startup, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.initial_verify_startup, null)
        timers_initial_verify_switchover                     = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.initial_verify_switchover, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.initial_verify_switchover, null)
        timers_install_delay                                 = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.install_delay, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.install_delay, null)
        timers_periodic_reoptimization                       = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.periodic_reoptimization, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.periodic_reoptimization, null)
        pcc_dead_timer                                       = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.dead_timer, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.dead_timer, null)
        pcc_delegation_timeout                               = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.delegation_timeout, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.delegation_timeout, null)
        pcc_initiated_orphan                                 = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.initiated_orphan, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.initiated_orphan, null)
        pcc_initiated_state                                  = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.initiated_state, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.initiated_state, null)
        pcc_keepalive_timer                                  = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.keepalive_timer, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.keepalive_timer, null)
        pcc_redundancy_pcc_centric                           = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.redundancy, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.redundancy, null) == "pcc_centric" ? true : null
        pcc_redundancy_pce_centric                           = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.redundancy, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.redundancy, null) == "pce_centric" ? true : null
        pcc_report_all                                       = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.report_all, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.report_all, null)
        pcc_source_address_ipv4                              = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.source_address_ipv4, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.source_address_ipv4, null)
        pcc_source_address_ipv6                              = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.source_address_ipv6, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.source_address_ipv6, null)
        path_disable_algo_checks_strict_spf_all_areas        = try(local.device_config[device.name].segment_routing.traffic_engineering.path_disable_algo_checks.strict_spf.all_areas, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.path_disable_algo_checks.strict_spf.all_areas, null)
        srv6_locator                                         = try(local.device_config[device.name].segment_routing.traffic_engineering.srv6.locator, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.srv6.locator, null)
        srv6_locator_behavior                                = try(local.device_config[device.name].segment_routing.traffic_engineering.srv6.behavior, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.srv6.behavior, null)
        srv6_locator_binding_sid_type                        = try(local.device_config[device.name].segment_routing.traffic_engineering.srv6.binding_sid_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.srv6.binding_sid_type, try(local.device_config[device.name].segment_routing.traffic_engineering.srv6.locator, null) != null ? "srv6-dynamic" : null)
        srv6_maximum_sid_depth                               = try(local.device_config[device.name].segment_routing.traffic_engineering.srv6.maximum_sid_depth, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.srv6.maximum_sid_depth, null)
        segment_lists_srv6_sid_format                        = try(lookup(local.srv6_sid_format_map, try(local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.srv6.sid_format, ""), ""), lookup(local.srv6_sid_format_map, try(local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.sid_format, ""), ""), null) != "" ? try(lookup(local.srv6_sid_format_map, try(local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.srv6.sid_format, ""), ""), lookup(local.srv6_sid_format_map, try(local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.sid_format, ""), ""), null) : null
        segment_lists_srv6_topology_check                    = try(local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.srv6.topology_check, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.topology_check, null)
        affinity_maps = try(length(local.device_config[device.name].segment_routing.traffic_engineering.affinity_maps) == 0, true) ? null : [
          for am in local.device_config[device.name].segment_routing.traffic_engineering.affinity_maps : {
            affinity_name = try(am.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.affinity_maps.name, null)
            bit_position  = try(am.bit_position, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.affinity_maps.bit_position, null)
          }
        ]
        candidate_paths = try(length(local.device_config[device.name].segment_routing.traffic_engineering.candidate_paths) == 0, true) ? null : [
          for cp in local.device_config[device.name].segment_routing.traffic_engineering.candidate_paths : {
            path_type                = format("candidate-path-type-%s", try(cp.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.candidate_paths.type, null))
            source_address           = try(cp.source_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.candidate_paths.source_address, null)
            source_address_selection = true
            source_address_type      = can(regex(":", try(cp.source_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.candidate_paths.source_address, ""))) ? "end-point-type-ipv6" : "end-point-type-ipv4"
          }
        ]
        effective_metric_admin_distance_metric_types = try(length(local.device_config[device.name].segment_routing.traffic_engineering.effective_metric.admin_distances) == 0, true) ? null : [
          for mt in local.device_config[device.name].segment_routing.traffic_engineering.effective_metric.admin_distances : {
            metric_type    = lookup(local.metric_type_map, try(mt.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.effective_metric.admin_distances.type, ""), try(mt.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.effective_metric.admin_distances.type, null))
            admin_distance = try(mt.distance, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.effective_metric.admin_distances.distance, null)
          }
        ]
        effective_metric_admin_distance_flex_algo_metric_types = try(length(local.device_config[device.name].segment_routing.traffic_engineering.effective_metric.flex_algos) == 0, true) ? null : [
          for mt in local.device_config[device.name].segment_routing.traffic_engineering.effective_metric.flex_algos : {
            metric_type    = tonumber(lookup(local.flex_algo_metric_type_map, tostring(try(mt.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.effective_metric.flex_algos.type, null)), tostring(try(mt.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.effective_metric.flex_algos.type, null))))
            admin_distance = try(mt.distance, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.effective_metric.flex_algos.distance, null)
          }
        ]
        interfaces = try(length(local.device_config[device.name].segment_routing.traffic_engineering.interfaces) == 0, true) ? null : [
          for iface in local.device_config[device.name].segment_routing.traffic_engineering.interfaces : {
            interface_name = try(iface.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.interfaces.name, null)
            metric         = try(iface.metric, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.interfaces.metric, null)
            affinities = try(length(iface.affinities) == 0, true) ? null : [
              for aff in iface.affinities : {
                affinity_name = try(aff.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.interfaces.affinities.name, null)
              }
            ]
          }
        ]
        path_disable_algo_checks_strict_spf_areas = try(length(local.device_config[device.name].segment_routing.traffic_engineering.path_disable_algo_checks.strict_spf.areas) == 0, true) ? null : [
          for area in local.device_config[device.name].segment_routing.traffic_engineering.path_disable_algo_checks.strict_spf.areas : {
            area_id  = try(area.id, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.path_disable_algo_checks.strict_spf.areas.id, null)
            protocol = try(area.protocol, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.path_disable_algo_checks.strict_spf.areas.protocol, null)
          }
        ]
        pcc_profiles = try(length(local.device_config[device.name].segment_routing.traffic_engineering.pcc.profiles) == 0, true) ? null : [
          for profile in local.device_config[device.name].segment_routing.traffic_engineering.pcc.profiles : {
            profile_id                       = try(profile.id, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.id, null)
            auto_route_force_sr_include      = try(profile.auto_route.force_sr_include, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.force_sr_include, null)
            auto_route_forward_class         = try(profile.auto_route.forward_class, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.forward_class, null)
            auto_route_include_all_ipv4      = try(profile.auto_route.include_all_ipv4, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.include_all_ipv4, null)
            auto_route_include_all_ipv6      = try(profile.auto_route.include_all_ipv6, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.include_all_ipv6, null)
            auto_route_metric_type           = try(profile.auto_route.metric_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.metric_type, null)
            auto_route_metric_relative_value = try(profile.auto_route.metric_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.metric_type, null) == "relative" ? try(profile.auto_route.metric, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.metric, null) : null
            auto_route_metric_constant_value = try(profile.auto_route.metric_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.metric_type, null) == "constant" ? try(profile.auto_route.metric, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.metric, null) : null
            steering_invalidation_drop       = try(profile.steering_invalidation_drop, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.steering_invalidation_drop, null)
          }
        ]
        pce_peers_ipv4 = try(length([
          for peer in try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.pce_peers, []) :
          peer if can(regex(":", try(peer.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.address, ""))) == false
          ]) == 0, true) ? null : [
          for peer in try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.pce_peers, []) : {
            pce_address                = try(peer.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.address, null)
            password_encrypted         = try(peer.password, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.password, null)
            pce_group                  = try(peer.pce_group, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.pce_group, null)
            precedence                 = try(peer.precedence, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.precedence, null)
            tcp_ao_include_tcp_options = try(peer.tcp_ao_include_tcp_options, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.tcp_ao_include_tcp_options, null)
            tcp_ao_keychain            = try(peer.tcp_ao_keychain, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.tcp_ao_keychain, null)
          } if can(regex(":", try(peer.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.address, ""))) == false
        ]
        pce_peers_ipv6 = try(length([
          for peer in try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.pce_peers, []) :
          peer if can(regex(":", try(peer.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.address, ""))) == true
          ]) == 0, true) ? null : [
          for peer in try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.pce_peers, []) : {
            pce_address                = try(peer.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.address, null)
            password_encrypted         = try(peer.password, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.password, null)
            pce_group                  = try(peer.pce_group, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.pce_group, null)
            precedence                 = try(peer.precedence, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.precedence, null)
            tcp_ao_include_tcp_options = try(peer.tcp_ao_include_tcp_options, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.tcp_ao_include_tcp_options, null)
            tcp_ao_keychain            = try(peer.tcp_ao_keychain, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.tcp_ao_keychain, null)
          } if can(regex(":", try(peer.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pce_peers.address, ""))) == true
        ]
        resource_lists = try(length(local.device_config[device.name].segment_routing.traffic_engineering.resource_lists) == 0, true) ? null : [
          for rl in local.device_config[device.name].segment_routing.traffic_engineering.resource_lists : {
            path_name = try(rl.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.resource_lists.name, null)
            resources = try(length(rl.entries) == 0, true) ? null : [
              for res in rl.entries : {
                index   = try(res.index, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.resource_lists.entries.index, null)
                type    = try(res.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.resource_lists.entries.type, "ipv4-address")
                address = try(res.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.resource_lists.entries.address, null)
              }
            ]
          }
        ]
        segment_lists_sr_mpls_explicit_segments = try(length(local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments) == 0, true) ? null : [
          for sl in local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments : {
            path_name = try(sl.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.name, null)
            sr_mpls_segments = try(length(sl.entries) == 0, true) ? null : [
              for seg in sl.entries : {
                index                = try(seg.index, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.index, null)
                type                 = try(seg.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.type, null) == "label" ? "mpls-label" : try(seg.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.type, null) == "adjacency" ? "ip-adjacency-address" : try(seg.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.type, null)
                address              = try(seg.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.address, null)
                mpls_label           = try(seg.label, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.label, null)
                address_type         = try(seg.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.type, null) == "adjacency" ? (can(regex(":", try(seg.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.address, ""))) ? 10 : 2) : null
                interface_identifier = try(seg.interface_identifier, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.interface_identifier, null)
              }
            ]
          }
        ]
        segment_lists_srv6_explicit_segments = try(length(local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments) == 0, true) ? null : [
          for sl in local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments : {
            path_name           = try(sl.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments.name, null)
            srv6_topology_check = try(sl.topology_check, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments.topology_check, null)
            srv6_segments = try(length(sl.entries) == 0, true) ? null : [
              for seg in sl.entries : {
                index    = try(seg.index, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments.entries.index, null)
                address  = try(seg.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments.entries.address, null)
                hop_type = try(seg.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments.entries.type, "srv6sid")
              }
            ]
          }
        ]
        traces = try(length(local.device_config[device.name].segment_routing.traffic_engineering.traces) == 0, true) ? null : [
          for trace in local.device_config[device.name].segment_routing.traffic_engineering.traces : {
            buffer_name = try(trace.buffer, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.traces.buffer, null)
            trace_count = try(trace.count, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.traces.count, null)
          }
        ]
      }
    ] if try(local.device_config[device.name].segment_routing.traffic_engineering, null) != null || try(local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering, null) != null
  ])
}

resource "iosxr_segment_routing_te" "segment_routing_te" {
  for_each                                               = { for sr_te in local.segment_routing_te : sr_te.key => sr_te }
  device                                                 = each.value.device_name
  affinity_maps                                          = each.value.affinity_maps
  bfd_timers_session_bringup                             = each.value.bfd_timers_session_bringup
  binding_sid_rules_dynamic                              = each.value.binding_sid_rules_dynamic
  binding_sid_rules_explicit                             = each.value.binding_sid_rules_explicit
  candidate_paths                                        = each.value.candidate_paths
  cspf_cache_size                                        = each.value.cspf_cache_size
  distribute_link_state                                  = each.value.distribute_link_state
  distribute_link_state_report_candidate_path_inactive   = each.value.distribute_link_state_report_candidate_path_inactive
  distribute_link_state_throttle                         = each.value.distribute_link_state_throttle
  effective_metric_admin_distance_flex_algo_metric_types = each.value.effective_metric_admin_distance_flex_algo_metric_types
  effective_metric_admin_distance_metric_types           = each.value.effective_metric_admin_distance_metric_types
  interfaces                                             = each.value.interfaces
  kshortest_paths                                        = each.value.kshortest_paths
  logging_pcep_peer_status                               = each.value.logging_pcep_peer_status
  logging_policy_status                                  = each.value.logging_policy_status
  max_install_standby_paths                              = each.value.max_install_standby_paths
  maximum_sid_depth                                      = each.value.maximum_sid_depth
  path_disable_algo_checks_strict_spf_all_areas          = each.value.path_disable_algo_checks_strict_spf_all_areas
  path_disable_algo_checks_strict_spf_areas              = each.value.path_disable_algo_checks_strict_spf_areas
  pcc_dead_timer                                         = each.value.pcc_dead_timer
  pcc_delegation_timeout                                 = each.value.pcc_delegation_timeout
  pcc_initiated_orphan                                   = each.value.pcc_initiated_orphan
  pcc_initiated_state                                    = each.value.pcc_initiated_state
  pcc_keepalive_timer                                    = each.value.pcc_keepalive_timer
  pcc_profiles                                           = each.value.pcc_profiles
  pcc_redundancy_pcc_centric                             = each.value.pcc_redundancy_pcc_centric
  pcc_redundancy_pce_centric                             = each.value.pcc_redundancy_pce_centric
  pcc_report_all                                         = each.value.pcc_report_all
  pcc_source_address_ipv4                                = each.value.pcc_source_address_ipv4
  pcc_source_address_ipv6                                = each.value.pcc_source_address_ipv6
  pce_peers_ipv4                                         = each.value.pce_peers_ipv4
  pce_peers_ipv6                                         = each.value.pce_peers_ipv6
  resource_lists                                         = each.value.resource_lists
  segment_lists_sr_mpls_explicit_segments                = each.value.segment_lists_sr_mpls_explicit_segments
  segment_lists_srv6_explicit_segments                   = each.value.segment_lists_srv6_explicit_segments
  segment_lists_srv6_sid_format                          = each.value.segment_lists_srv6_sid_format
  segment_lists_srv6_topology_check                      = each.value.segment_lists_srv6_topology_check
  separate_next_hop                                      = each.value.separate_next_hop
  srv6_locator                                           = each.value.srv6_locator
  srv6_locator_behavior                                  = each.value.srv6_locator_behavior
  srv6_locator_binding_sid_type                          = each.value.srv6_locator_binding_sid_type
  srv6_maximum_sid_depth                                 = each.value.srv6_maximum_sid_depth
  steering_labeled_services_disable_all_policies         = each.value.steering_labeled_services_disable_all_policies
  steering_labeled_services_disable_bgp_sr_te_policies   = each.value.steering_labeled_services_disable_bgp_sr_te_policies
  steering_labeled_services_disable_local_policies       = each.value.steering_labeled_services_disable_local_policies
  steering_labeled_services_disable_on_demand_policies   = each.value.steering_labeled_services_disable_on_demand_policies
  steering_labeled_services_disable_pcep_policies        = each.value.steering_labeled_services_disable_pcep_policies
  te_latency                                             = each.value.te_latency
  timers_candidate_path_cleanup_delay                    = each.value.timers_candidate_path_cleanup_delay
  timers_cleanup_delay                                   = each.value.timers_cleanup_delay
  timers_delete_delay                                    = each.value.timers_delete_delay
  timers_initial_verify_restart                          = each.value.timers_initial_verify_restart
  timers_initial_verify_startup                          = each.value.timers_initial_verify_startup
  timers_initial_verify_switchover                       = each.value.timers_initial_verify_switchover
  timers_install_delay                                   = each.value.timers_install_delay
  timers_periodic_reoptimization                         = each.value.timers_periodic_reoptimization
  traces                                                 = each.value.traces

  depends_on = [
    iosxr_segment_routing.segment_routing,
    iosxr_segment_routing_v6.segment_routing_v6,
    iosxr_key_chain.key_chain
  ]
}
