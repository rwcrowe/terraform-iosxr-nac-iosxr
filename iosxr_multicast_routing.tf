##### Multicast Routing #####

locals {
  multicast_routing = flatten([
    for device in local.devices : [
      {
        key                                     = device.name
        device_name                             = device.name
        ipv4_ssm_range                          = try(local.device_config[device.name].multicast_routing.address_family_ipv4.ssm.range, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.ssm.range, null)
        ipv4_ssm_disable                        = try(local.device_config[device.name].multicast_routing.address_family_ipv4.ssm.disable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.ssm.disable, null)
        ipv4_ssm_allow_override                 = try(local.device_config[device.name].multicast_routing.address_family_ipv4.ssm.allow_override, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.ssm.allow_override, null)
        ipv4_mdt_source                         = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.source, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.source, null)
        ipv4_mdt_mtu                            = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.mtu, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.mtu, null)
        ipv4_rate_per_route                     = try(local.device_config[device.name].multicast_routing.address_family_ipv4.rate_per_route, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.rate_per_route, null)
        ipv4_multipath                          = try(local.device_config[device.name].multicast_routing.address_family_ipv4.multipath.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.multipath.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.multipath, null) != null ? true : null)
        ipv4_multipath_hash_source              = try(local.device_config[device.name].multicast_routing.address_family_ipv4.multipath.hash, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.multipath.hash, null) == "source" ? true : null
        ipv4_multipath_hash_source_nexthop      = try(local.device_config[device.name].multicast_routing.address_family_ipv4.multipath.hash, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.multipath.hash, null) == "source-nexthop" ? true : null
        ipv4_multipath_hash_source_group        = try(local.device_config[device.name].multicast_routing.address_family_ipv4.multipath.hash, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.multipath.hash, null) == "source-group" ? true : null
        ipv4_accounting_per_prefix              = try(local.device_config[device.name].multicast_routing.address_family_ipv4.accounting_per_prefix, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.accounting_per_prefix, null)
        ipv4_accounting_per_prefix_forward_only = try(local.device_config[device.name].multicast_routing.address_family_ipv4.accounting_per_prefix_forward_only, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.accounting_per_prefix_forward_only, null)
        ipv4_log_traps                          = try(local.device_config[device.name].multicast_routing.address_family_ipv4.log_traps, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.log_traps, null)
        ipv4_interface_inheritance_disable      = try(local.device_config[device.name].multicast_routing.address_family_ipv4.interface_inheritance_disable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.interface_inheritance_disable, null)
        ipv4_mofrr_lockout_timer                = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mofrr_lockout_timer, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mofrr_lockout_timer, null)
        ipv4_mofrr_loss_detection_timer         = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mofrr_loss_detection_timer, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mofrr_loss_detection_timer, null)
        ipv4_forwarding_latency_delay           = try(local.device_config[device.name].multicast_routing.address_family_ipv4.forwarding_latency_delay, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.forwarding_latency_delay, null)
        ipv4_route_rate_routes                  = try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_rate.routes, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_rate.routes, null)
        ipv4_route_rate_interval                = try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_rate.interval, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_rate.interval, null)
        ipv4_route_rate_freshwalk_interval      = try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_rate.freshwalk_interval, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_rate.freshwalk_interval, null)
        ipv4_export_rt_two_byte_as = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_target_exports, [])) == 0, true) ? null : [
          for rt in try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_target_exports, []) : {
            two_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number       = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "two_byte_as"
        ]
        ipv4_export_rt_four_byte_as = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_target_exports, [])) == 0, true) ? null : [
          for rt in try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_target_exports, []) : {
            four_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number        = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "four_byte_as"
        ]
        ipv4_export_rt_ip_address = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_target_exports, [])) == 0, true) ? null : [
          for rt in try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_target_exports, []) : {
            ip_address   = provider::utils::normalize_bgp_rt(rt).ipv4_address
            index_number = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "ipv4_address"
        ]
        ipv4_import_rt_two_byte_as = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_target_imports, [])) == 0, true) ? null : [
          for rt in try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_target_imports, []) : {
            two_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number       = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "two_byte_as"
        ]
        ipv4_import_rt_four_byte_as = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_target_imports, [])) == 0, true) ? null : [
          for rt in try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_target_imports, []) : {
            four_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number        = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "four_byte_as"
        ]
        ipv4_import_rt_ip_address = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_target_imports, [])) == 0, true) ? null : [
          for rt in try(local.device_config[device.name].multicast_routing.address_family_ipv4.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.route_target_imports, []) : {
            ip_address   = provider::utils::normalize_bgp_rt(rt).ipv4_address
            index_number = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "ipv4_address"
        ]
        ipv4_interfaces_all_enable = try(local.device_config[device.name].multicast_routing.address_family_ipv4.interfaces_all_enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.interfaces_all_enable, null)
        ipv4_interfaces = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv4.interfaces, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.interfaces, [])) == 0, true) ? null : [
          for item in try(local.device_config[device.name].multicast_routing.address_family_ipv4.interfaces, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.interfaces, []) : {
            interface_name = try(item.name, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.interfaces.name, null)
            enable         = try(item.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.interfaces.enable, null)
            disable        = try(item.disable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.interfaces.disable, null)
            boundary       = try(item.boundary, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.interfaces.boundary, null)
            ttl_threshold  = try(item.ttl_threshold, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.interfaces.ttl_threshold, null)
          }
        ]
        ipv4_maximum_disable                                  = try(local.device_config[device.name].multicast_routing.address_family_ipv4.maximum_disable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.maximum_disable, null)
        ipv4_oom_handling                                     = try(local.device_config[device.name].multicast_routing.address_family_ipv4.oom_handling, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.oom_handling, null)
        ipv4_bgp_auto_discovery_core_tree                     = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.core_tree, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.core_tree, null)
        ipv4_bgp_auto_discovery_leaf_info_required            = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.leaf_info_required, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.leaf_info_required, null)
        ipv4_bgp_auto_discovery_dynamic_ssm_translation       = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.dynamic_ssm_translation, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.dynamic_ssm_translation, null)
        ipv4_bgp_auto_discovery_inter_as                      = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.inter_as, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.inter_as, null)
        ipv4_bgp_auto_discovery_receiver_site                 = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.receiver_site, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.receiver_site, null)
        ipv4_bgp_auto_discovery_anycast_rp                    = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.anycast_rp.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.anycast_rp.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.anycast_rp, null) != null ? true : null)
        ipv4_bgp_auto_discovery_anycast_rp_route_policy       = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.anycast_rp.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.anycast_rp.route_policy, null)
        ipv4_bgp_auto_discovery_pmsi_timer_change_delay       = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.pmsi_timer.change_delay, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.pmsi_timer.change_delay, null)
        ipv4_bgp_auto_discovery_pmsi_timer_stop_forwarding    = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.pmsi_timer.stop_forwarding, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.pmsi_timer.stop_forwarding, null)
        ipv4_bgp_auto_discovery_segmented                     = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.segmented.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.segmented.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.segmented, null) != null ? true : null)
        ipv4_bgp_auto_discovery_segmented_bandwidth_threshold = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.segmented.bandwidth_threshold, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.segmented.bandwidth_threshold, null)
        ipv4_bgp_auto_discovery_segmented_color               = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.segmented.color, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.segmented.color, null)
        ipv4_bgp_auto_discovery_inherit_vrf_ri_vrf            = try(local.device_config[device.name].multicast_routing.address_family_ipv4.bgp.auto_discovery.inherit_vrf_ri_vrf, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.bgp.auto_discovery.inherit_vrf_ri_vrf, null)
        ipv4_static_rpf_address_ranges = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv4.static_rpf, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.static_rpf, [])) == 0, true) ? null : [
          for item in try(local.device_config[device.name].multicast_routing.address_family_ipv4.static_rpf, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.static_rpf, []) : {
            prefix_address   = try(item.prefix_address, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.static_rpf.prefix_address, null)
            prefix_length    = try(item.prefix_length, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.static_rpf.prefix_length, null)
            interface        = try(item.interface, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.static_rpf.interface, null)
            next_hop_address = try(item.next_hop_address, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.static_rpf.next_hop_address, null)
          }
        ]
        ipv4_core_tree_protocol_rsvp_te                                    = try(local.device_config[device.name].multicast_routing.address_family_ipv4.core_tree_protocol.rsvp_te.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.core_tree_protocol.rsvp_te.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.core_tree_protocol.rsvp_te, null) != null ? true : null)
        ipv4_core_tree_protocol_rsvp_te_group_list                         = try(local.device_config[device.name].multicast_routing.address_family_ipv4.core_tree_protocol.rsvp_te.group_list, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.core_tree_protocol.rsvp_te.group_list, null)
        ipv4_mdt_data_ingress_replication                                  = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.ingress_replication.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.ingress_replication.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.ingress_replication, null) != null ? true : null)
        ipv4_mdt_data_ingress_replication_auto_tunnel                      = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.ingress_replication.auto_tunnel.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.ingress_replication.auto_tunnel.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.ingress_replication.auto_tunnel, null) != null ? true : null)
        ipv4_mdt_data_ingress_replication_auto_tunnel_attribute_set        = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.ingress_replication.auto_tunnel.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.ingress_replication.auto_tunnel.attribute_set, null)
        ipv4_mdt_data_ingress_replication_number                           = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.ingress_replication.number, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.ingress_replication.number, null)
        ipv4_mdt_data_ingress_replication_access_list_name                 = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.ingress_replication.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.ingress_replication.access_list, null)
        ipv4_mdt_data_ingress_replication_immediate_switch                 = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.ingress_replication.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.ingress_replication.immediate_switch, null)
        ipv4_mdt_data_ingress_replication_route_policy                     = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.ingress_replication.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.ingress_replication.route_policy, null)
        ipv4_mdt_data_ingress_replication_threshold                        = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.ingress_replication.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.ingress_replication.threshold, null)
        ipv4_mdt_data_mldp_maximum_number                                  = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.mldp.maximum_number, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.mldp.maximum_number, null)
        ipv4_mdt_data_mldp_access_list_name                                = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.mldp.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.mldp.access_list, null)
        ipv4_mdt_data_mldp_immediate_switch                                = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.mldp.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.mldp.immediate_switch, null)
        ipv4_mdt_data_mldp_route_policy                                    = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.mldp.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.mldp.route_policy, null)
        ipv4_mdt_data_mldp_threshold                                       = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.mldp.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.mldp.threshold, null)
        ipv4_mdt_data_mldp_flex_algo                                       = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.mldp.flex_algo, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.mldp.flex_algo, null)
        ipv4_mdt_data_p2mp_te                                              = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.p2mp_te.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.p2mp_te.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.p2mp_te, null) != null ? true : null)
        ipv4_mdt_data_p2mp_te_maximum_number                               = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.p2mp_te.maximum_number, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.p2mp_te.maximum_number, null)
        ipv4_mdt_data_p2mp_te_attribute_set                                = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.p2mp_te.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.p2mp_te.attribute_set, null)
        ipv4_mdt_data_p2mp_te_access_list_name                             = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.p2mp_te.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.p2mp_te.access_list, null)
        ipv4_mdt_data_p2mp_te_immediate_switch                             = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.p2mp_te.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.p2mp_te.immediate_switch, null)
        ipv4_mdt_data_p2mp_te_route_policy                                 = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.p2mp_te.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.p2mp_te.route_policy, null)
        ipv4_mdt_data_p2mp_te_threshold                                    = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.p2mp_te.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.p2mp_te.threshold, null)
        ipv4_mdt_data_segment_routing_mpls_maximum_number                  = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.maximum_number, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.maximum_number, null)
        ipv4_mdt_data_segment_routing_mpls_color                           = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.color, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.color, null)
        ipv4_mdt_data_segment_routing_mpls_fast_reroute_lfa                = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.fast_reroute_lfa, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.fast_reroute_lfa, null)
        ipv4_mdt_data_segment_routing_mpls_route_policy                    = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.route_policy, null)
        ipv4_mdt_data_segment_routing_mpls_threshold                       = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.threshold, null)
        ipv4_mdt_data_segment_routing_mpls_access_list_name                = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.access_list, null)
        ipv4_mdt_data_segment_routing_mpls_immediate_switch                = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.data.segment_routing.mpls.immediate_switch, null)
        ipv4_mdt_default_mldp_p2mp                                         = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.default.mldp.p2mp.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.default.mldp.p2mp.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.default.mldp.p2mp, null) != null ? true : null)
        ipv4_mdt_default_mldp_p2mp_flex_algo                               = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.default.mldp.p2mp.flex_algo, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.default.mldp.p2mp.flex_algo, null)
        ipv4_mdt_default_p2mp_te_attribute_set                             = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.default.p2mp_te.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.default.p2mp_te.attribute_set, null)
        ipv4_mdt_default_ingress_replication                               = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.default.ingress_replication.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.default.ingress_replication.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.default.ingress_replication, null) != null ? true : null)
        ipv4_mdt_default_ingress_replication_auto_tunnel                   = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.default.ingress_replication.auto_tunnel.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.default.ingress_replication.auto_tunnel.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.default.ingress_replication.auto_tunnel, null) != null ? true : null)
        ipv4_mdt_default_ingress_replication_auto_tunnel_attribute_set     = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.default.ingress_replication.auto_tunnel.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.default.ingress_replication.auto_tunnel.attribute_set, null)
        ipv4_mdt_default_segment_routing_mpls_color                        = try(tostring(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.default.segment_routing.mpls.color), tostring(local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.default.segment_routing.mpls.color), null)
        ipv4_mdt_default_segment_routing_mpls_fast_reroute_lfa             = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.default.segment_routing.mpls.fast_reroute_lfa, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.default.segment_routing.mpls.fast_reroute_lfa, null)
        ipv4_mdt_segment_border                                            = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.segment_border, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.segment_border, null)
        ipv4_mdt_segment_border_route_policy                               = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.segment_border_route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.segment_border_route_policy, null)
        ipv4_mdt_segmented_inband_core_tree                                = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.segmented_inband.core_tree, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.segmented_inband.core_tree, null)
        ipv4_mdt_segmented_inband_color                                    = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.segmented_inband.color, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.segmented_inband.color, null)
        ipv4_mdt_partitioned_p2mp_te_attribute_set                         = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.partitioned.p2mp_te.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.partitioned.p2mp_te.attribute_set, null)
        ipv4_mdt_partitioned_mldp_ipv4_p2mp                                = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp, null) != null ? true : null)
        ipv4_mdt_partitioned_mldp_ipv4_p2mp_bidir                          = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp.bidir, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp.bidir, null)
        ipv4_mdt_partitioned_mldp_ipv4_flex_algo                           = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp.flex_algo, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp.flex_algo, null)
        ipv4_mdt_partitioned_ingress_replication                           = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.partitioned.ingress_replication.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.partitioned.ingress_replication.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.partitioned.ingress_replication, null) != null ? true : null)
        ipv4_mdt_partitioned_ingress_replication_auto_tunnel               = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.partitioned.ingress_replication.auto_tunnel.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.partitioned.ingress_replication.auto_tunnel.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.partitioned.ingress_replication.auto_tunnel, null) != null ? true : null)
        ipv4_mdt_partitioned_ingress_replication_auto_tunnel_attribute_set = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.partitioned.ingress_replication.auto_tunnel.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.partitioned.ingress_replication.auto_tunnel.attribute_set, null)
        ipv4_mdt_partitioned_segment_routing_mpls_color                    = try(tostring(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.partitioned.segment_routing.mpls.color), tostring(local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.partitioned.segment_routing.mpls.color), null)
        ipv4_mdt_partitioned_segment_routing_mpls_fast_reroute_lfa         = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.partitioned.segment_routing.mpls.fast_reroute_lfa, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.partitioned.segment_routing.mpls.fast_reroute_lfa, null)
        ipv4_mdt_mldp_in_band_signaling_ipv4                               = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.mldp.in_band_signaling_ipv4, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.mldp.in_band_signaling_ipv4, null)
        ipv4_mdt_static_segment_routing                                    = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.static.segment_routing, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.static.segment_routing, null)
        ipv4_mdt_static_segment_routing_strict_rpf                         = try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.static.segment_routing_strict_rpf, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.static.segment_routing_strict_rpf, null)
        ipv4_mdt_static_p2mp_te_interfaces = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.static.p2mp_te.interfaces, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.static.p2mp_te.interfaces, [])) == 0, true) ? null : [
          for item in try(local.device_config[device.name].multicast_routing.address_family_ipv4.mdt.static.p2mp_te.interfaces, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.static.p2mp_te.interfaces, []) : {
            interface_name = try(item.name, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.mdt.static.p2mp_te.interfaces.name, null)
          }
        ]
        ipv4_static_sr_policies = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv4.static_sr_policies, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.static_sr_policies, [])) == 0, true) ? null : [
          for item in try(local.device_config[device.name].multicast_routing.address_family_ipv4.static_sr_policies, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.static_sr_policies, []) : {
            sr_policy_name = try(item.policy_name, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.static_sr_policies.policy_name, null)
            ingress        = try(item.ingress, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.static_sr_policies.ingress, null)
          }
        ]
        ipv4                                    = try(local.device_config[device.name].multicast_routing.address_family_ipv4.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv4, null) != null ? true : null)
        ipv6_ssm_range                          = try(local.device_config[device.name].multicast_routing.address_family_ipv6.ssm.range, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.ssm.range, null)
        ipv6_ssm_disable                        = try(local.device_config[device.name].multicast_routing.address_family_ipv6.ssm.disable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.ssm.disable, null)
        ipv6_ssm_allow_override                 = try(local.device_config[device.name].multicast_routing.address_family_ipv6.ssm.allow_override, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.ssm.allow_override, null)
        ipv6_mdt_source                         = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.source, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.source, null)
        ipv6_mdt_mtu                            = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.mtu, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.mtu, null)
        ipv6_rate_per_route                     = try(local.device_config[device.name].multicast_routing.address_family_ipv6.rate_per_route, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.rate_per_route, null)
        ipv6_multipath                          = try(local.device_config[device.name].multicast_routing.address_family_ipv6.multipath.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.multipath.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.multipath, null) != null ? true : null)
        ipv6_multipath_hash_source_nexthop      = try(local.device_config[device.name].multicast_routing.address_family_ipv6.multipath.hash, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.multipath.hash, null) == "source-nexthop" ? true : null
        ipv6_multipath_hash_interface_extended  = try(local.device_config[device.name].multicast_routing.address_family_ipv6.multipath.hash, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.multipath.hash, null) == "interface-extended" ? true : null
        ipv6_multipath_hash_source_group        = try(local.device_config[device.name].multicast_routing.address_family_ipv6.multipath.hash, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.multipath.hash, null) == "source-group" ? true : null
        ipv6_accounting_per_prefix              = try(local.device_config[device.name].multicast_routing.address_family_ipv6.accounting_per_prefix, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.accounting_per_prefix, null)
        ipv6_accounting_per_prefix_forward_only = try(local.device_config[device.name].multicast_routing.address_family_ipv6.accounting_per_prefix_forward_only, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.accounting_per_prefix_forward_only, null)
        ipv6_log_traps                          = try(local.device_config[device.name].multicast_routing.address_family_ipv6.log_traps, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.log_traps, null)
        ipv6_interface_inheritance_disable      = try(local.device_config[device.name].multicast_routing.address_family_ipv6.interface_inheritance_disable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.interface_inheritance_disable, null)
        ipv6_mofrr_lockout_timer                = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mofrr_lockout_timer, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mofrr_lockout_timer, null)
        ipv6_mofrr_loss_detection_timer         = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mofrr_loss_detection_timer, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mofrr_loss_detection_timer, null)
        ipv6_forwarding_latency_delay           = try(local.device_config[device.name].multicast_routing.address_family_ipv6.forwarding_latency_delay, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.forwarding_latency_delay, null)
        ipv6_export_rt_two_byte_as = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv6.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.route_target_exports, [])) == 0, true) ? null : [
          for rt in try(local.device_config[device.name].multicast_routing.address_family_ipv6.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.route_target_exports, []) : {
            two_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number       = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "two_byte_as"
        ]
        ipv6_export_rt_four_byte_as = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv6.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.route_target_exports, [])) == 0, true) ? null : [
          for rt in try(local.device_config[device.name].multicast_routing.address_family_ipv6.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.route_target_exports, []) : {
            four_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number        = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "four_byte_as"
        ]
        ipv6_export_rt_ip_address = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv6.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.route_target_exports, [])) == 0, true) ? null : [
          for rt in try(local.device_config[device.name].multicast_routing.address_family_ipv6.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.route_target_exports, []) : {
            ip_address   = provider::utils::normalize_bgp_rt(rt).ipv4_address
            index_number = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "ipv4_address"
        ]
        ipv6_import_rt_two_byte_as = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv6.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.route_target_imports, [])) == 0, true) ? null : [
          for rt in try(local.device_config[device.name].multicast_routing.address_family_ipv6.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.route_target_imports, []) : {
            two_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number       = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "two_byte_as"
        ]
        ipv6_import_rt_four_byte_as = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv6.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.route_target_imports, [])) == 0, true) ? null : [
          for rt in try(local.device_config[device.name].multicast_routing.address_family_ipv6.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.route_target_imports, []) : {
            four_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number        = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "four_byte_as"
        ]
        ipv6_import_rt_ip_address = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv6.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.route_target_imports, [])) == 0, true) ? null : [
          for rt in try(local.device_config[device.name].multicast_routing.address_family_ipv6.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.route_target_imports, []) : {
            ip_address   = provider::utils::normalize_bgp_rt(rt).ipv4_address
            index_number = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "ipv4_address"
        ]
        ipv6_interfaces_all_enable = try(local.device_config[device.name].multicast_routing.address_family_ipv6.interfaces_all_enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.interfaces_all_enable, null)
        ipv6_interfaces = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv6.interfaces, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.interfaces, [])) == 0, true) ? null : [
          for item in try(local.device_config[device.name].multicast_routing.address_family_ipv6.interfaces, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.interfaces, []) : {
            interface_name = try(item.name, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.interfaces.name, null)
            enable         = try(item.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.interfaces.enable, null)
            disable        = try(item.disable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.interfaces.disable, null)
            boundary       = try(item.boundary, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.interfaces.boundary, null)
            ttl_threshold  = try(item.ttl_threshold, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.interfaces.ttl_threshold, null)
          }
        ]
        ipv6_maximum_disable                                  = try(local.device_config[device.name].multicast_routing.address_family_ipv6.maximum_disable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.maximum_disable, null)
        ipv6_bgp_auto_discovery_core_tree                     = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.core_tree, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.core_tree, null)
        ipv6_bgp_auto_discovery_leaf_info_required            = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.leaf_info_required, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.leaf_info_required, null)
        ipv6_bgp_auto_discovery_dynamic_ssm_translation       = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.dynamic_ssm_translation, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.dynamic_ssm_translation, null)
        ipv6_bgp_auto_discovery_inter_as                      = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.inter_as, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.inter_as, null)
        ipv6_bgp_auto_discovery_receiver_site                 = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.receiver_site, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.receiver_site, null)
        ipv6_bgp_auto_discovery_anycast_rp                    = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.anycast_rp.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.anycast_rp.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.anycast_rp, null) != null ? true : null)
        ipv6_bgp_auto_discovery_anycast_rp_route_policy       = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.anycast_rp.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.anycast_rp.route_policy, null)
        ipv6_bgp_auto_discovery_pmsi_timer_change_delay       = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.pmsi_timer.change_delay, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.pmsi_timer.change_delay, null)
        ipv6_bgp_auto_discovery_pmsi_timer_stop_forwarding    = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.pmsi_timer.stop_forwarding, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.pmsi_timer.stop_forwarding, null)
        ipv6_bgp_auto_discovery_segmented                     = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.segmented.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.segmented.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.segmented, null) != null ? true : null)
        ipv6_bgp_auto_discovery_segmented_bandwidth_threshold = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.segmented.bandwidth_threshold, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.segmented.bandwidth_threshold, null)
        ipv6_bgp_auto_discovery_segmented_color               = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.segmented.color, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.segmented.color, null)
        ipv6_bgp_auto_discovery_inherit_vrf_ri_vrf            = try(local.device_config[device.name].multicast_routing.address_family_ipv6.bgp.auto_discovery.inherit_vrf_ri_vrf, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.bgp.auto_discovery.inherit_vrf_ri_vrf, null)
        ipv6_static_rpf_address_ranges = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv6.static_rpf, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.static_rpf, [])) == 0, true) ? null : [
          for item in try(local.device_config[device.name].multicast_routing.address_family_ipv6.static_rpf, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.static_rpf, []) : {
            prefix_address   = try(item.prefix_address, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.static_rpf.prefix_address, null)
            prefix_length    = try(item.prefix_length, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.static_rpf.prefix_length, null)
            interface        = try(item.interface, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.static_rpf.interface, null)
            next_hop_address = try(item.next_hop_address, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.static_rpf.next_hop_address, null)
          }
        ]
        ipv6_core_tree_protocol_rsvp_te                                    = try(local.device_config[device.name].multicast_routing.address_family_ipv6.core_tree_protocol.rsvp_te.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.core_tree_protocol.rsvp_te.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.core_tree_protocol.rsvp_te, null) != null ? true : null)
        ipv6_core_tree_protocol_rsvp_te_group_list                         = try(local.device_config[device.name].multicast_routing.address_family_ipv6.core_tree_protocol.rsvp_te.group_list, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.core_tree_protocol.rsvp_te.group_list, null)
        ipv6_mdt_data_ingress_replication                                  = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.ingress_replication.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.ingress_replication.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.ingress_replication, null) != null ? true : null)
        ipv6_mdt_data_ingress_replication_auto_tunnel                      = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.ingress_replication.auto_tunnel.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.ingress_replication.auto_tunnel.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.ingress_replication.auto_tunnel, null) != null ? true : null)
        ipv6_mdt_data_ingress_replication_auto_tunnel_attribute_set        = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.ingress_replication.auto_tunnel.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.ingress_replication.auto_tunnel.attribute_set, null)
        ipv6_mdt_data_ingress_replication_number                           = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.ingress_replication.number, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.ingress_replication.number, null)
        ipv6_mdt_data_ingress_replication_access_list_name                 = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.ingress_replication.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.ingress_replication.access_list, null)
        ipv6_mdt_data_ingress_replication_immediate_switch                 = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.ingress_replication.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.ingress_replication.immediate_switch, null)
        ipv6_mdt_data_ingress_replication_route_policy                     = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.ingress_replication.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.ingress_replication.route_policy, null)
        ipv6_mdt_data_ingress_replication_threshold                        = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.ingress_replication.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.ingress_replication.threshold, null)
        ipv6_mdt_data_mldp_maximum_number                                  = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.mldp.maximum_number, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.mldp.maximum_number, null)
        ipv6_mdt_data_mldp_access_list_name                                = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.mldp.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.mldp.access_list, null)
        ipv6_mdt_data_mldp_immediate_switch                                = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.mldp.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.mldp.immediate_switch, null)
        ipv6_mdt_data_mldp_route_policy                                    = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.mldp.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.mldp.route_policy, null)
        ipv6_mdt_data_mldp_threshold                                       = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.mldp.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.mldp.threshold, null)
        ipv6_mdt_data_mldp_flex_algo                                       = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.mldp.flex_algo, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.mldp.flex_algo, null)
        ipv6_mdt_data_p2mp_te                                              = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.p2mp_te.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.p2mp_te.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.p2mp_te, null) != null ? true : null)
        ipv6_mdt_data_p2mp_te_maximum_number                               = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.p2mp_te.maximum_number, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.p2mp_te.maximum_number, null)
        ipv6_mdt_data_p2mp_te_attribute_set                                = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.p2mp_te.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.p2mp_te.attribute_set, null)
        ipv6_mdt_data_p2mp_te_access_list_name                             = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.p2mp_te.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.p2mp_te.access_list, null)
        ipv6_mdt_data_p2mp_te_immediate_switch                             = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.p2mp_te.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.p2mp_te.immediate_switch, null)
        ipv6_mdt_data_p2mp_te_route_policy                                 = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.p2mp_te.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.p2mp_te.route_policy, null)
        ipv6_mdt_data_p2mp_te_threshold                                    = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.data.p2mp_te.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.data.p2mp_te.threshold, null)
        ipv6_mdt_default_mldp_p2mp                                         = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.default.mldp.p2mp.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.default.mldp.p2mp.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.default.mldp.p2mp, null) != null ? true : null)
        ipv6_mdt_default_mldp_p2mp_partitioned_bidir                       = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.default.mldp.p2mp.partitioned_bidir, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.default.mldp.p2mp.partitioned_bidir, null)
        ipv6_mdt_default_mldp_p2mp_flex_algo                               = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.default.mldp.p2mp.flex_algo, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.default.mldp.p2mp.flex_algo, null)
        ipv6_mdt_default_p2mp_te_attribute_set                             = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.default.p2mp_te.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.default.p2mp_te.attribute_set, null)
        ipv6_mdt_default_ingress_replication                               = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.default.ingress_replication.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.default.ingress_replication.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.default.ingress_replication, null) != null ? true : null)
        ipv6_mdt_default_ingress_replication_auto_tunnel                   = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.default.ingress_replication.auto_tunnel.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.default.ingress_replication.auto_tunnel.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.default.ingress_replication.auto_tunnel, null) != null ? true : null)
        ipv6_mdt_default_ingress_replication_auto_tunnel_attribute_set     = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.default.ingress_replication.auto_tunnel.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.default.ingress_replication.auto_tunnel.attribute_set, null)
        ipv6_mdt_segment_border                                            = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.segment_border, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.segment_border, null)
        ipv6_mdt_segment_border_route_policy                               = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.segment_border_route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.segment_border_route_policy, null)
        ipv6_mdt_segmented_inband_core_tree                                = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.segmented_inband.core_tree, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.segmented_inband.core_tree, null)
        ipv6_mdt_segmented_inband_color                                    = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.segmented_inband.color, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.segmented_inband.color, null)
        ipv6_mdt_partitioned_p2mp_te_attribute_set                         = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.partitioned.p2mp_te.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.partitioned.p2mp_te.attribute_set, null)
        ipv6_mdt_partitioned_mldp_ipv4_p2mp                                = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp, null) != null ? true : null)
        ipv6_mdt_partitioned_mldp_ipv4_p2mp_bidir                          = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp.bidir, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp.bidir, null)
        ipv6_mdt_partitioned_mldp_ipv4_flex_algo                           = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp.flex_algo, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp.flex_algo, null)
        ipv6_mdt_partitioned_ingress_replication                           = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.partitioned.ingress_replication.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.partitioned.ingress_replication.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.partitioned.ingress_replication, null) != null ? true : null)
        ipv6_mdt_partitioned_ingress_replication_auto_tunnel               = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.partitioned.ingress_replication.auto_tunnel.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.partitioned.ingress_replication.auto_tunnel.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.partitioned.ingress_replication.auto_tunnel, null) != null ? true : null)
        ipv6_mdt_partitioned_ingress_replication_auto_tunnel_attribute_set = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.partitioned.ingress_replication.auto_tunnel.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.partitioned.ingress_replication.auto_tunnel.attribute_set, null)
        ipv6_mdt_mldp_in_band_signaling_ipv4                               = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.mldp.in_band_signaling_ipv4, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.mldp.in_band_signaling_ipv4, null)
        ipv6_mdt_static_segment_routing                                    = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.static.segment_routing, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.static.segment_routing, null)
        ipv6_mdt_static_segment_routing_strict_rpf                         = try(local.device_config[device.name].multicast_routing.address_family_ipv6.mdt.static.segment_routing_strict_rpf, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.mdt.static.segment_routing_strict_rpf, null)
        ipv6_static_sr_policies = try(length(try(local.device_config[device.name].multicast_routing.address_family_ipv6.static_sr_policies, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.static_sr_policies, [])) == 0, true) ? null : [
          for item in try(local.device_config[device.name].multicast_routing.address_family_ipv6.static_sr_policies, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.static_sr_policies, []) : {
            sr_policy_name = try(item.policy_name, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.static_sr_policies.policy_name, null)
            ingress        = try(item.ingress, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.static_sr_policies.ingress, null)
          }
        ]
        ipv6 = try(local.device_config[device.name].multicast_routing.address_family_ipv6.enable, local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6.enable, try(local.device_config[device.name].multicast_routing.address_family_ipv6, null) != null ? true : null)
      }
    ] if try(local.device_config[device.name].multicast_routing.address_family_ipv4, null) != null ||
    try(local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv4, null) != null ||
    try(local.device_config[device.name].multicast_routing.address_family_ipv6, null) != null ||
    try(local.defaults.iosxr.devices.configuration.multicast_routing.address_family_ipv6, null) != null
  ])
}

