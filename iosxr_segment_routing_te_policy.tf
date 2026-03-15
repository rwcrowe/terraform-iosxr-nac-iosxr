locals {
  segment_routing_te_policies = flatten([
    for device in local.devices : [
      for policy in try(local.device_config[device.name].segment_routing_te_policies, []) : {
        key                                                           = format("%s/%s", device.name, policy.policy_name)
        device_name                                                   = device.name
        policy_name                                                   = try(policy.policy_name, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.policy_name, null)
        auto_route_force_sr_include                                   = try(policy.auto_route_force_sr_include, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.auto_route_force_sr_include, null)
        auto_route_forward_class                                      = try(policy.auto_route_forward_class, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.auto_route_forward_class, null)
        auto_route_include_all_ipv4                                   = try(policy.auto_route_include_all_ipv4, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.auto_route_include_all_ipv4, null)
        auto_route_include_all_ipv6                                   = try(policy.auto_route_include_all_ipv6, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.auto_route_include_all_ipv6, null)
        auto_route_metric_constant_value                              = try(policy.auto_route_metric_constant_value, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.auto_route_metric_constant_value, null)
        auto_route_metric_relative_value                              = try(policy.auto_route_metric_relative_value, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.auto_route_metric_relative_value, null)
        auto_route_metric_type                                        = try(policy.auto_route_metric_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.auto_route_metric_type, null)
        bandwidth                                                     = try(policy.bandwidth, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.bandwidth, null)
        bfd_disable                                                   = try(policy.bfd_disable, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.bfd_disable, null)
        bfd_enable                                                    = try(policy.bfd_enable, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.bfd_enable, null)
        bfd_invalidation_action                                       = try(policy.bfd_invalidation_action, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.bfd_invalidation_action, null)
        bfd_logging_session_state_change                              = try(policy.bfd_logging_session_state_change, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.bfd_logging_session_state_change, null)
        bfd_minimum_interval                                          = try(policy.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.bfd_minimum_interval, null)
        bfd_multiplier                                                = try(policy.bfd_multiplier, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.bfd_multiplier, null)
        bfd_reverse_path_binding_label                                = try(policy.bfd_reverse_path_binding_label, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.bfd_reverse_path_binding_label, null)
        binding_sid_mpls_label                                        = try(policy.binding_sid_mpls_label, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.binding_sid_mpls_label, null)
        binding_sid_type                                              = try(policy.binding_sid_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.binding_sid_type, null)
        effective_metric_type                                         = try(policy.effective_metric_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.effective_metric_type, null)
        effective_metric_value                                        = try(policy.effective_metric_value, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.effective_metric_value, null)
        ipv6_disable                                                  = try(policy.ipv6_disable, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.ipv6_disable, null)
        max_install_standby_paths                                     = try(policy.max_install_standby_paths, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.max_install_standby_paths, null)
        path_protection                                               = try(policy.path_protection, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.path_protection, null)
        pce_group                                                     = try(policy.pce_group, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.pce_group, null)
        performance_measurement_delay_logging_delay_exceeded          = try(policy.performance_measurement_delay_logging_delay_exceeded, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.performance_measurement_delay_logging_delay_exceeded, null)
        performance_measurement_delay_profile                         = try(policy.performance_measurement_delay_profile, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.performance_measurement_delay_profile, null)
        performance_measurement_liveness_backup_profile               = try(policy.performance_measurement_liveness_backup_profile, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.performance_measurement_liveness_backup_profile, null)
        performance_measurement_liveness_invalidation_action          = try(policy.performance_measurement_liveness_invalidation_action, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.performance_measurement_liveness_invalidation_action, null)
        performance_measurement_liveness_logging_session_state_change = try(policy.performance_measurement_liveness_logging_session_state_change, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.performance_measurement_liveness_logging_session_state_change, null)
        performance_measurement_liveness_profile                      = try(policy.performance_measurement_liveness_profile, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.performance_measurement_liveness_profile, null)
        performance_measurement_reverse_path_label                    = try(policy.performance_measurement_reverse_path_label, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.performance_measurement_reverse_path_label, null)
        performance_measurement_reverse_path_segment_list             = try(policy.performance_measurement_reverse_path_segment_list, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.performance_measurement_reverse_path_segment_list, null)
        policy_color                                                  = try(policy.policy_color, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.policy_color, null)
        policy_color_endpoint_address                                 = try(policy.policy_color_endpoint_address, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.policy_color_endpoint_address, null)
        policy_color_endpoint_type                                    = try(policy.policy_color_endpoint_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.policy_color_endpoint_type, null)
        shutdown                                                      = try(policy.shutdown, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.shutdown, null)
        source_address                                                = try(policy.source_address, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.source_address, null)
        source_address_type                                           = try(policy.source_address_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.source_address_type, null)
        srv6_locator_behavior                                         = try(policy.srv6_locator_behavior, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.srv6_locator_behavior, null)
        srv6_locator_binding_sid_type                                 = try(policy.srv6_locator_binding_sid_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.srv6_locator_binding_sid_type, null)
        srv6_locator_name                                             = try(policy.srv6_locator_name, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.srv6_locator_name, null)
        steering_invalidation_drop                                    = try(policy.steering_invalidation_drop, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.steering_invalidation_drop, null)
        steering_labeled_services_disable                             = try(policy.steering_labeled_services_disable, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.steering_labeled_services_disable, null)
        transit_eligible                                              = try(policy.transit_eligible, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.transit_eligible, null)
        auto_route_include_prefixes = try(length(policy.auto_route_include_prefixes) == 0, true) ? null : [
          for prefix in policy.auto_route_include_prefixes : {
            af_type = try(prefix.af_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.auto_route_include_prefixes.af_type, null)
            address = try(prefix.address, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.auto_route_include_prefixes.address, null)
            length  = try(prefix.length, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.auto_route_include_prefixes.length, null)
          }
        ]
        candidate_paths_preferences = try(length(policy.candidate_paths_preferences) == 0, true) ? null : [
          for pref in policy.candidate_paths_preferences : {
            path_index                                   = try(pref.path_index, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.path_index, null)
            backup_ineligible                            = try(pref.backup_ineligible, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.backup_ineligible, null)
            bidirectional_association_id                 = try(pref.bidirectional_association_id, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.bidirectional_association_id, null)
            bidirectional_corouted                       = try(pref.bidirectional_corouted, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.bidirectional_corouted, null)
            constraints_disjoint_path_fallback_disable   = try(pref.constraints_disjoint_path_fallback_disable, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_disjoint_path_fallback_disable, null)
            constraints_disjoint_path_group_id           = try(pref.constraints_disjoint_path_group_id, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_disjoint_path_group_id, null)
            constraints_disjoint_path_shortest_path      = try(pref.constraints_disjoint_path_shortest_path, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_disjoint_path_shortest_path, null)
            constraints_disjoint_path_sub_id             = try(pref.constraints_disjoint_path_sub_id, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_disjoint_path_sub_id, null)
            constraints_disjoint_path_type               = try(pref.constraints_disjoint_path_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_disjoint_path_type, null)
            constraints_segment_rules_adjacency_sid_only = try(pref.constraints_segment_rules_adjacency_sid_only, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_segment_rules_adjacency_sid_only, null)
            constraints_segment_rules_protection_type    = try(pref.constraints_segment_rules_protection_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_segment_rules_protection_type, null)
            constraints_segment_rules_sid_algorithm      = try(pref.constraints_segment_rules_sid_algorithm, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_segment_rules_sid_algorithm, null)
            effective_metric_type                        = try(pref.effective_metric_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.effective_metric_type, null)
            effective_metric_value                       = try(pref.effective_metric_value, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.effective_metric_value, null)
            lock_duration                                = try(pref.lock_duration, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.lock_duration, null)
            pce_group                                    = try(pref.pce_group, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.pce_group, null)
            per_flow                                     = try(pref.per_flow, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.per_flow, null)
            per_flow_forward_class_default               = try(pref.per_flow_forward_class_default, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.per_flow_forward_class_default, null)
            constraints_affinity_rules = try(length(pref.constraints_affinity_rules) == 0, true) ? null : [
              for rule in pref.constraints_affinity_rules : {
                affinity_type = try(rule.affinity_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_affinity_rules.affinity_type, null)
                affinities = try(length(rule.affinities) == 0, true) ? null : [
                  for aff in rule.affinities : {
                    affinity_name = try(aff.affinity_name, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_affinity_rules.affinities.affinity_name, null)
                  }
                ]
              }
            ]
            constraints_bounds = try(length(pref.constraints_bounds) == 0, true) ? null : [
              for bound in pref.constraints_bounds : {
                type        = try(bound.type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_bounds.type, null)
                metric_type = try(bound.metric_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_bounds.metric_type, null)
                value       = try(bound.value, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.constraints_bounds.value, null)
              }
            ]
            paths = try(length(pref.paths) == 0, true) ? null : [
              for path in pref.paths : {
                type                      = try(path.type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.type, null)
                anycast                   = try(path.anycast, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.anycast, null)
                hop_type                  = try(path.hop_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.hop_type, null)
                metric_margin_absolute    = try(path.metric_margin_absolute, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.metric_margin_absolute, null)
                metric_margin_relative    = try(path.metric_margin_relative, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.metric_margin_relative, null)
                metric_margin_type        = try(path.metric_margin_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.metric_margin_type, null)
                metric_sid_limit          = try(path.metric_sid_limit, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.metric_sid_limit, null)
                metric_type               = try(path.metric_type, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.metric_type, null)
                pcep                      = try(path.pcep, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.pcep, null)
                reverse_path_segment_list = try(path.reverse_path_segment_list, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.reverse_path_segment_list, null)
                segment_list_name         = try(path.segment_list_name, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.segment_list_name, null)
                sticky                    = try(path.sticky, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.sticky, null)
                weight                    = try(path.weight, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.paths.weight, null)
              }
            ]
            per_flow_forward_classes = try(length(pref.per_flow_forward_classes) == 0, true) ? null : [
              for fc in pref.per_flow_forward_classes : {
                forward_class = try(fc.forward_class, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.per_flow_forward_classes.forward_class, null)
                color         = try(fc.color, local.defaults.iosxr.devices.configuration.segment_routing_te_policies.candidate_paths_preferences.per_flow_forward_classes.color, null)
              }
            ]
          }
        ]
      }
    ]
  ])
}

