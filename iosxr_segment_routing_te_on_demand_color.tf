locals {
  segment_routing_te_on_demand_colors = flatten([
    for device in local.devices : [
      for odc in try(local.device_config[device.name].segment_routing_te_on_demand_colors, []) : {
        key                                                           = format("%s/%s", device.name, odc.color)
        device_name                                                   = device.name
        color                                                         = try(odc.color, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.color, null)
        bandwidth                                                     = try(odc.bandwidth, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.bandwidth, null)
        bfd_disable                                                   = try(odc.bfd_disable, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.bfd_disable, null)
        bfd_enable                                                    = try(odc.bfd_enable, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.bfd_enable, null)
        bfd_invalidation_action                                       = try(odc.bfd_invalidation_action, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.bfd_invalidation_action, null)
        bfd_logging_session_state_change                              = try(odc.bfd_logging_session_state_change, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.bfd_logging_session_state_change, null)
        bfd_minimum_interval                                          = try(odc.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.bfd_minimum_interval, null)
        bfd_multiplier                                                = try(odc.bfd_multiplier, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.bfd_multiplier, null)
        bfd_reverse_path_binding_label                                = try(odc.bfd_reverse_path_binding_label, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.bfd_reverse_path_binding_label, null)
        constraint_segments_protection_type                           = try(odc.constraint_segments_protection_type, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.constraint_segments_protection_type, null)
        constraint_segments_sid_algorithm                             = try(odc.constraint_segments_sid_algorithm, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.constraint_segments_sid_algorithm, null)
        dynamic_anycast_sid_inclusion                                 = try(odc.dynamic_anycast_sid_inclusion, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_anycast_sid_inclusion, null)
        dynamic_disjoint_path_fallback_disable                        = try(odc.dynamic_disjoint_path_fallback_disable, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_disjoint_path_fallback_disable, null)
        dynamic_disjoint_path_group_id                                = try(odc.dynamic_disjoint_path_group_id, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_disjoint_path_group_id, null)
        dynamic_disjoint_path_shortest_path                           = try(odc.dynamic_disjoint_path_shortest_path, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_disjoint_path_shortest_path, null)
        dynamic_disjoint_path_sub_id                                  = try(odc.dynamic_disjoint_path_sub_id, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_disjoint_path_sub_id, null)
        dynamic_disjoint_path_type                                    = try(odc.dynamic_disjoint_path_type, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_disjoint_path_type, null)
        dynamic_metric_margin_absolute                                = try(odc.dynamic_metric_margin_absolute, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_metric_margin_absolute, null)
        dynamic_metric_margin_relative                                = try(odc.dynamic_metric_margin_relative, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_metric_margin_relative, null)
        dynamic_metric_margin_type                                    = try(odc.dynamic_metric_margin_type, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_metric_margin_type, null)
        dynamic_metric_type                                           = try(odc.dynamic_metric_type, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_metric_type, null)
        dynamic_pcep                                                  = try(odc.dynamic_pcep, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_pcep, null)
        effective_metric_type                                         = try(odc.effective_metric_type, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.effective_metric_type, null)
        effective_metric_value                                        = try(odc.effective_metric_value, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.effective_metric_value, null)
        max_install_standby_paths                                     = try(odc.max_install_standby_paths, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.max_install_standby_paths, null)
        maximum_sid_depth                                             = try(odc.maximum_sid_depth, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.maximum_sid_depth, null)
        pce_group                                                     = try(odc.pce_group, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.pce_group, null)
        per_flow                                                      = try(odc.per_flow, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.per_flow, null)
        per_flow_forward_class_default                                = try(odc.per_flow_forward_class_default, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.per_flow_forward_class_default, null)
        performance_measurement_delay_logging_delay_exceeded          = try(odc.performance_measurement_delay_logging_delay_exceeded, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.performance_measurement_delay_logging_delay_exceeded, null)
        performance_measurement_delay_profile                         = try(odc.performance_measurement_delay_profile, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.performance_measurement_delay_profile, null)
        performance_measurement_liveness_backup_profile               = try(odc.performance_measurement_liveness_backup_profile, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.performance_measurement_liveness_backup_profile, null)
        performance_measurement_liveness_invalidation_action          = try(odc.performance_measurement_liveness_invalidation_action, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.performance_measurement_liveness_invalidation_action, null)
        performance_measurement_liveness_logging_session_state_change = try(odc.performance_measurement_liveness_logging_session_state_change, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.performance_measurement_liveness_logging_session_state_change, null)
        performance_measurement_liveness_profile                      = try(odc.performance_measurement_liveness_profile, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.performance_measurement_liveness_profile, null)
        performance_measurement_reverse_path_label                    = try(odc.performance_measurement_reverse_path_label, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.performance_measurement_reverse_path_label, null)
        performance_measurement_reverse_path_segment_list             = try(odc.performance_measurement_reverse_path_segment_list, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.performance_measurement_reverse_path_segment_list, null)
        source_address                                                = try(odc.source_address, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.source_address, null)
        source_address_type                                           = try(odc.source_address_type, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.source_address_type, null)
        srv6_locator_behavior                                         = try(odc.srv6_locator_behavior, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.srv6_locator_behavior, null)
        srv6_locator_binding_sid_type                                 = try(odc.srv6_locator_binding_sid_type, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.srv6_locator_binding_sid_type, null)
        srv6_locator_name                                             = try(odc.srv6_locator_name, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.srv6_locator_name, null)
        steering_invalidation_drop                                    = try(odc.steering_invalidation_drop, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.steering_invalidation_drop, null)
        steering_labeled_services_disable                             = try(odc.steering_labeled_services_disable, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.steering_labeled_services_disable, null)
        dynamic_affinity_rules = try(length(odc.dynamic_affinity_rules) == 0, true) ? null : [
          for rule in odc.dynamic_affinity_rules : {
            affinity_type = try(rule.affinity_type, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_affinity_rules.affinity_type, null)
            affinities = try(length(rule.affinities) == 0, true) ? null : [
              for aff in rule.affinities : {
                affinity_name = try(aff.affinity_name, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_affinity_rules.affinities.affinity_name, null)
              }
            ]
          }
        ]
        dynamic_bounds = try(length(odc.dynamic_bounds) == 0, true) ? null : [
          for bound in odc.dynamic_bounds : {
            type        = try(bound.type, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_bounds.type, null)
            metric_type = try(bound.metric_type, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_bounds.metric_type, null)
            value       = try(bound.value, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.dynamic_bounds.value, null)
          }
        ]
        per_flow_forward_classes = try(length(odc.per_flow_forward_classes) == 0, true) ? null : [
          for fc in odc.per_flow_forward_classes : {
            forward_class = try(fc.forward_class, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.per_flow_forward_classes.forward_class, null)
            color         = try(fc.color, local.defaults.iosxr.devices.configuration.segment_routing_te_on_demand_colors.per_flow_forward_classes.color, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_segment_routing_te_on_demand_color" "segment_routing_te_on_demand_color" {
  for_each                                                      = { for odc in local.segment_routing_te_on_demand_colors : odc.key => odc }
  device                                                        = each.value.device_name
  color                                                         = each.value.color
  bandwidth                                                     = each.value.bandwidth
  bfd_disable                                                   = each.value.bfd_disable
  bfd_enable                                                    = each.value.bfd_enable
  bfd_invalidation_action                                       = each.value.bfd_invalidation_action
  bfd_logging_session_state_change                              = each.value.bfd_logging_session_state_change
  bfd_minimum_interval                                          = each.value.bfd_minimum_interval
  bfd_multiplier                                                = each.value.bfd_multiplier
  bfd_reverse_path_binding_label                                = each.value.bfd_reverse_path_binding_label
  constraint_segments_protection_type                           = each.value.constraint_segments_protection_type
  constraint_segments_sid_algorithm                             = each.value.constraint_segments_sid_algorithm
  dynamic_affinity_rules                                        = each.value.dynamic_affinity_rules
  dynamic_anycast_sid_inclusion                                 = each.value.dynamic_anycast_sid_inclusion
  dynamic_bounds                                                = each.value.dynamic_bounds
  dynamic_disjoint_path_fallback_disable                        = each.value.dynamic_disjoint_path_fallback_disable
  dynamic_disjoint_path_group_id                                = each.value.dynamic_disjoint_path_group_id
  dynamic_disjoint_path_shortest_path                           = each.value.dynamic_disjoint_path_shortest_path
  dynamic_disjoint_path_sub_id                                  = each.value.dynamic_disjoint_path_sub_id
  dynamic_disjoint_path_type                                    = each.value.dynamic_disjoint_path_type
  dynamic_metric_margin_absolute                                = each.value.dynamic_metric_margin_absolute
  dynamic_metric_margin_relative                                = each.value.dynamic_metric_margin_relative
  dynamic_metric_margin_type                                    = each.value.dynamic_metric_margin_type
  dynamic_metric_type                                           = each.value.dynamic_metric_type
  dynamic_pcep                                                  = each.value.dynamic_pcep
  effective_metric_type                                         = each.value.effective_metric_type
  effective_metric_value                                        = each.value.effective_metric_value
  max_install_standby_paths                                     = each.value.max_install_standby_paths
  maximum_sid_depth                                             = each.value.maximum_sid_depth
  pce_group                                                     = each.value.pce_group
  per_flow                                                      = each.value.per_flow
  per_flow_forward_class_default                                = each.value.per_flow_forward_class_default
  per_flow_forward_classes                                      = each.value.per_flow_forward_classes
  performance_measurement_delay_logging_delay_exceeded          = each.value.performance_measurement_delay_logging_delay_exceeded
  performance_measurement_delay_profile                         = each.value.performance_measurement_delay_profile
  performance_measurement_liveness_backup_profile               = each.value.performance_measurement_liveness_backup_profile
  performance_measurement_liveness_invalidation_action          = each.value.performance_measurement_liveness_invalidation_action
  performance_measurement_liveness_logging_session_state_change = each.value.performance_measurement_liveness_logging_session_state_change
  performance_measurement_liveness_profile                      = each.value.performance_measurement_liveness_profile
  performance_measurement_reverse_path_label                    = each.value.performance_measurement_reverse_path_label
  performance_measurement_reverse_path_segment_list             = each.value.performance_measurement_reverse_path_segment_list
  source_address                                                = each.value.source_address
  source_address_type                                           = each.value.source_address_type
  srv6_locator_behavior                                         = each.value.srv6_locator_behavior
  srv6_locator_binding_sid_type                                 = each.value.srv6_locator_binding_sid_type
  srv6_locator_name                                             = each.value.srv6_locator_name
  steering_invalidation_drop                                    = each.value.steering_invalidation_drop
  steering_labeled_services_disable                             = each.value.steering_labeled_services_disable

  depends_on = [
    iosxr_segment_routing_te.segment_routing_te,
  ]
}