resource "iosxr_multicast_routing" "multicast_routing" {
  for_each                                                           = { for item in local.multicast_routing : item.key => item }
  device                                                             = each.value.device_name
  ipv4_ssm_range                                                     = each.value.ipv4_ssm_range
  ipv4_ssm_disable                                                   = each.value.ipv4_ssm_disable
  ipv4_ssm_allow_override                                            = each.value.ipv4_ssm_allow_override
  ipv4_mdt_source                                                    = each.value.ipv4_mdt_source
  ipv4_mdt_mtu                                                       = each.value.ipv4_mdt_mtu
  ipv4_rate_per_route                                                = each.value.ipv4_rate_per_route
  ipv4_multipath                                                     = each.value.ipv4_multipath
  ipv4_multipath_hash_source                                         = each.value.ipv4_multipath_hash_source
  ipv4_multipath_hash_source_nexthop                                 = each.value.ipv4_multipath_hash_source_nexthop
  ipv4_multipath_hash_source_group                                   = each.value.ipv4_multipath_hash_source_group
  ipv4_accounting_per_prefix                                         = each.value.ipv4_accounting_per_prefix
  ipv4_accounting_per_prefix_forward_only                            = each.value.ipv4_accounting_per_prefix_forward_only
  ipv4_log_traps                                                     = each.value.ipv4_log_traps
  ipv4_interface_inheritance_disable                                 = each.value.ipv4_interface_inheritance_disable
  ipv4_mofrr_lockout_timer                                           = each.value.ipv4_mofrr_lockout_timer
  ipv4_mofrr_loss_detection_timer                                    = each.value.ipv4_mofrr_loss_detection_timer
  ipv4_forwarding_latency_delay                                      = each.value.ipv4_forwarding_latency_delay
  ipv4_route_rate_routes                                             = each.value.ipv4_route_rate_routes
  ipv4_route_rate_interval                                           = each.value.ipv4_route_rate_interval
  ipv4_route_rate_freshwalk_interval                                 = each.value.ipv4_route_rate_freshwalk_interval
  ipv4_export_rt_two_byte_as                                         = each.value.ipv4_export_rt_two_byte_as
  ipv4_export_rt_four_byte_as                                        = each.value.ipv4_export_rt_four_byte_as
  ipv4_export_rt_ip_address                                          = each.value.ipv4_export_rt_ip_address
  ipv4_import_rt_two_byte_as                                         = each.value.ipv4_import_rt_two_byte_as
  ipv4_import_rt_four_byte_as                                        = each.value.ipv4_import_rt_four_byte_as
  ipv4_import_rt_ip_address                                          = each.value.ipv4_import_rt_ip_address
  ipv4_interfaces_all_enable                                         = each.value.ipv4_interfaces_all_enable
  ipv4_interfaces                                                    = each.value.ipv4_interfaces
  ipv4_maximum_disable                                               = each.value.ipv4_maximum_disable
  ipv4_oom_handling                                                  = each.value.ipv4_oom_handling
  ipv4_bgp_auto_discovery_core_tree                                  = each.value.ipv4_bgp_auto_discovery_core_tree
  ipv4_bgp_auto_discovery_leaf_info_required                         = each.value.ipv4_bgp_auto_discovery_leaf_info_required
  ipv4_bgp_auto_discovery_dynamic_ssm_translation                    = each.value.ipv4_bgp_auto_discovery_dynamic_ssm_translation
  ipv4_bgp_auto_discovery_inter_as                                   = each.value.ipv4_bgp_auto_discovery_inter_as
  ipv4_bgp_auto_discovery_receiver_site                              = each.value.ipv4_bgp_auto_discovery_receiver_site
  ipv4_bgp_auto_discovery_anycast_rp                                 = each.value.ipv4_bgp_auto_discovery_anycast_rp
  ipv4_bgp_auto_discovery_anycast_rp_route_policy                    = each.value.ipv4_bgp_auto_discovery_anycast_rp_route_policy
  ipv4_bgp_auto_discovery_pmsi_timer_change_delay                    = each.value.ipv4_bgp_auto_discovery_pmsi_timer_change_delay
  ipv4_bgp_auto_discovery_pmsi_timer_stop_forwarding                 = each.value.ipv4_bgp_auto_discovery_pmsi_timer_stop_forwarding
  ipv4_bgp_auto_discovery_segmented                                  = each.value.ipv4_bgp_auto_discovery_segmented
  ipv4_bgp_auto_discovery_segmented_bandwidth_threshold              = each.value.ipv4_bgp_auto_discovery_segmented_bandwidth_threshold
  ipv4_bgp_auto_discovery_segmented_color                            = each.value.ipv4_bgp_auto_discovery_segmented_color
  ipv4_bgp_auto_discovery_inherit_vrf_ri_vrf                         = each.value.ipv4_bgp_auto_discovery_inherit_vrf_ri_vrf
  ipv4_static_rpf_address_ranges                                     = each.value.ipv4_static_rpf_address_ranges
  ipv4_core_tree_protocol_rsvp_te                                    = each.value.ipv4_core_tree_protocol_rsvp_te
  ipv4_core_tree_protocol_rsvp_te_group_list                         = each.value.ipv4_core_tree_protocol_rsvp_te_group_list
  ipv4_mdt_data_ingress_replication                                  = each.value.ipv4_mdt_data_ingress_replication
  ipv4_mdt_data_ingress_replication_auto_tunnel                      = each.value.ipv4_mdt_data_ingress_replication_auto_tunnel
  ipv4_mdt_data_ingress_replication_auto_tunnel_attribute_set        = each.value.ipv4_mdt_data_ingress_replication_auto_tunnel_attribute_set
  ipv4_mdt_data_ingress_replication_number                           = each.value.ipv4_mdt_data_ingress_replication_number
  ipv4_mdt_data_ingress_replication_access_list_name                 = each.value.ipv4_mdt_data_ingress_replication_access_list_name
  ipv4_mdt_data_ingress_replication_immediate_switch                 = each.value.ipv4_mdt_data_ingress_replication_immediate_switch
  ipv4_mdt_data_ingress_replication_route_policy                     = each.value.ipv4_mdt_data_ingress_replication_route_policy
  ipv4_mdt_data_ingress_replication_threshold                        = each.value.ipv4_mdt_data_ingress_replication_threshold
  ipv4_mdt_data_mldp_maximum_number                                  = each.value.ipv4_mdt_data_mldp_maximum_number
  ipv4_mdt_data_mldp_access_list_name                                = each.value.ipv4_mdt_data_mldp_access_list_name
  ipv4_mdt_data_mldp_immediate_switch                                = each.value.ipv4_mdt_data_mldp_immediate_switch
  ipv4_mdt_data_mldp_route_policy                                    = each.value.ipv4_mdt_data_mldp_route_policy
  ipv4_mdt_data_mldp_threshold                                       = each.value.ipv4_mdt_data_mldp_threshold
  ipv4_mdt_data_mldp_flex_algo                                       = each.value.ipv4_mdt_data_mldp_flex_algo
  ipv4_mdt_data_p2mp_te                                              = each.value.ipv4_mdt_data_p2mp_te
  ipv4_mdt_data_p2mp_te_maximum_number                               = each.value.ipv4_mdt_data_p2mp_te_maximum_number
  ipv4_mdt_data_p2mp_te_attribute_set                                = each.value.ipv4_mdt_data_p2mp_te_attribute_set
  ipv4_mdt_data_p2mp_te_access_list_name                             = each.value.ipv4_mdt_data_p2mp_te_access_list_name
  ipv4_mdt_data_p2mp_te_immediate_switch                             = each.value.ipv4_mdt_data_p2mp_te_immediate_switch
  ipv4_mdt_data_p2mp_te_route_policy                                 = each.value.ipv4_mdt_data_p2mp_te_route_policy
  ipv4_mdt_data_p2mp_te_threshold                                    = each.value.ipv4_mdt_data_p2mp_te_threshold
  ipv4_mdt_data_segment_routing_mpls_maximum_number                  = each.value.ipv4_mdt_data_segment_routing_mpls_maximum_number
  ipv4_mdt_data_segment_routing_mpls_color                           = each.value.ipv4_mdt_data_segment_routing_mpls_color
  ipv4_mdt_data_segment_routing_mpls_fast_reroute_lfa                = each.value.ipv4_mdt_data_segment_routing_mpls_fast_reroute_lfa
  ipv4_mdt_data_segment_routing_mpls_route_policy                    = each.value.ipv4_mdt_data_segment_routing_mpls_route_policy
  ipv4_mdt_data_segment_routing_mpls_threshold                       = each.value.ipv4_mdt_data_segment_routing_mpls_threshold
  ipv4_mdt_data_segment_routing_mpls_access_list_name                = each.value.ipv4_mdt_data_segment_routing_mpls_access_list_name
  ipv4_mdt_data_segment_routing_mpls_immediate_switch                = each.value.ipv4_mdt_data_segment_routing_mpls_immediate_switch
  ipv4_mdt_default_mldp_p2mp                                         = each.value.ipv4_mdt_default_mldp_p2mp
  ipv4_mdt_default_mldp_p2mp_flex_algo                               = each.value.ipv4_mdt_default_mldp_p2mp_flex_algo
  ipv4_mdt_default_p2mp_te_attribute_set                             = each.value.ipv4_mdt_default_p2mp_te_attribute_set
  ipv4_mdt_default_ingress_replication                               = each.value.ipv4_mdt_default_ingress_replication
  ipv4_mdt_default_ingress_replication_auto_tunnel                   = each.value.ipv4_mdt_default_ingress_replication_auto_tunnel
  ipv4_mdt_default_ingress_replication_auto_tunnel_attribute_set     = each.value.ipv4_mdt_default_ingress_replication_auto_tunnel_attribute_set
  ipv4_mdt_default_segment_routing_mpls_color                        = each.value.ipv4_mdt_default_segment_routing_mpls_color
  ipv4_mdt_default_segment_routing_mpls_fast_reroute_lfa             = each.value.ipv4_mdt_default_segment_routing_mpls_fast_reroute_lfa
  ipv4_mdt_segment_border                                            = each.value.ipv4_mdt_segment_border
  ipv4_mdt_segment_border_route_policy                               = each.value.ipv4_mdt_segment_border_route_policy
  ipv4_mdt_segmented_inband_core_tree                                = each.value.ipv4_mdt_segmented_inband_core_tree
  ipv4_mdt_segmented_inband_color                                    = each.value.ipv4_mdt_segmented_inband_color
  ipv4_mdt_partitioned_p2mp_te_attribute_set                         = each.value.ipv4_mdt_partitioned_p2mp_te_attribute_set
  ipv4_mdt_partitioned_mldp_ipv4_p2mp                                = each.value.ipv4_mdt_partitioned_mldp_ipv4_p2mp
  ipv4_mdt_partitioned_mldp_ipv4_p2mp_bidir                          = each.value.ipv4_mdt_partitioned_mldp_ipv4_p2mp_bidir
  ipv4_mdt_partitioned_mldp_ipv4_flex_algo                           = each.value.ipv4_mdt_partitioned_mldp_ipv4_flex_algo
  ipv4_mdt_partitioned_ingress_replication                           = each.value.ipv4_mdt_partitioned_ingress_replication
  ipv4_mdt_partitioned_ingress_replication_auto_tunnel               = each.value.ipv4_mdt_partitioned_ingress_replication_auto_tunnel
  ipv4_mdt_partitioned_ingress_replication_auto_tunnel_attribute_set = each.value.ipv4_mdt_partitioned_ingress_replication_auto_tunnel_attribute_set
  ipv4_mdt_partitioned_segment_routing_mpls_color                    = each.value.ipv4_mdt_partitioned_segment_routing_mpls_color
  ipv4_mdt_partitioned_segment_routing_mpls_fast_reroute_lfa         = each.value.ipv4_mdt_partitioned_segment_routing_mpls_fast_reroute_lfa
  ipv4_mdt_mldp_in_band_signaling_ipv4                               = each.value.ipv4_mdt_mldp_in_band_signaling_ipv4
  ipv4_mdt_static_segment_routing                                    = each.value.ipv4_mdt_static_segment_routing
  ipv4_mdt_static_segment_routing_strict_rpf                         = each.value.ipv4_mdt_static_segment_routing_strict_rpf
  ipv4_mdt_static_p2mp_te_interfaces                                 = each.value.ipv4_mdt_static_p2mp_te_interfaces
  ipv4_static_sr_policies                                            = each.value.ipv4_static_sr_policies
  ipv4                                                               = each.value.ipv4
  ipv6_ssm_range                                                     = each.value.ipv6_ssm_range
  ipv6_ssm_disable                                                   = each.value.ipv6_ssm_disable
  ipv6_ssm_allow_override                                            = each.value.ipv6_ssm_allow_override
  ipv6_mdt_source                                                    = each.value.ipv6_mdt_source
  ipv6_mdt_mtu                                                       = each.value.ipv6_mdt_mtu
  ipv6_rate_per_route                                                = each.value.ipv6_rate_per_route
  ipv6_multipath                                                     = each.value.ipv6_multipath
  ipv6_multipath_hash_source_nexthop                                 = each.value.ipv6_multipath_hash_source_nexthop
  ipv6_multipath_hash_interface_extended                             = each.value.ipv6_multipath_hash_interface_extended
  ipv6_multipath_hash_source_group                                   = each.value.ipv6_multipath_hash_source_group
  ipv6_accounting_per_prefix                                         = each.value.ipv6_accounting_per_prefix
  ipv6_accounting_per_prefix_forward_only                            = each.value.ipv6_accounting_per_prefix_forward_only
  ipv6_log_traps                                                     = each.value.ipv6_log_traps
  ipv6_interface_inheritance_disable                                 = each.value.ipv6_interface_inheritance_disable
  ipv6_mofrr_lockout_timer                                           = each.value.ipv6_mofrr_lockout_timer
  ipv6_mofrr_loss_detection_timer                                    = each.value.ipv6_mofrr_loss_detection_timer
  ipv6_forwarding_latency_delay                                      = each.value.ipv6_forwarding_latency_delay
  ipv6_export_rt_two_byte_as                                         = each.value.ipv6_export_rt_two_byte_as
  ipv6_export_rt_four_byte_as                                        = each.value.ipv6_export_rt_four_byte_as
  ipv6_export_rt_ip_address                                          = each.value.ipv6_export_rt_ip_address
  ipv6_import_rt_two_byte_as                                         = each.value.ipv6_import_rt_two_byte_as
  ipv6_import_rt_four_byte_as                                        = each.value.ipv6_import_rt_four_byte_as
  ipv6_import_rt_ip_address                                          = each.value.ipv6_import_rt_ip_address
  ipv6_interfaces_all_enable                                         = each.value.ipv6_interfaces_all_enable
  ipv6_interfaces                                                    = each.value.ipv6_interfaces
  ipv6_maximum_disable                                               = each.value.ipv6_maximum_disable
  ipv6_bgp_auto_discovery_core_tree                                  = each.value.ipv6_bgp_auto_discovery_core_tree
  ipv6_bgp_auto_discovery_leaf_info_required                         = each.value.ipv6_bgp_auto_discovery_leaf_info_required
  ipv6_bgp_auto_discovery_dynamic_ssm_translation                    = each.value.ipv6_bgp_auto_discovery_dynamic_ssm_translation
  ipv6_bgp_auto_discovery_inter_as                                   = each.value.ipv6_bgp_auto_discovery_inter_as
  ipv6_bgp_auto_discovery_receiver_site                              = each.value.ipv6_bgp_auto_discovery_receiver_site
  ipv6_bgp_auto_discovery_anycast_rp                                 = each.value.ipv6_bgp_auto_discovery_anycast_rp
  ipv6_bgp_auto_discovery_anycast_rp_route_policy                    = each.value.ipv6_bgp_auto_discovery_anycast_rp_route_policy
  ipv6_bgp_auto_discovery_pmsi_timer_change_delay                    = each.value.ipv6_bgp_auto_discovery_pmsi_timer_change_delay
  ipv6_bgp_auto_discovery_pmsi_timer_stop_forwarding                 = each.value.ipv6_bgp_auto_discovery_pmsi_timer_stop_forwarding
  ipv6_bgp_auto_discovery_segmented                                  = each.value.ipv6_bgp_auto_discovery_segmented
  ipv6_bgp_auto_discovery_segmented_bandwidth_threshold              = each.value.ipv6_bgp_auto_discovery_segmented_bandwidth_threshold
  ipv6_bgp_auto_discovery_segmented_color                            = each.value.ipv6_bgp_auto_discovery_segmented_color
  ipv6_bgp_auto_discovery_inherit_vrf_ri_vrf                         = each.value.ipv6_bgp_auto_discovery_inherit_vrf_ri_vrf
  ipv6_static_rpf_address_ranges                                     = each.value.ipv6_static_rpf_address_ranges
  ipv6_core_tree_protocol_rsvp_te                                    = each.value.ipv6_core_tree_protocol_rsvp_te
  ipv6_core_tree_protocol_rsvp_te_group_list                         = each.value.ipv6_core_tree_protocol_rsvp_te_group_list
  ipv6_mdt_data_ingress_replication                                  = each.value.ipv6_mdt_data_ingress_replication
  ipv6_mdt_data_ingress_replication_auto_tunnel                      = each.value.ipv6_mdt_data_ingress_replication_auto_tunnel
  ipv6_mdt_data_ingress_replication_auto_tunnel_attribute_set        = each.value.ipv6_mdt_data_ingress_replication_auto_tunnel_attribute_set
  ipv6_mdt_data_ingress_replication_number                           = each.value.ipv6_mdt_data_ingress_replication_number
  ipv6_mdt_data_ingress_replication_access_list_name                 = each.value.ipv6_mdt_data_ingress_replication_access_list_name
  ipv6_mdt_data_ingress_replication_immediate_switch                 = each.value.ipv6_mdt_data_ingress_replication_immediate_switch
  ipv6_mdt_data_ingress_replication_route_policy                     = each.value.ipv6_mdt_data_ingress_replication_route_policy
  ipv6_mdt_data_ingress_replication_threshold                        = each.value.ipv6_mdt_data_ingress_replication_threshold
  ipv6_mdt_data_mldp_maximum_number                                  = each.value.ipv6_mdt_data_mldp_maximum_number
  ipv6_mdt_data_mldp_access_list_name                                = each.value.ipv6_mdt_data_mldp_access_list_name
  ipv6_mdt_data_mldp_immediate_switch                                = each.value.ipv6_mdt_data_mldp_immediate_switch
  ipv6_mdt_data_mldp_route_policy                                    = each.value.ipv6_mdt_data_mldp_route_policy
  ipv6_mdt_data_mldp_threshold                                       = each.value.ipv6_mdt_data_mldp_threshold
  ipv6_mdt_data_mldp_flex_algo                                       = each.value.ipv6_mdt_data_mldp_flex_algo
  ipv6_mdt_data_p2mp_te                                              = each.value.ipv6_mdt_data_p2mp_te
  ipv6_mdt_data_p2mp_te_maximum_number                               = each.value.ipv6_mdt_data_p2mp_te_maximum_number
  ipv6_mdt_data_p2mp_te_attribute_set                                = each.value.ipv6_mdt_data_p2mp_te_attribute_set
  ipv6_mdt_data_p2mp_te_access_list_name                             = each.value.ipv6_mdt_data_p2mp_te_access_list_name
  ipv6_mdt_data_p2mp_te_immediate_switch                             = each.value.ipv6_mdt_data_p2mp_te_immediate_switch
  ipv6_mdt_data_p2mp_te_route_policy                                 = each.value.ipv6_mdt_data_p2mp_te_route_policy
  ipv6_mdt_data_p2mp_te_threshold                                    = each.value.ipv6_mdt_data_p2mp_te_threshold
  ipv6_mdt_default_mldp_p2mp                                         = each.value.ipv6_mdt_default_mldp_p2mp
  ipv6_mdt_default_mldp_p2mp_partitioned_bidir                       = each.value.ipv6_mdt_default_mldp_p2mp_partitioned_bidir
  ipv6_mdt_default_mldp_p2mp_flex_algo                               = each.value.ipv6_mdt_default_mldp_p2mp_flex_algo
  ipv6_mdt_default_p2mp_te_attribute_set                             = each.value.ipv6_mdt_default_p2mp_te_attribute_set
  ipv6_mdt_default_ingress_replication                               = each.value.ipv6_mdt_default_ingress_replication
  ipv6_mdt_default_ingress_replication_auto_tunnel                   = each.value.ipv6_mdt_default_ingress_replication_auto_tunnel
  ipv6_mdt_default_ingress_replication_auto_tunnel_attribute_set     = each.value.ipv6_mdt_default_ingress_replication_auto_tunnel_attribute_set
  ipv6_mdt_segment_border                                            = each.value.ipv6_mdt_segment_border
  ipv6_mdt_segment_border_route_policy                               = each.value.ipv6_mdt_segment_border_route_policy
  ipv6_mdt_segmented_inband_core_tree                                = each.value.ipv6_mdt_segmented_inband_core_tree
  ipv6_mdt_segmented_inband_color                                    = each.value.ipv6_mdt_segmented_inband_color
  ipv6_mdt_partitioned_p2mp_te_attribute_set                         = each.value.ipv6_mdt_partitioned_p2mp_te_attribute_set
  ipv6_mdt_partitioned_mldp_ipv4_p2mp                                = each.value.ipv6_mdt_partitioned_mldp_ipv4_p2mp
  ipv6_mdt_partitioned_mldp_ipv4_p2mp_bidir                          = each.value.ipv6_mdt_partitioned_mldp_ipv4_p2mp_bidir
  ipv6_mdt_partitioned_mldp_ipv4_flex_algo                           = each.value.ipv6_mdt_partitioned_mldp_ipv4_flex_algo
  ipv6_mdt_partitioned_ingress_replication                           = each.value.ipv6_mdt_partitioned_ingress_replication
  ipv6_mdt_partitioned_ingress_replication_auto_tunnel               = each.value.ipv6_mdt_partitioned_ingress_replication_auto_tunnel
  ipv6_mdt_partitioned_ingress_replication_auto_tunnel_attribute_set = each.value.ipv6_mdt_partitioned_ingress_replication_auto_tunnel_attribute_set
  ipv6_mdt_mldp_in_band_signaling_ipv4                               = each.value.ipv6_mdt_mldp_in_band_signaling_ipv4
  ipv6_mdt_static_segment_routing                                    = each.value.ipv6_mdt_static_segment_routing
  ipv6_mdt_static_segment_routing_strict_rpf                         = each.value.ipv6_mdt_static_segment_routing_strict_rpf
  ipv6_static_sr_policies                                            = each.value.ipv6_static_sr_policies
  ipv6                                                               = each.value.ipv6

  depends_on = [
    iosxr_route_policy.route_policy
  ]
}