resource "iosxr_segment_routing_te_policy" "segment_routing_te_policy" {
  for_each                                                      = { for policy in local.segment_routing_te_policies : policy.key => policy }
  device                                                        = each.value.device_name
  policy_name                                                   = each.value.policy_name
  auto_route_force_sr_include                                   = each.value.auto_route_force_sr_include
  auto_route_forward_class                                      = each.value.auto_route_forward_class
  auto_route_include_all_ipv4                                   = each.value.auto_route_include_all_ipv4
  auto_route_include_all_ipv6                                   = each.value.auto_route_include_all_ipv6
  auto_route_include_prefixes                                   = each.value.auto_route_include_prefixes
  auto_route_metric_constant_value                              = each.value.auto_route_metric_constant_value
  auto_route_metric_relative_value                              = each.value.auto_route_metric_relative_value
  auto_route_metric_type                                        = each.value.auto_route_metric_type
  bandwidth                                                     = each.value.bandwidth
  bfd_disable                                                   = each.value.bfd_disable
  bfd_enable                                                    = each.value.bfd_enable
  bfd_invalidation_action                                       = each.value.bfd_invalidation_action
  bfd_logging_session_state_change                              = each.value.bfd_logging_session_state_change
  bfd_minimum_interval                                          = each.value.bfd_minimum_interval
  bfd_multiplier                                                = each.value.bfd_multiplier
  bfd_reverse_path_binding_label                                = each.value.bfd_reverse_path_binding_label
  binding_sid_mpls_label                                        = each.value.binding_sid_mpls_label
  binding_sid_type                                              = each.value.binding_sid_type
  candidate_paths_preferences                                   = each.value.candidate_paths_preferences
  effective_metric_type                                         = each.value.effective_metric_type
  effective_metric_value                                        = each.value.effective_metric_value
  ipv6_disable                                                  = each.value.ipv6_disable
  max_install_standby_paths                                     = each.value.max_install_standby_paths
  path_protection                                               = each.value.path_protection
  pce_group                                                     = each.value.pce_group
  performance_measurement_delay_logging_delay_exceeded          = each.value.performance_measurement_delay_logging_delay_exceeded
  performance_measurement_delay_profile                         = each.value.performance_measurement_delay_profile
  performance_measurement_liveness_backup_profile               = each.value.performance_measurement_liveness_backup_profile
  performance_measurement_liveness_invalidation_action          = each.value.performance_measurement_liveness_invalidation_action
  performance_measurement_liveness_logging_session_state_change = each.value.performance_measurement_liveness_logging_session_state_change
  performance_measurement_liveness_profile                      = each.value.performance_measurement_liveness_profile
  performance_measurement_reverse_path_label                    = each.value.performance_measurement_reverse_path_label
  performance_measurement_reverse_path_segment_list             = each.value.performance_measurement_reverse_path_segment_list
  policy_color                                                  = each.value.policy_color
  policy_color_endpoint_address                                 = each.value.policy_color_endpoint_address
  policy_color_endpoint_type                                    = each.value.policy_color_endpoint_type
  shutdown                                                      = each.value.shutdown
  source_address                                                = each.value.source_address
  source_address_type                                           = each.value.source_address_type
  srv6_locator_behavior                                         = each.value.srv6_locator_behavior
  srv6_locator_binding_sid_type                                 = each.value.srv6_locator_binding_sid_type
  srv6_locator_name                                             = each.value.srv6_locator_name
  steering_invalidation_drop                                    = each.value.steering_invalidation_drop
  steering_labeled_services_disable                             = each.value.steering_labeled_services_disable
  transit_eligible                                              = each.value.transit_eligible

  depends_on = [
    iosxr_segment_routing_te.segment_routing_te,
  ]
}