##### Multicast Routing VRF #####

locals {
  multicast_routing_vrfs = flatten([
    for device in local.devices : [
      for vrf in try(local.device_config[device.name].multicast_routing.vrfs, []) : {
        key                                     = format("%s/%s", device.name, vrf.name)
        device_name                             = device.name
        vrf_name                                = try(vrf.name, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.name, null)
        ipv4_ssm_range                          = try(vrf.address_family_ipv4.ssm.range, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.ssm.range, null)
        ipv4_ssm_disable                        = try(vrf.address_family_ipv4.ssm.disable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.ssm.disable, null)
        ipv4_ssm_allow_override                 = try(vrf.address_family_ipv4.ssm.allow_override, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.ssm.allow_override, null)
        ipv4_mdt_source                         = try(vrf.address_family_ipv4.mdt.source, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.source, null)
        ipv4_mdt_mtu                            = try(vrf.address_family_ipv4.mdt.mtu, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.mtu, null)
        ipv4_mdt_default_ipv4_address           = try(vrf.address_family_ipv4.mdt.default.ipv4.address, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.default.ipv4.address, null)
        ipv4_mdt_data_maximum_number            = try(vrf.address_family_ipv4.mdt.data.maximum.number, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.maximum.number, null)
        ipv4_mdt_data_maximum_access_list       = try(vrf.address_family_ipv4.mdt.data.maximum.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.maximum.access_list, null)
        ipv4_mdt_data_maximum_immediate_switch  = try(vrf.address_family_ipv4.mdt.data.maximum.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.maximum.immediate_switch, null)
        ipv4_mdt_data_maximum_route_policy      = try(vrf.address_family_ipv4.mdt.data.maximum.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.maximum.route_policy, null)
        ipv4_mdt_data_maximum_threshold         = try(vrf.address_family_ipv4.mdt.data.maximum.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.maximum.threshold, null)
        ipv4_mdt_data_group_address             = try(vrf.address_family_ipv4.mdt.data.group.address, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.group.address, null)
        ipv4_mdt_data_group_prefix_length       = try(vrf.address_family_ipv4.mdt.data.group.prefix_length, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.group.prefix_length, null)
        ipv4_mdt_data_group_access_list         = try(vrf.address_family_ipv4.mdt.data.group.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.group.access_list, null)
        ipv4_mdt_data_group_immediate_switch    = try(vrf.address_family_ipv4.mdt.data.group.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.group.immediate_switch, null)
        ipv4_mdt_data_group_route_policy        = try(vrf.address_family_ipv4.mdt.data.group.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.group.route_policy, null)
        ipv4_mdt_data_group_threshold           = try(vrf.address_family_ipv4.mdt.data.group.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.group.threshold, null)
        ipv4_rate_per_route                     = try(vrf.address_family_ipv4.rate_per_route, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.rate_per_route, null)
        ipv4_multipath                          = try(vrf.address_family_ipv4.multipath.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.multipath.enable, try(vrf.address_family_ipv4.multipath, null) != null ? true : null)
        ipv4_multipath_hash_source              = try(vrf.address_family_ipv4.multipath.hash, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.multipath.hash, null) == "source" ? true : null
        ipv4_multipath_hash_source_nexthop      = try(vrf.address_family_ipv4.multipath.hash, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.multipath.hash, null) == "source-nexthop" ? true : null
        ipv4_multipath_hash_source_group        = try(vrf.address_family_ipv4.multipath.hash, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.multipath.hash, null) == "source-group" ? true : null
        ipv4_accounting_per_prefix              = try(vrf.address_family_ipv4.accounting_per_prefix, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.accounting_per_prefix, null)
        ipv4_accounting_per_prefix_forward_only = try(vrf.address_family_ipv4.accounting_per_prefix_forward_only, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.accounting_per_prefix_forward_only, null)
        ipv4_log_traps                          = try(vrf.address_family_ipv4.log_traps, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.log_traps, null)
        ipv4_export_rt_two_byte_as = try(length(try(vrf.address_family_ipv4.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.route_target_exports, [])) == 0, true) ? null : [
          for rt in try(vrf.address_family_ipv4.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.route_target_exports, []) : {
            two_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number       = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "two_byte_as"
        ]
        ipv4_export_rt_four_byte_as = try(length(try(vrf.address_family_ipv4.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.route_target_exports, [])) == 0, true) ? null : [
          for rt in try(vrf.address_family_ipv4.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.route_target_exports, []) : {
            four_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number        = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "four_byte_as"
        ]
        ipv4_export_rt_ip_address = try(length(try(vrf.address_family_ipv4.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.route_target_exports, [])) == 0, true) ? null : [
          for rt in try(vrf.address_family_ipv4.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.route_target_exports, []) : {
            ip_address   = provider::utils::normalize_bgp_rt(rt).ipv4_address
            index_number = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "ipv4_address"
        ]
        ipv4_import_rt_two_byte_as = try(length(try(vrf.address_family_ipv4.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.route_target_imports, [])) == 0, true) ? null : [
          for rt in try(vrf.address_family_ipv4.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.route_target_imports, []) : {
            two_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number       = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "two_byte_as"
        ]
        ipv4_import_rt_four_byte_as = try(length(try(vrf.address_family_ipv4.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.route_target_imports, [])) == 0, true) ? null : [
          for rt in try(vrf.address_family_ipv4.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.route_target_imports, []) : {
            four_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number        = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "four_byte_as"
        ]
        ipv4_import_rt_ip_address = try(length(try(vrf.address_family_ipv4.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.route_target_imports, [])) == 0, true) ? null : [
          for rt in try(vrf.address_family_ipv4.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.route_target_imports, []) : {
            ip_address   = provider::utils::normalize_bgp_rt(rt).ipv4_address
            index_number = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "ipv4_address"
        ]
        ipv4_interfaces_all_enable = try(vrf.address_family_ipv4.interfaces_all_enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.interfaces_all_enable, null)
        ipv4_interfaces = try(length(try(vrf.address_family_ipv4.interfaces, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.interfaces, [])) == 0, true) ? null : [
          for item in try(vrf.address_family_ipv4.interfaces, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.interfaces, []) : {
            interface_name = try(item.name, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.interfaces.name, null)
            enable         = try(item.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.interfaces.enable, null)
            disable        = try(item.disable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.interfaces.disable, null)
            boundary       = try(item.boundary, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.interfaces.boundary, null)
            ttl_threshold  = try(item.ttl_threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.interfaces.ttl_threshold, null)
          }
        ]
        ipv4_bgp_auto_discovery_core_tree                     = try(vrf.address_family_ipv4.bgp.auto_discovery.core_tree, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.core_tree, null)
        ipv4_bgp_auto_discovery_leaf_info_required            = try(vrf.address_family_ipv4.bgp.auto_discovery.leaf_info_required, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.leaf_info_required, null)
        ipv4_bgp_auto_discovery_dynamic_ssm_translation       = try(vrf.address_family_ipv4.bgp.auto_discovery.dynamic_ssm_translation, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.dynamic_ssm_translation, null)
        ipv4_bgp_auto_discovery_inter_as                      = try(vrf.address_family_ipv4.bgp.auto_discovery.inter_as, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.inter_as, null)
        ipv4_bgp_auto_discovery_receiver_site                 = try(vrf.address_family_ipv4.bgp.auto_discovery.receiver_site, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.receiver_site, null)
        ipv4_bgp_auto_discovery_anycast_rp                    = try(vrf.address_family_ipv4.bgp.auto_discovery.anycast_rp.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.anycast_rp.enable, try(vrf.address_family_ipv4.bgp.auto_discovery.anycast_rp, null) != null ? true : null)
        ipv4_bgp_auto_discovery_anycast_rp_route_policy       = try(vrf.address_family_ipv4.bgp.auto_discovery.anycast_rp.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.anycast_rp.route_policy, null)
        ipv4_bgp_auto_discovery_pmsi_timer_change_delay       = try(vrf.address_family_ipv4.bgp.auto_discovery.pmsi_timer.change_delay, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.pmsi_timer.change_delay, null)
        ipv4_bgp_auto_discovery_pmsi_timer_stop_forwarding    = try(vrf.address_family_ipv4.bgp.auto_discovery.pmsi_timer.stop_forwarding, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.pmsi_timer.stop_forwarding, null)
        ipv4_bgp_auto_discovery_segmented                     = try(vrf.address_family_ipv4.bgp.auto_discovery.segmented.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.segmented.enable, try(vrf.address_family_ipv4.bgp.auto_discovery.segmented, null) != null ? true : null)
        ipv4_bgp_auto_discovery_segmented_bandwidth_threshold = try(vrf.address_family_ipv4.bgp.auto_discovery.segmented.bandwidth_threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.segmented.bandwidth_threshold, null)
        ipv4_bgp_auto_discovery_segmented_color               = try(vrf.address_family_ipv4.bgp.auto_discovery.segmented.color, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.segmented.color, null)
        ipv4_bgp_auto_discovery_inherit_vrf_ri_vrf            = try(vrf.address_family_ipv4.bgp.auto_discovery.inherit_vrf_ri_vrf, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.bgp.auto_discovery.inherit_vrf_ri_vrf, null)
        ipv4_static_rpf_address_ranges = try(length(try(vrf.address_family_ipv4.static_rpf, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.static_rpf, [])) == 0, true) ? null : [
          for item in try(vrf.address_family_ipv4.static_rpf, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.static_rpf, []) : {
            prefix_address   = try(item.prefix_address, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.static_rpf.prefix_address, null)
            prefix_length    = try(item.prefix_length, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.static_rpf.prefix_length, null)
            interface        = try(item.interface, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.static_rpf.interface, null)
            next_hop_address = try(item.next_hop_address, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.static_rpf.next_hop_address, null)
          }
        ]
        ipv4_core_tree_protocol_rsvp_te                                    = try(vrf.address_family_ipv4.core_tree_protocol.rsvp_te.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.core_tree_protocol.rsvp_te.enable, try(vrf.address_family_ipv4.core_tree_protocol.rsvp_te, null) != null ? true : null)
        ipv4_core_tree_protocol_rsvp_te_group_list                         = try(vrf.address_family_ipv4.core_tree_protocol.rsvp_te.group_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.core_tree_protocol.rsvp_te.group_list, null)
        ipv4_mdt_data_ingress_replication                                  = try(vrf.address_family_ipv4.mdt.data.ingress_replication.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.ingress_replication.enable, try(vrf.address_family_ipv4.mdt.data.ingress_replication, null) != null ? true : null)
        ipv4_mdt_data_ingress_replication_auto_tunnel                      = try(vrf.address_family_ipv4.mdt.data.ingress_replication.auto_tunnel.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.ingress_replication.auto_tunnel.enable, try(vrf.address_family_ipv4.mdt.data.ingress_replication.auto_tunnel, null) != null ? true : null)
        ipv4_mdt_data_ingress_replication_auto_tunnel_attribute_set        = try(vrf.address_family_ipv4.mdt.data.ingress_replication.auto_tunnel.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.ingress_replication.auto_tunnel.attribute_set, null)
        ipv4_mdt_data_ingress_replication_number                           = try(vrf.address_family_ipv4.mdt.data.ingress_replication.number, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.ingress_replication.number, null)
        ipv4_mdt_data_ingress_replication_access_list_name                 = try(vrf.address_family_ipv4.mdt.data.ingress_replication.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.ingress_replication.access_list, null)
        ipv4_mdt_data_ingress_replication_immediate_switch                 = try(vrf.address_family_ipv4.mdt.data.ingress_replication.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.ingress_replication.immediate_switch, null)
        ipv4_mdt_data_ingress_replication_route_policy                     = try(vrf.address_family_ipv4.mdt.data.ingress_replication.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.ingress_replication.route_policy, null)
        ipv4_mdt_data_ingress_replication_threshold                        = try(vrf.address_family_ipv4.mdt.data.ingress_replication.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.ingress_replication.threshold, null)
        ipv4_mdt_data_mldp_maximum_number                                  = try(vrf.address_family_ipv4.mdt.data.mldp.maximum_number, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.mldp.maximum_number, null)
        ipv4_mdt_data_mldp_access_list_name                                = try(vrf.address_family_ipv4.mdt.data.mldp.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.mldp.access_list, null)
        ipv4_mdt_data_mldp_immediate_switch                                = try(vrf.address_family_ipv4.mdt.data.mldp.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.mldp.immediate_switch, null)
        ipv4_mdt_data_mldp_route_policy                                    = try(vrf.address_family_ipv4.mdt.data.mldp.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.mldp.route_policy, null)
        ipv4_mdt_data_mldp_threshold                                       = try(vrf.address_family_ipv4.mdt.data.mldp.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.mldp.threshold, null)
        ipv4_mdt_data_mldp_flex_algo                                       = try(vrf.address_family_ipv4.mdt.data.mldp.flex_algo, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.mldp.flex_algo, null)
        ipv4_mdt_data_p2mp_te                                              = try(vrf.address_family_ipv4.mdt.data.p2mp_te.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.p2mp_te.enable, try(vrf.address_family_ipv4.mdt.data.p2mp_te, null) != null ? true : null)
        ipv4_mdt_data_p2mp_te_maximum_number                               = try(vrf.address_family_ipv4.mdt.data.p2mp_te.maximum_number, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.p2mp_te.maximum_number, null)
        ipv4_mdt_data_p2mp_te_attribute_set                                = try(vrf.address_family_ipv4.mdt.data.p2mp_te.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.p2mp_te.attribute_set, null)
        ipv4_mdt_data_p2mp_te_access_list_name                             = try(vrf.address_family_ipv4.mdt.data.p2mp_te.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.p2mp_te.access_list, null)
        ipv4_mdt_data_p2mp_te_immediate_switch                             = try(vrf.address_family_ipv4.mdt.data.p2mp_te.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.p2mp_te.immediate_switch, null)
        ipv4_mdt_data_p2mp_te_route_policy                                 = try(vrf.address_family_ipv4.mdt.data.p2mp_te.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.p2mp_te.route_policy, null)
        ipv4_mdt_data_p2mp_te_threshold                                    = try(vrf.address_family_ipv4.mdt.data.p2mp_te.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.p2mp_te.threshold, null)
        ipv4_mdt_data_segment_routing_mpls_maximum_number                  = try(vrf.address_family_ipv4.mdt.data.segment_routing.mpls.maximum_number, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.segment_routing.mpls.maximum_number, null)
        ipv4_mdt_data_segment_routing_mpls_color                           = try(vrf.address_family_ipv4.mdt.data.segment_routing.mpls.color, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.segment_routing.mpls.color, null)
        ipv4_mdt_data_segment_routing_mpls_fast_reroute_lfa                = try(vrf.address_family_ipv4.mdt.data.segment_routing.mpls.fast_reroute_lfa, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.segment_routing.mpls.fast_reroute_lfa, null)
        ipv4_mdt_data_segment_routing_mpls_route_policy                    = try(vrf.address_family_ipv4.mdt.data.segment_routing.mpls.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.segment_routing.mpls.route_policy, null)
        ipv4_mdt_data_segment_routing_mpls_threshold                       = try(vrf.address_family_ipv4.mdt.data.segment_routing.mpls.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.segment_routing.mpls.threshold, null)
        ipv4_mdt_data_segment_routing_mpls_access_list_name                = try(vrf.address_family_ipv4.mdt.data.segment_routing.mpls.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.segment_routing.mpls.access_list, null)
        ipv4_mdt_data_segment_routing_mpls_immediate_switch                = try(vrf.address_family_ipv4.mdt.data.segment_routing.mpls.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.data.segment_routing.mpls.immediate_switch, null)
        ipv4_mdt_default_ipv4_partitioned_bidir                            = try(vrf.address_family_ipv4.mdt.default.ipv4.partitioned_bidir, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.default.ipv4.partitioned_bidir, null)
        ipv4_mdt_default_mldp_p2mp                                         = try(vrf.address_family_ipv4.mdt.default.mldp.p2mp.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.default.mldp.p2mp.enable, try(vrf.address_family_ipv4.mdt.default.mldp.p2mp, null) != null ? true : null)
        ipv4_mdt_default_mldp_p2mp_partitioned_bidir                       = try(vrf.address_family_ipv4.mdt.default.mldp.p2mp.partitioned_bidir, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.default.mldp.p2mp.partitioned_bidir, null)
        ipv4_mdt_default_mldp_p2mp_flex_algo                               = try(vrf.address_family_ipv4.mdt.default.mldp.p2mp.flex_algo, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.default.mldp.p2mp.flex_algo, null)
        ipv4_mdt_default_p2mp_te_attribute_set                             = try(vrf.address_family_ipv4.mdt.default.p2mp_te.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.default.p2mp_te.attribute_set, null)
        ipv4_mdt_default_p2mp_te_static                                    = try(vrf.address_family_ipv4.mdt.default.p2mp_te.static, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.default.p2mp_te.static, null)
        ipv4_mdt_default_ingress_replication                               = try(vrf.address_family_ipv4.mdt.default.ingress_replication.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.default.ingress_replication.enable, try(vrf.address_family_ipv4.mdt.default.ingress_replication, null) != null ? true : null)
        ipv4_mdt_default_ingress_replication_auto_tunnel                   = try(vrf.address_family_ipv4.mdt.default.ingress_replication.auto_tunnel.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.default.ingress_replication.auto_tunnel.enable, try(vrf.address_family_ipv4.mdt.default.ingress_replication.auto_tunnel, null) != null ? true : null)
        ipv4_mdt_default_ingress_replication_auto_tunnel_attribute_set     = try(vrf.address_family_ipv4.mdt.default.ingress_replication.auto_tunnel.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.default.ingress_replication.auto_tunnel.attribute_set, null)
        ipv4_mdt_default_segment_routing_mpls_color                        = try(tostring(vrf.address_family_ipv4.mdt.default.segment_routing.mpls.color), tostring(local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.default.segment_routing.mpls.color), null)
        ipv4_mdt_default_segment_routing_mpls_fast_reroute_lfa             = try(vrf.address_family_ipv4.mdt.default.segment_routing.mpls.fast_reroute_lfa, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.default.segment_routing.mpls.fast_reroute_lfa, null)
        ipv4_mdt_partitioned_p2mp_te_attribute_set                         = try(vrf.address_family_ipv4.mdt.partitioned.p2mp_te.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.partitioned.p2mp_te.attribute_set, null)
        ipv4_mdt_partitioned_mldp_ipv4_p2mp                                = try(vrf.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp.enable, try(vrf.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp, null) != null ? true : null)
        ipv4_mdt_partitioned_mldp_ipv4_p2mp_bidir                          = try(vrf.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp.bidir, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp.bidir, null)
        ipv4_mdt_partitioned_mldp_ipv4_flex_algo                           = try(vrf.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp.flex_algo, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.partitioned.mldp.ipv4.p2mp.flex_algo, null)
        ipv4_mdt_partitioned_ingress_replication                           = try(vrf.address_family_ipv4.mdt.partitioned.ingress_replication.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.partitioned.ingress_replication.enable, try(vrf.address_family_ipv4.mdt.partitioned.ingress_replication, null) != null ? true : null)
        ipv4_mdt_partitioned_ingress_replication_auto_tunnel               = try(vrf.address_family_ipv4.mdt.partitioned.ingress_replication.auto_tunnel.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.partitioned.ingress_replication.auto_tunnel.enable, try(vrf.address_family_ipv4.mdt.partitioned.ingress_replication.auto_tunnel, null) != null ? true : null)
        ipv4_mdt_partitioned_ingress_replication_auto_tunnel_attribute_set = try(vrf.address_family_ipv4.mdt.partitioned.ingress_replication.auto_tunnel.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.partitioned.ingress_replication.auto_tunnel.attribute_set, null)
        ipv4_mdt_partitioned_segment_routing_mpls_color                    = try(tostring(vrf.address_family_ipv4.mdt.partitioned.segment_routing.mpls.color), tostring(local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.partitioned.segment_routing.mpls.color), null)
        ipv4_mdt_partitioned_segment_routing_mpls_fast_reroute_lfa         = try(vrf.address_family_ipv4.mdt.partitioned.segment_routing.mpls.fast_reroute_lfa, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.partitioned.segment_routing.mpls.fast_reroute_lfa, null)
        ipv4_mdt_mldp_in_band_signaling_ipv4                               = try(vrf.address_family_ipv4.mdt.mldp.in_band_signaling_ipv4, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.mldp.in_band_signaling_ipv4, null)
        ipv4_mdt_static_segment_routing                                    = try(vrf.address_family_ipv4.mdt.static.segment_routing, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.static.segment_routing, null)
        ipv4_mdt_static_segment_routing_strict_rpf                         = try(vrf.address_family_ipv4.mdt.static.segment_routing_strict_rpf, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.static.segment_routing_strict_rpf, null)
        ipv4_mdt_static_p2mp_te_interfaces = try(length(try(vrf.address_family_ipv4.mdt.static.p2mp_te.interfaces, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.static.p2mp_te.interfaces, [])) == 0, true) ? null : [
          for item in try(vrf.address_family_ipv4.mdt.static.p2mp_te.interfaces, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.static.p2mp_te.interfaces, []) : {
            interface_name = try(item.name, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.mdt.static.p2mp_te.interfaces.name, null)
          }
        ]
        ipv4_static_sr_policies = try(length(try(vrf.address_family_ipv4.static_sr_policies, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.static_sr_policies, [])) == 0, true) ? null : [
          for item in try(vrf.address_family_ipv4.static_sr_policies, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.static_sr_policies, []) : {
            sr_policy_name = try(item.policy_name, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.static_sr_policies.policy_name, null)
            ingress        = try(item.ingress, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.static_sr_policies.ingress, null)
          }
        ]
        ipv4                                    = try(vrf.address_family_ipv4.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv4.enable, try(vrf.address_family_ipv4, null) != null ? true : null)
        ipv6_ssm_range                          = try(vrf.address_family_ipv6.ssm.range, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.ssm.range, null)
        ipv6_ssm_disable                        = try(vrf.address_family_ipv6.ssm.disable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.ssm.disable, null)
        ipv6_ssm_allow_override                 = try(vrf.address_family_ipv6.ssm.allow_override, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.ssm.allow_override, null)
        ipv6_mdt_source                         = try(vrf.address_family_ipv6.mdt.source, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.source, null)
        ipv6_mdt_mtu                            = try(vrf.address_family_ipv6.mdt.mtu, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.mtu, null)
        ipv6_mdt_default_ipv4_address           = try(vrf.address_family_ipv6.mdt.default.ipv4.address, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.default.ipv4.address, null)
        ipv6_mdt_data_maximum_number            = try(vrf.address_family_ipv6.mdt.data.maximum.number, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.maximum.number, null)
        ipv6_mdt_data_maximum_access_list       = try(vrf.address_family_ipv6.mdt.data.maximum.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.maximum.access_list, null)
        ipv6_mdt_data_maximum_immediate_switch  = try(vrf.address_family_ipv6.mdt.data.maximum.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.maximum.immediate_switch, null)
        ipv6_mdt_data_maximum_route_policy      = try(vrf.address_family_ipv6.mdt.data.maximum.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.maximum.route_policy, null)
        ipv6_mdt_data_maximum_threshold         = try(vrf.address_family_ipv6.mdt.data.maximum.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.maximum.threshold, null)
        ipv6_mdt_data_group_address             = try(vrf.address_family_ipv6.mdt.data.group.address, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.group.address, null)
        ipv6_mdt_data_group_prefix_length       = try(vrf.address_family_ipv6.mdt.data.group.prefix_length, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.group.prefix_length, null)
        ipv6_mdt_data_group_access_list         = try(vrf.address_family_ipv6.mdt.data.group.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.group.access_list, null)
        ipv6_mdt_data_group_immediate_switch    = try(vrf.address_family_ipv6.mdt.data.group.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.group.immediate_switch, null)
        ipv6_mdt_data_group_route_policy        = try(vrf.address_family_ipv6.mdt.data.group.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.group.route_policy, null)
        ipv6_mdt_data_group_threshold           = try(vrf.address_family_ipv6.mdt.data.group.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.group.threshold, null)
        ipv6_rate_per_route                     = try(vrf.address_family_ipv6.rate_per_route, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.rate_per_route, null)
        ipv6_multipath                          = try(vrf.address_family_ipv6.multipath.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.multipath.enable, try(vrf.address_family_ipv6.multipath, null) != null ? true : null)
        ipv6_multipath_hash_source_nexthop      = try(vrf.address_family_ipv6.multipath.hash, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.multipath.hash, null) == "source-nexthop" ? true : null
        ipv6_multipath_hash_interface_extended  = try(vrf.address_family_ipv6.multipath.hash, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.multipath.hash, null) == "interface-extended" ? true : null
        ipv6_multipath_hash_source_group        = try(vrf.address_family_ipv6.multipath.hash, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.multipath.hash, null) == "source-group" ? true : null
        ipv6_accounting_per_prefix              = try(vrf.address_family_ipv6.accounting_per_prefix, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.accounting_per_prefix, null)
        ipv6_accounting_per_prefix_forward_only = try(vrf.address_family_ipv6.accounting_per_prefix_forward_only, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.accounting_per_prefix_forward_only, null)
        ipv6_log_traps                          = try(vrf.address_family_ipv6.log_traps, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.log_traps, null)
        ipv6_export_rt_two_byte_as = try(length(try(vrf.address_family_ipv6.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.route_target_exports, [])) == 0, true) ? null : [
          for rt in try(vrf.address_family_ipv6.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.route_target_exports, []) : {
            two_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number       = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "two_byte_as"
        ]
        ipv6_export_rt_four_byte_as = try(length(try(vrf.address_family_ipv6.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.route_target_exports, [])) == 0, true) ? null : [
          for rt in try(vrf.address_family_ipv6.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.route_target_exports, []) : {
            four_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number        = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "four_byte_as"
        ]
        ipv6_export_rt_ip_address = try(length(try(vrf.address_family_ipv6.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.route_target_exports, [])) == 0, true) ? null : [
          for rt in try(vrf.address_family_ipv6.route_target_exports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.route_target_exports, []) : {
            ip_address   = provider::utils::normalize_bgp_rt(rt).ipv4_address
            index_number = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "ipv4_address"
        ]
        ipv6_import_rt_two_byte_as = try(length(try(vrf.address_family_ipv6.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.route_target_imports, [])) == 0, true) ? null : [
          for rt in try(vrf.address_family_ipv6.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.route_target_imports, []) : {
            two_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number       = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "two_byte_as"
        ]
        ipv6_import_rt_four_byte_as = try(length(try(vrf.address_family_ipv6.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.route_target_imports, [])) == 0, true) ? null : [
          for rt in try(vrf.address_family_ipv6.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.route_target_imports, []) : {
            four_byte_as_number = provider::utils::normalize_bgp_rt(rt).as_number
            index_number        = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "four_byte_as"
        ]
        ipv6_import_rt_ip_address = try(length(try(vrf.address_family_ipv6.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.route_target_imports, [])) == 0, true) ? null : [
          for rt in try(vrf.address_family_ipv6.route_target_imports, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.route_target_imports, []) : {
            ip_address   = provider::utils::normalize_bgp_rt(rt).ipv4_address
            index_number = provider::utils::normalize_bgp_rt(rt).assigned_number
          } if provider::utils::normalize_bgp_rt(rt).format == "ipv4_address"
        ]
        ipv6_interfaces_all_enable = try(vrf.address_family_ipv6.interfaces_all_enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.interfaces_all_enable, null)
        ipv6_interfaces = try(length(try(vrf.address_family_ipv6.interfaces, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.interfaces, [])) == 0, true) ? null : [
          for item in try(vrf.address_family_ipv6.interfaces, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.interfaces, []) : {
            interface_name = try(item.name, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.interfaces.name, null)
            enable         = try(item.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.interfaces.enable, null)
            disable        = try(item.disable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.interfaces.disable, null)
            boundary       = try(item.boundary, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.interfaces.boundary, null)
            ttl_threshold  = try(item.ttl_threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.interfaces.ttl_threshold, null)
          }
        ]
        ipv6_bgp_auto_discovery_core_tree                     = try(vrf.address_family_ipv6.bgp.auto_discovery.core_tree, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.core_tree, null)
        ipv6_bgp_auto_discovery_leaf_info_required            = try(vrf.address_family_ipv6.bgp.auto_discovery.leaf_info_required, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.leaf_info_required, null)
        ipv6_bgp_auto_discovery_dynamic_ssm_translation       = try(vrf.address_family_ipv6.bgp.auto_discovery.dynamic_ssm_translation, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.dynamic_ssm_translation, null)
        ipv6_bgp_auto_discovery_inter_as                      = try(vrf.address_family_ipv6.bgp.auto_discovery.inter_as, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.inter_as, null)
        ipv6_bgp_auto_discovery_receiver_site                 = try(vrf.address_family_ipv6.bgp.auto_discovery.receiver_site, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.receiver_site, null)
        ipv6_bgp_auto_discovery_anycast_rp                    = try(vrf.address_family_ipv6.bgp.auto_discovery.anycast_rp.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.anycast_rp.enable, try(vrf.address_family_ipv6.bgp.auto_discovery.anycast_rp, null) != null ? true : null)
        ipv6_bgp_auto_discovery_anycast_rp_route_policy       = try(vrf.address_family_ipv6.bgp.auto_discovery.anycast_rp.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.anycast_rp.route_policy, null)
        ipv6_bgp_auto_discovery_pmsi_timer_change_delay       = try(vrf.address_family_ipv6.bgp.auto_discovery.pmsi_timer.change_delay, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.pmsi_timer.change_delay, null)
        ipv6_bgp_auto_discovery_pmsi_timer_stop_forwarding    = try(vrf.address_family_ipv6.bgp.auto_discovery.pmsi_timer.stop_forwarding, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.pmsi_timer.stop_forwarding, null)
        ipv6_bgp_auto_discovery_segmented                     = try(vrf.address_family_ipv6.bgp.auto_discovery.segmented.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.segmented.enable, try(vrf.address_family_ipv6.bgp.auto_discovery.segmented, null) != null ? true : null)
        ipv6_bgp_auto_discovery_segmented_bandwidth_threshold = try(vrf.address_family_ipv6.bgp.auto_discovery.segmented.bandwidth_threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.segmented.bandwidth_threshold, null)
        ipv6_bgp_auto_discovery_segmented_color               = try(vrf.address_family_ipv6.bgp.auto_discovery.segmented.color, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.segmented.color, null)
        ipv6_bgp_auto_discovery_inherit_vrf_ri_vrf            = try(vrf.address_family_ipv6.bgp.auto_discovery.inherit_vrf_ri_vrf, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.bgp.auto_discovery.inherit_vrf_ri_vrf, null)
        ipv6_static_rpf_address_ranges = try(length(try(vrf.address_family_ipv6.static_rpf, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.static_rpf, [])) == 0, true) ? null : [
          for item in try(vrf.address_family_ipv6.static_rpf, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.static_rpf, []) : {
            prefix_address   = try(item.prefix_address, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.static_rpf.prefix_address, null)
            prefix_length    = try(item.prefix_length, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.static_rpf.prefix_length, null)
            interface        = try(item.interface, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.static_rpf.interface, null)
            next_hop_address = try(item.next_hop_address, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.static_rpf.next_hop_address, null)
          }
        ]
        ipv6_core_tree_protocol_rsvp_te                                    = try(vrf.address_family_ipv6.core_tree_protocol.rsvp_te.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.core_tree_protocol.rsvp_te.enable, try(vrf.address_family_ipv6.core_tree_protocol.rsvp_te, null) != null ? true : null)
        ipv6_core_tree_protocol_rsvp_te_group_list                         = try(vrf.address_family_ipv6.core_tree_protocol.rsvp_te.group_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.core_tree_protocol.rsvp_te.group_list, null)
        ipv6_mdt_data_ingress_replication                                  = try(vrf.address_family_ipv6.mdt.data.ingress_replication.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.ingress_replication.enable, try(vrf.address_family_ipv6.mdt.data.ingress_replication, null) != null ? true : null)
        ipv6_mdt_data_ingress_replication_auto_tunnel                      = try(vrf.address_family_ipv6.mdt.data.ingress_replication.auto_tunnel.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.ingress_replication.auto_tunnel.enable, try(vrf.address_family_ipv6.mdt.data.ingress_replication.auto_tunnel, null) != null ? true : null)
        ipv6_mdt_data_ingress_replication_auto_tunnel_attribute_set        = try(vrf.address_family_ipv6.mdt.data.ingress_replication.auto_tunnel.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.ingress_replication.auto_tunnel.attribute_set, null)
        ipv6_mdt_data_ingress_replication_number                           = try(vrf.address_family_ipv6.mdt.data.ingress_replication.number, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.ingress_replication.number, null)
        ipv6_mdt_data_ingress_replication_access_list_name                 = try(vrf.address_family_ipv6.mdt.data.ingress_replication.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.ingress_replication.access_list, null)
        ipv6_mdt_data_ingress_replication_immediate_switch                 = try(vrf.address_family_ipv6.mdt.data.ingress_replication.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.ingress_replication.immediate_switch, null)
        ipv6_mdt_data_ingress_replication_route_policy                     = try(vrf.address_family_ipv6.mdt.data.ingress_replication.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.ingress_replication.route_policy, null)
        ipv6_mdt_data_ingress_replication_threshold                        = try(vrf.address_family_ipv6.mdt.data.ingress_replication.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.ingress_replication.threshold, null)
        ipv6_mdt_data_mldp_maximum_number                                  = try(vrf.address_family_ipv6.mdt.data.mldp.maximum_number, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.mldp.maximum_number, null)
        ipv6_mdt_data_mldp_access_list_name                                = try(vrf.address_family_ipv6.mdt.data.mldp.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.mldp.access_list, null)
        ipv6_mdt_data_mldp_immediate_switch                                = try(vrf.address_family_ipv6.mdt.data.mldp.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.mldp.immediate_switch, null)
        ipv6_mdt_data_mldp_route_policy                                    = try(vrf.address_family_ipv6.mdt.data.mldp.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.mldp.route_policy, null)
        ipv6_mdt_data_mldp_threshold                                       = try(vrf.address_family_ipv6.mdt.data.mldp.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.mldp.threshold, null)
        ipv6_mdt_data_mldp_flex_algo                                       = try(vrf.address_family_ipv6.mdt.data.mldp.flex_algo, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.mldp.flex_algo, null)
        ipv6_mdt_data_p2mp_te                                              = try(vrf.address_family_ipv6.mdt.data.p2mp_te.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.p2mp_te.enable, try(vrf.address_family_ipv6.mdt.data.p2mp_te, null) != null ? true : null)
        ipv6_mdt_data_p2mp_te_maximum_number                               = try(vrf.address_family_ipv6.mdt.data.p2mp_te.maximum_number, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.p2mp_te.maximum_number, null)
        ipv6_mdt_data_p2mp_te_attribute_set                                = try(vrf.address_family_ipv6.mdt.data.p2mp_te.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.p2mp_te.attribute_set, null)
        ipv6_mdt_data_p2mp_te_access_list_name                             = try(vrf.address_family_ipv6.mdt.data.p2mp_te.access_list, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.p2mp_te.access_list, null)
        ipv6_mdt_data_p2mp_te_immediate_switch                             = try(vrf.address_family_ipv6.mdt.data.p2mp_te.immediate_switch, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.p2mp_te.immediate_switch, null)
        ipv6_mdt_data_p2mp_te_route_policy                                 = try(vrf.address_family_ipv6.mdt.data.p2mp_te.route_policy, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.p2mp_te.route_policy, null)
        ipv6_mdt_data_p2mp_te_threshold                                    = try(vrf.address_family_ipv6.mdt.data.p2mp_te.threshold, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.data.p2mp_te.threshold, null)
        ipv6_mdt_default_ipv4_partitioned_bidir                            = try(vrf.address_family_ipv6.mdt.default.ipv4.partitioned_bidir, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.default.ipv4.partitioned_bidir, null)
        ipv6_mdt_default_mldp_p2mp                                         = try(vrf.address_family_ipv6.mdt.default.mldp.p2mp.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.default.mldp.p2mp.enable, try(vrf.address_family_ipv6.mdt.default.mldp.p2mp, null) != null ? true : null)
        ipv6_mdt_default_mldp_p2mp_partitioned_bidir                       = try(vrf.address_family_ipv6.mdt.default.mldp.p2mp.partitioned_bidir, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.default.mldp.p2mp.partitioned_bidir, null)
        ipv6_mdt_default_mldp_p2mp_flex_algo                               = try(vrf.address_family_ipv6.mdt.default.mldp.p2mp.flex_algo, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.default.mldp.p2mp.flex_algo, null)
        ipv6_mdt_default_p2mp_te_attribute_set                             = try(vrf.address_family_ipv6.mdt.default.p2mp_te.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.default.p2mp_te.attribute_set, null)
        ipv6_mdt_default_p2mp_te_static                                    = try(vrf.address_family_ipv6.mdt.default.p2mp_te.static, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.default.p2mp_te.static, null)
        ipv6_mdt_default_ingress_replication                               = try(vrf.address_family_ipv6.mdt.default.ingress_replication.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.default.ingress_replication.enable, try(vrf.address_family_ipv6.mdt.default.ingress_replication, null) != null ? true : null)
        ipv6_mdt_default_ingress_replication_auto_tunnel                   = try(vrf.address_family_ipv6.mdt.default.ingress_replication.auto_tunnel.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.default.ingress_replication.auto_tunnel.enable, try(vrf.address_family_ipv6.mdt.default.ingress_replication.auto_tunnel, null) != null ? true : null)
        ipv6_mdt_default_ingress_replication_auto_tunnel_attribute_set     = try(vrf.address_family_ipv6.mdt.default.ingress_replication.auto_tunnel.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.default.ingress_replication.auto_tunnel.attribute_set, null)
        ipv6_mdt_partitioned_p2mp_te_attribute_set                         = try(vrf.address_family_ipv6.mdt.partitioned.p2mp_te.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.partitioned.p2mp_te.attribute_set, null)
        ipv6_mdt_partitioned_mldp_ipv4_p2mp                                = try(vrf.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp.enable, try(vrf.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp, null) != null ? true : null)
        ipv6_mdt_partitioned_mldp_ipv4_p2mp_bidir                          = try(vrf.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp.bidir, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp.bidir, null)
        ipv6_mdt_partitioned_mldp_ipv4_flex_algo                           = try(vrf.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp.flex_algo, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.partitioned.mldp.ipv4.p2mp.flex_algo, null)
        ipv6_mdt_partitioned_ingress_replication                           = try(vrf.address_family_ipv6.mdt.partitioned.ingress_replication.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.partitioned.ingress_replication.enable, try(vrf.address_family_ipv6.mdt.partitioned.ingress_replication, null) != null ? true : null)
        ipv6_mdt_partitioned_ingress_replication_auto_tunnel               = try(vrf.address_family_ipv6.mdt.partitioned.ingress_replication.auto_tunnel.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.partitioned.ingress_replication.auto_tunnel.enable, try(vrf.address_family_ipv6.mdt.partitioned.ingress_replication.auto_tunnel, null) != null ? true : null)
        ipv6_mdt_partitioned_ingress_replication_auto_tunnel_attribute_set = try(vrf.address_family_ipv6.mdt.partitioned.ingress_replication.auto_tunnel.attribute_set, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.partitioned.ingress_replication.auto_tunnel.attribute_set, null)
        ipv6_mdt_mldp_in_band_signaling_ipv4                               = try(vrf.address_family_ipv6.mdt.mldp.in_band_signaling_ipv4, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.mldp.in_band_signaling_ipv4, null)
        ipv6_mdt_static_segment_routing                                    = try(vrf.address_family_ipv6.mdt.static.segment_routing, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.static.segment_routing, null)
        ipv6_mdt_static_segment_routing_strict_rpf                         = try(vrf.address_family_ipv6.mdt.static.segment_routing_strict_rpf, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.mdt.static.segment_routing_strict_rpf, null)
        ipv6_static_sr_policies = try(length(try(vrf.address_family_ipv6.static_sr_policies, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.static_sr_policies, [])) == 0, true) ? null : [
          for item in try(vrf.address_family_ipv6.static_sr_policies, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.static_sr_policies, []) : {
            sr_policy_name = try(item.policy_name, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.static_sr_policies.policy_name, null)
            ingress        = try(item.ingress, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.static_sr_policies.ingress, null)
          }
        ]
        ipv6 = try(vrf.address_family_ipv6.enable, local.defaults.iosxr.devices.configuration.multicast_routing.vrfs.address_family_ipv6.enable, try(vrf.address_family_ipv6, null) != null ? true : null)
      }
    ]
  ])
}

resource "iosxr_multicast_routing_vrf" "multicast_routing_vrf" {
  for_each                                                           = { for item in local.multicast_routing_vrfs : item.key => item }
  device                                                             = each.value.device_name
  vrf_name                                                           = each.value.vrf_name
  ipv4_ssm_range                                                     = each.value.ipv4_ssm_range
  ipv4_ssm_disable                                                   = each.value.ipv4_ssm_disable
  ipv4_ssm_allow_override                                            = each.value.ipv4_ssm_allow_override
  ipv4_mdt_source                                                    = each.value.ipv4_mdt_source
  ipv4_mdt_mtu                                                       = each.value.ipv4_mdt_mtu
  ipv4_mdt_default_ipv4_address                                      = each.value.ipv4_mdt_default_ipv4_address
  ipv4_mdt_data_maximum_number                                       = each.value.ipv4_mdt_data_maximum_number
  ipv4_mdt_data_maximum_access_list                                  = each.value.ipv4_mdt_data_maximum_access_list
  ipv4_mdt_data_maximum_immediate_switch                             = each.value.ipv4_mdt_data_maximum_immediate_switch
  ipv4_mdt_data_maximum_route_policy                                 = each.value.ipv4_mdt_data_maximum_route_policy
  ipv4_mdt_data_maximum_threshold                                    = each.value.ipv4_mdt_data_maximum_threshold
  ipv4_mdt_data_group_address                                        = each.value.ipv4_mdt_data_group_address
  ipv4_mdt_data_group_prefix_length                                  = each.value.ipv4_mdt_data_group_prefix_length
  ipv4_mdt_data_group_access_list                                    = each.value.ipv4_mdt_data_group_access_list
  ipv4_mdt_data_group_immediate_switch                               = each.value.ipv4_mdt_data_group_immediate_switch
  ipv4_mdt_data_group_route_policy                                   = each.value.ipv4_mdt_data_group_route_policy
  ipv4_mdt_data_group_threshold                                      = each.value.ipv4_mdt_data_group_threshold
  ipv4_rate_per_route                                                = each.value.ipv4_rate_per_route
  ipv4_multipath                                                     = each.value.ipv4_multipath
  ipv4_multipath_hash_source                                         = each.value.ipv4_multipath_hash_source
  ipv4_multipath_hash_source_nexthop                                 = each.value.ipv4_multipath_hash_source_nexthop
  ipv4_multipath_hash_source_group                                   = each.value.ipv4_multipath_hash_source_group
  ipv4_accounting_per_prefix                                         = each.value.ipv4_accounting_per_prefix
  ipv4_accounting_per_prefix_forward_only                            = each.value.ipv4_accounting_per_prefix_forward_only
  ipv4_log_traps                                                     = each.value.ipv4_log_traps
  ipv4_export_rt_two_byte_as                                         = each.value.ipv4_export_rt_two_byte_as
  ipv4_export_rt_four_byte_as                                        = each.value.ipv4_export_rt_four_byte_as
  ipv4_export_rt_ip_address                                          = each.value.ipv4_export_rt_ip_address
  ipv4_import_rt_two_byte_as                                         = each.value.ipv4_import_rt_two_byte_as
  ipv4_import_rt_four_byte_as                                        = each.value.ipv4_import_rt_four_byte_as
  ipv4_import_rt_ip_address                                          = each.value.ipv4_import_rt_ip_address
  ipv4_interfaces_all_enable                                         = each.value.ipv4_interfaces_all_enable
  ipv4_interfaces                                                    = each.value.ipv4_interfaces
  ipv4_bgp_auto_discovery_core_tree                                  = each.value.ipv4_bgp_auto_discovery_core_tree
  ipv4_bgp_auto_discovery_leaf_info_required                         = each.value.ipv4_bgp_auto_discovery_leaf_info_required
  ipv4_bgp_auto_discovery_dynamic_ssm_translation                    = each.value.ipv4_bgp_auto_discovery_dynamic_ssm_translation
  ipv4_bgp_auto_discovery_inter_as                                   = each.value.ipv4_bgp_auto_discovery_inter_as
  ipv4_bgp_auto_discovery_receiver_site                              = each.value.ipv4_bgp_auto_discovery_receiver_site
  ipv4_bgp_auto_discovery_anycast_rp                                 = each.value.ipv4_bgp_auto_discovery_anycast_rp
  ipv4_bgp_auto_discovery_anycast_rp_route_policy                    = each.value.ipv4_bgp_auto_discovery_anycast_rp_route_policy
  ipv4_bgp_auto_discovery_pmsi_timer_change_delay                    = each.value.ipv4_bgp_auto_discovery_pmsi_timer_change_delay
  ipv4_bgp_auto_discovery_pmsi_timer_stop_forwarding                 = each.value.ipv4_bgp_auto_discovery_pmsi_timer_stop_forwarding
  ipv4_bgp_auto_discovery_segmented                                  = each.value.ipv4_bgp_auto_discovery_segmented
  ipv4_bgp_auto_discovery_segmented_bandwidth_threshold              = each.value.ipv4_bgp_auto_discovery_segmented_bandwidth_threshold
  ipv4_bgp_auto_discovery_segmented_color                            = each.value.ipv4_bgp_auto_discovery_segmented_color
  ipv4_bgp_auto_discovery_inherit_vrf_ri_vrf                         = each.value.ipv4_bgp_auto_discovery_inherit_vrf_ri_vrf
  ipv4_static_rpf_address_ranges                                     = each.value.ipv4_static_rpf_address_ranges
  ipv4_core_tree_protocol_rsvp_te                                    = each.value.ipv4_core_tree_protocol_rsvp_te
  ipv4_core_tree_protocol_rsvp_te_group_list                         = each.value.ipv4_core_tree_protocol_rsvp_te_group_list
  ipv4_mdt_data_ingress_replication                                  = each.value.ipv4_mdt_data_ingress_replication
  ipv4_mdt_data_ingress_replication_auto_tunnel                      = each.value.ipv4_mdt_data_ingress_replication_auto_tunnel
  ipv4_mdt_data_ingress_replication_auto_tunnel_attribute_set        = each.value.ipv4_mdt_data_ingress_replication_auto_tunnel_attribute_set
  ipv4_mdt_data_ingress_replication_number                           = each.value.ipv4_mdt_data_ingress_replication_number
  ipv4_mdt_data_ingress_replication_access_list_name                 = each.value.ipv4_mdt_data_ingress_replication_access_list_name
  ipv4_mdt_data_ingress_replication_immediate_switch                 = each.value.ipv4_mdt_data_ingress_replication_immediate_switch
  ipv4_mdt_data_ingress_replication_route_policy                     = each.value.ipv4_mdt_data_ingress_replication_route_policy
  ipv4_mdt_data_ingress_replication_threshold                        = each.value.ipv4_mdt_data_ingress_replication_threshold
  ipv4_mdt_data_mldp_maximum_number                                  = each.value.ipv4_mdt_data_mldp_maximum_number
  ipv4_mdt_data_mldp_access_list_name                                = each.value.ipv4_mdt_data_mldp_access_list_name
  ipv4_mdt_data_mldp_immediate_switch                                = each.value.ipv4_mdt_data_mldp_immediate_switch
  ipv4_mdt_data_mldp_route_policy                                    = each.value.ipv4_mdt_data_mldp_route_policy
  ipv4_mdt_data_mldp_threshold                                       = each.value.ipv4_mdt_data_mldp_threshold
  ipv4_mdt_data_mldp_flex_algo                                       = each.value.ipv4_mdt_data_mldp_flex_algo
  ipv4_mdt_data_p2mp_te                                              = each.value.ipv4_mdt_data_p2mp_te
  ipv4_mdt_data_p2mp_te_maximum_number                               = each.value.ipv4_mdt_data_p2mp_te_maximum_number
  ipv4_mdt_data_p2mp_te_attribute_set                                = each.value.ipv4_mdt_data_p2mp_te_attribute_set
  ipv4_mdt_data_p2mp_te_access_list_name                             = each.value.ipv4_mdt_data_p2mp_te_access_list_name
  ipv4_mdt_data_p2mp_te_immediate_switch                             = each.value.ipv4_mdt_data_p2mp_te_immediate_switch
  ipv4_mdt_data_p2mp_te_route_policy                                 = each.value.ipv4_mdt_data_p2mp_te_route_policy
  ipv4_mdt_data_p2mp_te_threshold                                    = each.value.ipv4_mdt_data_p2mp_te_threshold
  ipv4_mdt_data_segment_routing_mpls_maximum_number                  = each.value.ipv4_mdt_data_segment_routing_mpls_maximum_number
  ipv4_mdt_data_segment_routing_mpls_color                           = each.value.ipv4_mdt_data_segment_routing_mpls_color
  ipv4_mdt_data_segment_routing_mpls_fast_reroute_lfa                = each.value.ipv4_mdt_data_segment_routing_mpls_fast_reroute_lfa
  ipv4_mdt_data_segment_routing_mpls_route_policy                    = each.value.ipv4_mdt_data_segment_routing_mpls_route_policy
  ipv4_mdt_data_segment_routing_mpls_threshold                       = each.value.ipv4_mdt_data_segment_routing_mpls_threshold
  ipv4_mdt_data_segment_routing_mpls_access_list_name                = each.value.ipv4_mdt_data_segment_routing_mpls_access_list_name
  ipv4_mdt_data_segment_routing_mpls_immediate_switch                = each.value.ipv4_mdt_data_segment_routing_mpls_immediate_switch
  ipv4_mdt_default_ipv4_partitioned_bidir                            = each.value.ipv4_mdt_default_ipv4_partitioned_bidir
  ipv4_mdt_default_mldp_p2mp                                         = each.value.ipv4_mdt_default_mldp_p2mp
  ipv4_mdt_default_mldp_p2mp_partitioned_bidir                       = each.value.ipv4_mdt_default_mldp_p2mp_partitioned_bidir
  ipv4_mdt_default_mldp_p2mp_flex_algo                               = each.value.ipv4_mdt_default_mldp_p2mp_flex_algo
  ipv4_mdt_default_p2mp_te_attribute_set                             = each.value.ipv4_mdt_default_p2mp_te_attribute_set
  ipv4_mdt_default_p2mp_te_static                                    = each.value.ipv4_mdt_default_p2mp_te_static
  ipv4_mdt_default_ingress_replication                               = each.value.ipv4_mdt_default_ingress_replication
  ipv4_mdt_default_ingress_replication_auto_tunnel                   = each.value.ipv4_mdt_default_ingress_replication_auto_tunnel
  ipv4_mdt_default_ingress_replication_auto_tunnel_attribute_set     = each.value.ipv4_mdt_default_ingress_replication_auto_tunnel_attribute_set
  ipv4_mdt_default_segment_routing_mpls_color                        = each.value.ipv4_mdt_default_segment_routing_mpls_color
  ipv4_mdt_default_segment_routing_mpls_fast_reroute_lfa             = each.value.ipv4_mdt_default_segment_routing_mpls_fast_reroute_lfa
  ipv4_mdt_partitioned_p2mp_te_attribute_set                         = each.value.ipv4_mdt_partitioned_p2mp_te_attribute_set
  ipv4_mdt_partitioned_mldp_ipv4_p2mp                                = each.value.ipv4_mdt_partitioned_mldp_ipv4_p2mp
  ipv4_mdt_partitioned_mldp_ipv4_p2mp_bidir                          = each.value.ipv4_mdt_partitioned_mldp_ipv4_p2mp_bidir
  ipv4_mdt_partitioned_mldp_ipv4_flex_algo                           = each.value.ipv4_mdt_partitioned_mldp_ipv4_flex_algo
  ipv4_mdt_partitioned_ingress_replication                           = each.value.ipv4_mdt_partitioned_ingress_replication
  ipv4_mdt_partitioned_ingress_replication_auto_tunnel               = each.value.ipv4_mdt_partitioned_ingress_replication_auto_tunnel
  ipv4_mdt_partitioned_ingress_replication_auto_tunnel_attribute_set = each.value.ipv4_mdt_partitioned_ingress_replication_auto_tunnel_attribute_set
  ipv4_mdt_partitioned_segment_routing_mpls_color                    = each.value.ipv4_mdt_partitioned_segment_routing_mpls_color
  ipv4_mdt_partitioned_segment_routing_mpls_fast_reroute_lfa         = each.value.ipv4_mdt_partitioned_segment_routing_mpls_fast_reroute_lfa
  ipv4_mdt_mldp_in_band_signaling_ipv4                               = each.value.ipv4_mdt_mldp_in_band_signaling_ipv4
  ipv4_mdt_static_segment_routing                                    = each.value.ipv4_mdt_static_segment_routing
  ipv4_mdt_static_segment_routing_strict_rpf                         = each.value.ipv4_mdt_static_segment_routing_strict_rpf
  ipv4_mdt_static_p2mp_te_interfaces                                 = each.value.ipv4_mdt_static_p2mp_te_interfaces
  ipv4_static_sr_policies                                            = each.value.ipv4_static_sr_policies
  ipv4                                                               = each.value.ipv4
  ipv6_ssm_range                                                     = each.value.ipv6_ssm_range
  ipv6_ssm_disable                                                   = each.value.ipv6_ssm_disable
  ipv6_ssm_allow_override                                            = each.value.ipv6_ssm_allow_override
  ipv6_mdt_source                                                    = each.value.ipv6_mdt_source
  ipv6_mdt_mtu                                                       = each.value.ipv6_mdt_mtu
  ipv6_mdt_default_ipv4_address                                      = each.value.ipv6_mdt_default_ipv4_address
  ipv6_mdt_data_maximum_number                                       = each.value.ipv6_mdt_data_maximum_number
  ipv6_mdt_data_maximum_access_list                                  = each.value.ipv6_mdt_data_maximum_access_list
  ipv6_mdt_data_maximum_immediate_switch                             = each.value.ipv6_mdt_data_maximum_immediate_switch
  ipv6_mdt_data_maximum_route_policy                                 = each.value.ipv6_mdt_data_maximum_route_policy
  ipv6_mdt_data_maximum_threshold                                    = each.value.ipv6_mdt_data_maximum_threshold
  ipv6_mdt_data_group_address                                        = each.value.ipv6_mdt_data_group_address
  ipv6_mdt_data_group_prefix_length                                  = each.value.ipv6_mdt_data_group_prefix_length
  ipv6_mdt_data_group_access_list                                    = each.value.ipv6_mdt_data_group_access_list
  ipv6_mdt_data_group_immediate_switch                               = each.value.ipv6_mdt_data_group_immediate_switch
  ipv6_mdt_data_group_route_policy                                   = each.value.ipv6_mdt_data_group_route_policy
  ipv6_mdt_data_group_threshold                                      = each.value.ipv6_mdt_data_group_threshold
  ipv6_rate_per_route                                                = each.value.ipv6_rate_per_route
  ipv6_multipath                                                     = each.value.ipv6_multipath
  ipv6_multipath_hash_source_nexthop                                 = each.value.ipv6_multipath_hash_source_nexthop
  ipv6_multipath_hash_interface_extended                             = each.value.ipv6_multipath_hash_interface_extended
  ipv6_multipath_hash_source_group                                   = each.value.ipv6_multipath_hash_source_group
  ipv6_accounting_per_prefix                                         = each.value.ipv6_accounting_per_prefix
  ipv6_accounting_per_prefix_forward_only                            = each.value.ipv6_accounting_per_prefix_forward_only
  ipv6_log_traps                                                     = each.value.ipv6_log_traps
  ipv6_export_rt_two_byte_as                                         = each.value.ipv6_export_rt_two_byte_as
  ipv6_export_rt_four_byte_as                                        = each.value.ipv6_export_rt_four_byte_as
  ipv6_export_rt_ip_address                                          = each.value.ipv6_export_rt_ip_address
  ipv6_import_rt_two_byte_as                                         = each.value.ipv6_import_rt_two_byte_as
  ipv6_import_rt_four_byte_as                                        = each.value.ipv6_import_rt_four_byte_as
  ipv6_import_rt_ip_address                                          = each.value.ipv6_import_rt_ip_address
  ipv6_interfaces_all_enable                                         = each.value.ipv6_interfaces_all_enable
  ipv6_interfaces                                                    = each.value.ipv6_interfaces
  ipv6_bgp_auto_discovery_core_tree                                  = each.value.ipv6_bgp_auto_discovery_core_tree
  ipv6_bgp_auto_discovery_leaf_info_required                         = each.value.ipv6_bgp_auto_discovery_leaf_info_required
  ipv6_bgp_auto_discovery_dynamic_ssm_translation                    = each.value.ipv6_bgp_auto_discovery_dynamic_ssm_translation
  ipv6_bgp_auto_discovery_inter_as                                   = each.value.ipv6_bgp_auto_discovery_inter_as
  ipv6_bgp_auto_discovery_receiver_site                              = each.value.ipv6_bgp_auto_discovery_receiver_site
  ipv6_bgp_auto_discovery_anycast_rp                                 = each.value.ipv6_bgp_auto_discovery_anycast_rp
  ipv6_bgp_auto_discovery_anycast_rp_route_policy                    = each.value.ipv6_bgp_auto_discovery_anycast_rp_route_policy
  ipv6_bgp_auto_discovery_pmsi_timer_change_delay                    = each.value.ipv6_bgp_auto_discovery_pmsi_timer_change_delay
  ipv6_bgp_auto_discovery_pmsi_timer_stop_forwarding                 = each.value.ipv6_bgp_auto_discovery_pmsi_timer_stop_forwarding
  ipv6_bgp_auto_discovery_segmented                                  = each.value.ipv6_bgp_auto_discovery_segmented
  ipv6_bgp_auto_discovery_segmented_bandwidth_threshold              = each.value.ipv6_bgp_auto_discovery_segmented_bandwidth_threshold
  ipv6_bgp_auto_discovery_segmented_color                            = each.value.ipv6_bgp_auto_discovery_segmented_color
  ipv6_bgp_auto_discovery_inherit_vrf_ri_vrf                         = each.value.ipv6_bgp_auto_discovery_inherit_vrf_ri_vrf
  ipv6_static_rpf_address_ranges                                     = each.value.ipv6_static_rpf_address_ranges
  ipv6_core_tree_protocol_rsvp_te                                    = each.value.ipv6_core_tree_protocol_rsvp_te
  ipv6_core_tree_protocol_rsvp_te_group_list                         = each.value.ipv6_core_tree_protocol_rsvp_te_group_list
  ipv6_mdt_data_ingress_replication                                  = each.value.ipv6_mdt_data_ingress_replication
  ipv6_mdt_data_ingress_replication_auto_tunnel                      = each.value.ipv6_mdt_data_ingress_replication_auto_tunnel
  ipv6_mdt_data_ingress_replication_auto_tunnel_attribute_set        = each.value.ipv6_mdt_data_ingress_replication_auto_tunnel_attribute_set
  ipv6_mdt_data_ingress_replication_number                           = each.value.ipv6_mdt_data_ingress_replication_number
  ipv6_mdt_data_ingress_replication_access_list_name                 = each.value.ipv6_mdt_data_ingress_replication_access_list_name
  ipv6_mdt_data_ingress_replication_immediate_switch                 = each.value.ipv6_mdt_data_ingress_replication_immediate_switch
  ipv6_mdt_data_ingress_replication_route_policy                     = each.value.ipv6_mdt_data_ingress_replication_route_policy
  ipv6_mdt_data_ingress_replication_threshold                        = each.value.ipv6_mdt_data_ingress_replication_threshold
  ipv6_mdt_data_mldp_maximum_number                                  = each.value.ipv6_mdt_data_mldp_maximum_number
  ipv6_mdt_data_mldp_access_list_name                                = each.value.ipv6_mdt_data_mldp_access_list_name
  ipv6_mdt_data_mldp_immediate_switch                                = each.value.ipv6_mdt_data_mldp_immediate_switch
  ipv6_mdt_data_mldp_route_policy                                    = each.value.ipv6_mdt_data_mldp_route_policy
  ipv6_mdt_data_mldp_threshold                                       = each.value.ipv6_mdt_data_mldp_threshold
  ipv6_mdt_data_mldp_flex_algo                                       = each.value.ipv6_mdt_data_mldp_flex_algo
  ipv6_mdt_data_p2mp_te                                              = each.value.ipv6_mdt_data_p2mp_te
  ipv6_mdt_data_p2mp_te_maximum_number                               = each.value.ipv6_mdt_data_p2mp_te_maximum_number
  ipv6_mdt_data_p2mp_te_attribute_set                                = each.value.ipv6_mdt_data_p2mp_te_attribute_set
  ipv6_mdt_data_p2mp_te_access_list_name                             = each.value.ipv6_mdt_data_p2mp_te_access_list_name
  ipv6_mdt_data_p2mp_te_immediate_switch                             = each.value.ipv6_mdt_data_p2mp_te_immediate_switch
  ipv6_mdt_data_p2mp_te_route_policy                                 = each.value.ipv6_mdt_data_p2mp_te_route_policy
  ipv6_mdt_data_p2mp_te_threshold                                    = each.value.ipv6_mdt_data_p2mp_te_threshold
  ipv6_mdt_default_ipv4_partitioned_bidir                            = each.value.ipv6_mdt_default_ipv4_partitioned_bidir
  ipv6_mdt_default_mldp_p2mp                                         = each.value.ipv6_mdt_default_mldp_p2mp
  ipv6_mdt_default_mldp_p2mp_partitioned_bidir                       = each.value.ipv6_mdt_default_mldp_p2mp_partitioned_bidir
  ipv6_mdt_default_mldp_p2mp_flex_algo                               = each.value.ipv6_mdt_default_mldp_p2mp_flex_algo
  ipv6_mdt_default_p2mp_te_attribute_set                             = each.value.ipv6_mdt_default_p2mp_te_attribute_set
  ipv6_mdt_default_p2mp_te_static                                    = each.value.ipv6_mdt_default_p2mp_te_static
  ipv6_mdt_default_ingress_replication                               = each.value.ipv6_mdt_default_ingress_replication
  ipv6_mdt_default_ingress_replication_auto_tunnel                   = each.value.ipv6_mdt_default_ingress_replication_auto_tunnel
  ipv6_mdt_default_ingress_replication_auto_tunnel_attribute_set     = each.value.ipv6_mdt_default_ingress_replication_auto_tunnel_attribute_set
  ipv6_mdt_partitioned_p2mp_te_attribute_set                         = each.value.ipv6_mdt_partitioned_p2mp_te_attribute_set
  ipv6_mdt_partitioned_mldp_ipv4_p2mp                                = each.value.ipv6_mdt_partitioned_mldp_ipv4_p2mp
  ipv6_mdt_partitioned_mldp_ipv4_p2mp_bidir                          = each.value.ipv6_mdt_partitioned_mldp_ipv4_p2mp_bidir
  ipv6_mdt_partitioned_mldp_ipv4_flex_algo                           = each.value.ipv6_mdt_partitioned_mldp_ipv4_flex_algo
  ipv6_mdt_partitioned_ingress_replication                           = each.value.ipv6_mdt_partitioned_ingress_replication
  ipv6_mdt_partitioned_ingress_replication_auto_tunnel               = each.value.ipv6_mdt_partitioned_ingress_replication_auto_tunnel
  ipv6_mdt_partitioned_ingress_replication_auto_tunnel_attribute_set = each.value.ipv6_mdt_partitioned_ingress_replication_auto_tunnel_attribute_set
  ipv6_mdt_mldp_in_band_signaling_ipv4                               = each.value.ipv6_mdt_mldp_in_band_signaling_ipv4
  ipv6_mdt_static_segment_routing                                    = each.value.ipv6_mdt_static_segment_routing
  ipv6_mdt_static_segment_routing_strict_rpf                         = each.value.ipv6_mdt_static_segment_routing_strict_rpf
  ipv6_static_sr_policies                                            = each.value.ipv6_static_sr_policies
  ipv6                                                               = each.value.ipv6

  depends_on = [
    iosxr_route_policy.route_policy
  ]
}
