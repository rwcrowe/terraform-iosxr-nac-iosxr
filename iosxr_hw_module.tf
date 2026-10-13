##### HW Module Profile #####

locals {
  hw_module_profile = flatten([
    for device in local.devices : [
      {
        key                                                          = device.name
        device_name                                                  = device.name
        bgp_mp_pic_auto_protect_enable                               = try(local.device_config[device.name].hw_module.profile.bgp_mp_pic.auto_protect_enable, local.defaults.iosxr.devices.configuration.hw_module.profile.bgp_mp_pic.auto_protect_enable, null)
        profile_bundle_hash_ignore_ingress_port                      = try(local.device_config[device.name].hw_module.profile.bundle_hash.ignore_ingress_port, local.defaults.iosxr.devices.configuration.hw_module.profile.bundle_hash.ignore_ingress_port, null)
        profile_bundle_hash_index_locations                          = try(length(try(local.device_config[device.name].hw_module.profile.bundle_hash.index_locations, local.defaults.iosxr.devices.configuration.hw_module.profile.bundle_hash.index_locations, null)) > 0 ? [for item in try(local.device_config[device.name].hw_module.profile.bundle_hash.index_locations, local.defaults.iosxr.devices.configuration.hw_module.profile.bundle_hash.index_locations, null) : { location_name = try(item.name, local.defaults.iosxr.devices.configuration.hw_module.profile.bundle_hash.index_locations.name, null), location_name2 = item.name, index = try(tostring(item.index), tostring(local.defaults.iosxr.devices.configuration.hw_module.profile.bundle_hash.index_locations.index), null) }] : null, null)
        profile_bundle_hash_per_packet_round_robin                   = try(local.device_config[device.name].hw_module.profile.bundle_hash.per_packet_round_robin, local.defaults.iosxr.devices.configuration.hw_module.profile.bundle_hash.per_packet_round_robin, null)
        fib_mpls_php_dscp_preserve                                   = local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile.fib.mpls_php_dscp_preserve, local.defaults.iosxr.devices.configuration.hw_module.profile.fib.mpls_php_dscp_preserve, null) : null
        fib_bgp_pic_level_3_l2services                               = local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile.fib_bgp_pic.level_3_l2services, local.defaults.iosxr.devices.configuration.hw_module.profile.fib_bgp_pic.level_3_l2services, null) : null
        fib_bgp_pic_multipath_core_enable                            = try(local.device_config[device.name].hw_module.profile.fib_bgp_pic.multipath_core_enable, local.defaults.iosxr.devices.configuration.hw_module.profile.fib_bgp_pic.multipath_core_enable, null)
        profile_load_balance_algorithm_hash_polynomial_index         = try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.hash_polynomial_index, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.hash_polynomial_index, null)
        profile_load_balance_algorithm_layer2                        = try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.mode, null) == "layer2" ? true : null
        profile_load_balance_algorithm_ip_tunnel                     = try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.mode, null) == "ip-tunnel" ? true : null
        profile_load_balance_algorithm_mpls_safe_speculative_parsing = try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.mode, null) == "mpls-safe-speculative-parsing" ? true : null
        profile_load_balance_algorithm_l3_only                       = try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.mode, null) == "l3-only" ? true : null
        profile_load_balance_algorithm_gtp                           = try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.mode, null) == "gtp" ? true : null
        profile_load_balance_algorithm_gtp_mpls                      = try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.mode, null) == "gtp-mpls" ? true : null
        profile_load_balance_algorithm_mpls_lsr_ler                  = try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.mode, null) == "mpls-lsr-ler" ? true : null
        profile_load_balance_algorithm_mpls_lsr_ler_optimized        = try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.mode, null) == "mpls-lsr-ler-optimized" ? true : null
        profile_load_balance_algorithm_fat_based_hash                = try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.mode, null) == "fat-based-hash" ? true : null
        profile_load_balance_algorithm_inner_l2_field                = try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.mode, null) == "inner-l2-field" ? true : null
        profile_load_balance_algorithm_pppoe                         = contains(["pppoe", "pppoe-decap-fatbased-hashing"], try(try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.mode, null), "")) ? true : null
        profile_load_balance_algorithm_pppoe_decap_fatbased_hashing  = try(local.device_config[device.name].hw_module.profile.load_balance_algorithm.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.load_balance_algorithm.mode, null) == "pppoe-decap-fatbased-hashing" ? true : null
        profile_mdb_l3max_srv6                                       = local.device_is_25x[device.name] ? (try(local.device_config[device.name].hw_module.profile.mdb, local.defaults.iosxr.devices.configuration.hw_module.profile.mdb, null) == "l3max-srv6" ? true : null) : null
        profile_mdb_l3max_se_srv6                                    = local.device_is_25x[device.name] ? (try(local.device_config[device.name].hw_module.profile.mdb, local.defaults.iosxr.devices.configuration.hw_module.profile.mdb, null) == "l3max-se-srv6" ? true : null) : null
        profile_mdb_l2max_srv6                                       = local.device_is_25x[device.name] ? (try(local.device_config[device.name].hw_module.profile.mdb, local.defaults.iosxr.devices.configuration.hw_module.profile.mdb, null) == "l2max-srv6" ? true : null) : null
        profile_mdb_l2max_se_srv6                                    = local.device_is_25x[device.name] ? (try(local.device_config[device.name].hw_module.profile.mdb, local.defaults.iosxr.devices.configuration.hw_module.profile.mdb, null) == "l2max-se-srv6" ? true : null) : null
        npu_native_mode_enable                                       = try(local.device_config[device.name].hw_module.profile.native_mode_enable, local.defaults.iosxr.devices.configuration.hw_module.profile.native_mode_enable, null)
        netflow_ipfix315_enable                                      = try(local.device_config[device.name].hw_module.profile.netflow.ipfix315.enable, local.defaults.iosxr.devices.configuration.hw_module.profile.netflow.ipfix315.enable, null)
        netflow_ipfix315_enable_locations                            = try(length(try(local.device_config[device.name].hw_module.profile.netflow.ipfix315.locations, local.defaults.iosxr.devices.configuration.hw_module.profile.netflow.ipfix315.locations, null)) > 0 ? [for item in try(local.device_config[device.name].hw_module.profile.netflow.ipfix315.locations, local.defaults.iosxr.devices.configuration.hw_module.profile.netflow.ipfix315.locations, null) : { location_name = try(item.name, local.defaults.iosxr.devices.configuration.hw_module.profile.netflow.ipfix315.locations.name, null), location_name2 = item.name }] : null, null)
        netflow_sflow_enable                                         = try(local.device_config[device.name].hw_module.profile.netflow.sflow.enable, local.defaults.iosxr.devices.configuration.hw_module.profile.netflow.sflow.enable, null)
        netflow_sflow_enable_locations                               = try(length(try(local.device_config[device.name].hw_module.profile.netflow.sflow.locations, local.defaults.iosxr.devices.configuration.hw_module.profile.netflow.sflow.locations, null)) > 0 ? [for item in try(local.device_config[device.name].hw_module.profile.netflow.sflow.locations, local.defaults.iosxr.devices.configuration.hw_module.profile.netflow.sflow.locations, null) : { location_name = try(item.name, local.defaults.iosxr.devices.configuration.hw_module.profile.netflow.sflow.locations.name, null), location_name2 = item.name }] : null, null)
        oam_four8byte_cfm_maid_enable                                = try(local.device_config[device.name].hw_module.profile.oam.four8byte_cfm_maid_enable, local.defaults.iosxr.devices.configuration.hw_module.profile.oam.four8byte_cfm_maid_enable, null)
        oam_sat_enable                                               = try(local.device_config[device.name].hw_module.profile.oam.sat_enable, local.defaults.iosxr.devices.configuration.hw_module.profile.oam.sat_enable, null)
        offload_one                                                  = try(local.device_config[device.name].hw_module.profile.offload, local.defaults.iosxr.devices.configuration.hw_module.profile.offload, null) == "one" ? true : null
        offload_two                                                  = try(local.device_config[device.name].hw_module.profile.offload, local.defaults.iosxr.devices.configuration.hw_module.profile.offload, null) == "two" ? true : null
        offload_three                                                = try(local.device_config[device.name].hw_module.profile.offload, local.defaults.iosxr.devices.configuration.hw_module.profile.offload, null) == "three" ? true : null
        offload_four                                                 = try(local.device_config[device.name].hw_module.profile.offload, local.defaults.iosxr.devices.configuration.hw_module.profile.offload, null) == "four" ? true : null
        profile_qos_arp_isis_priority_enable                         = try(local.device_config[device.name].hw_module.profile.qos.arp_isis_priority_enable, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.arp_isis_priority_enable, null)
        profile_qos_conform_aware_policer                            = try(local.device_config[device.name].hw_module.profile.qos.conform_aware_policer, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.conform_aware_policer, null)
        profile_qos_ecn_marking_stats                                = try(local.device_config[device.name].hw_module.profile.qos.ecn_marking_stats, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.ecn_marking_stats, null)
        profile_qos_egress_compensation_setting_force                = try(local.device_config[device.name].hw_module.profile.qos.egress_compensation_setting_force, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.egress_compensation_setting_force, null)
        profile_qos_egress_exp_mark_disable                          = local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile.qos.egress_exp_mark_disable, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.egress_exp_mark_disable, null) : null
        profile_qos_free_buffer_int_threshold_clear                  = try(local.device_config[device.name].hw_module.profile.qos.free_buffer_int_threshold.clear, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.free_buffer_int_threshold.clear, null)
        profile_qos_free_buffer_int_threshold_set                    = try(local.device_config[device.name].hw_module.profile.qos.free_buffer_int_threshold.set, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.free_buffer_int_threshold.set, null)
        profile_qos_gre_exp_classification_enable                    = try(local.device_config[device.name].hw_module.profile.qos.gre_exp_classification_enable, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.gre_exp_classification_enable, null)
        profile_qos_hqos_enable                                      = try(local.device_config[device.name].hw_module.profile.qos.hqos_enable, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.hqos_enable, null)
        profile_qos_ingress_fadt_set                                 = local.device_is_25x[device.name] ? try(tostring(try(local.device_config[device.name].hw_module.profile.qos.ingress_fadt_set, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.ingress_fadt_set, null)), null) : null
        profile_qos_ingress_fadt_set_locations                       = local.device_is_25x[device.name] ? (try(length(try(local.device_config[device.name].hw_module.profile.qos.ingress_fadt_set_locations, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.ingress_fadt_set_locations, null)) > 0 ? [for item in try(local.device_config[device.name].hw_module.profile.qos.ingress_fadt_set_locations, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.ingress_fadt_set_locations, null) : { location_name = try(item.name, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.ingress_fadt_set_locations.name, null), ingress_fadt_set = try(item.ingress_fadt_set, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.ingress_fadt_set_locations.ingress_fadt_set, null) }] : null, null)) : null
        profile_qos_lag_scheduler                                    = try(local.device_config[device.name].hw_module.profile.qos.lag_scheduler, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.lag_scheduler, null)
        profile_qos_max_classmap_size                                = try(tostring(try(local.device_config[device.name].hw_module.profile.qos.max_classmap_size, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.max_classmap_size, null)), null)
        profile_qos_max_classmap_size_locations                      = try(length(try(local.device_config[device.name].hw_module.profile.qos.max_classmap_size_locations, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.max_classmap_size_locations, null)) > 0 ? [for item in try(local.device_config[device.name].hw_module.profile.qos.max_classmap_size_locations, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.max_classmap_size_locations, null) : { location_name = try(item.name, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.max_classmap_size_locations.name, null), max_classmap_size = try(tostring(item.max_classmap_size), tostring(local.defaults.iosxr.devices.configuration.hw_module.profile.qos.max_classmap_size_locations.max_classmap_size), null) }] : null, null)
        profile_qos_nif_hp_fifo_reserve_locations                    = try(length(try(local.device_config[device.name].hw_module.profile.qos.nif_hp_fifo_reserve.locations, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.nif_hp_fifo_reserve.locations, null)) > 0 ? [for item in try(local.device_config[device.name].hw_module.profile.qos.nif_hp_fifo_reserve.locations, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.nif_hp_fifo_reserve.locations, null) : { location_name = try(item.name, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.nif_hp_fifo_reserve.locations.name, null), percent = try(item.percent, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.nif_hp_fifo_reserve.locations.percent, null) }] : null, null)
        profile_qos_nif_hp_fifo_reserve_percent                      = try(local.device_config[device.name].hw_module.profile.qos.nif_hp_fifo_reserve.percent, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.nif_hp_fifo_reserve.percent, null)
        profile_qos_policer_scale                                    = try(tostring(try(local.device_config[device.name].hw_module.profile.qos.policer_scale, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.policer_scale, null)), null)
        profile_qos_qosg_dscp_mark_enable_first                      = try(local.device_config[device.name].hw_module.profile.qos.qosg_dscp_mark_enable.first, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.qosg_dscp_mark_enable.first, null)
        profile_qos_qosg_dscp_mark_enable_second                     = try(local.device_config[device.name].hw_module.profile.qos.qosg_dscp_mark_enable.second, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.qosg_dscp_mark_enable.second, null)
        profile_qos_shared_policer_per_class_stats                   = try(local.device_config[device.name].hw_module.profile.qos.shared_policer_per_class_stats, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.shared_policer_per_class_stats, null)
        profile_qos_stats_collection                                 = try(local.device_config[device.name].hw_module.profile.qos.stats_collection, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.stats_collection, null)
        profile_qos_wred_stats_enable                                = try(local.device_config[device.name].hw_module.profile.qos.wred_stats_enable, local.defaults.iosxr.devices.configuration.hw_module.profile.qos.wred_stats_enable, null)
        sr_policy_v6_null_label_autopush                             = try(local.device_config[device.name].hw_module.profile.sr_policy.v6_null_label_autopush, local.defaults.iosxr.devices.configuration.hw_module.profile.sr_policy.v6_null_label_autopush, null)
        srv6_encapsulation_l2_traffic_class_propagate                = try(local.device_config[device.name].hw_module.profile.srv6.encapsulation.l2_traffic_class.propagate, local.defaults.iosxr.devices.configuration.hw_module.profile.srv6.encapsulation.l2_traffic_class.propagate, null)
        srv6_encapsulation_l2_traffic_class_value                    = try(local.device_config[device.name].hw_module.profile.srv6.encapsulation.l2_traffic_class.value, local.defaults.iosxr.devices.configuration.hw_module.profile.srv6.encapsulation.l2_traffic_class.value, null)
        srv6_encapsulation_l3_traffic_class_policy_map               = try(local.device_config[device.name].hw_module.profile.srv6.encapsulation.l3_traffic_class.policy_map, local.defaults.iosxr.devices.configuration.hw_module.profile.srv6.encapsulation.l3_traffic_class.policy_map, null)
        srv6_encapsulation_l3_traffic_class_propagate                = try(local.device_config[device.name].hw_module.profile.srv6.encapsulation.l3_traffic_class.propagate, local.defaults.iosxr.devices.configuration.hw_module.profile.srv6.encapsulation.l3_traffic_class.propagate, null)
        srv6_encapsulation_l3_traffic_class_value                    = try(local.device_config[device.name].hw_module.profile.srv6.encapsulation.l3_traffic_class.value, local.defaults.iosxr.devices.configuration.hw_module.profile.srv6.encapsulation.l3_traffic_class.value, null)
        srv6_encapsulation_l3_traffic_class_with_hoplimit_propagate  = try(local.device_config[device.name].hw_module.profile.srv6.encapsulation.l3_traffic_class_with_hoplimit_propagate, local.defaults.iosxr.devices.configuration.hw_module.profile.srv6.encapsulation.l3_traffic_class_with_hoplimit_propagate, null)
        srv6_mode_micro_segment_format_f3216_path_mtu                = try(local.device_config[device.name].hw_module.profile.srv6.micro_segment_f3216_path_mtu, local.defaults.iosxr.devices.configuration.hw_module.profile.srv6.micro_segment_f3216_path_mtu, null)
        srv6_mode_base                                               = try(local.device_config[device.name].hw_module.profile.srv6.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.srv6.mode, null) == "base" ? true : null
        srv6_mode_base_and_micro_segment_f3216                       = try(local.device_config[device.name].hw_module.profile.srv6.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.srv6.mode, null) == "base-and-micro-segment-f3216" ? true : null
        srv6_mode_micro_segment_format_f3216                         = try(local.device_config[device.name].hw_module.profile.srv6.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.srv6.mode, null) == "micro-segment-f3216" ? true : null
        stats_acl_permit                                             = try(local.device_config[device.name].hw_module.profile.stats.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.stats.mode, null) == "acl-permit" ? true : null
        stats_qos_enhanced                                           = try(local.device_config[device.name].hw_module.profile.stats.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.stats.mode, null) == "qos-enhanced" ? true : null
        stats_ingress_sr                                             = try(local.device_config[device.name].hw_module.profile.stats.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.stats.mode, null) == "ingress-sr" ? true : null
        stats_enhanced_sr_policy                                     = try(local.device_config[device.name].hw_module.profile.stats.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.stats.mode, null) == "enhanced-sr-policy" ? true : null
        stats_ingress_sr_mspw                                        = try(local.device_config[device.name].hw_module.profile.stats.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.stats.mode, null) == "ingress-sr-mspw" ? true : null
        stats_tx_scale_enhanced                                      = contains(["tx-scale-enhanced", "tx-scale-enhanced-acl-permit", "tx-scale-enhanced-qos-enhanced", "tx-scale-enhanced-ingress-sr"], try(try(local.device_config[device.name].hw_module.profile.stats.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.stats.mode, null), "")) ? true : null
        stats_tx_scale_enhanced_acl_permit                           = try(local.device_config[device.name].hw_module.profile.stats.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.stats.mode, null) == "tx-scale-enhanced-acl-permit" ? true : null
        stats_tx_scale_enhanced_qos_enhanced                         = try(local.device_config[device.name].hw_module.profile.stats.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.stats.mode, null) == "tx-scale-enhanced-qos-enhanced" ? true : null
        stats_tx_scale_enhanced_ingress_sr                           = try(local.device_config[device.name].hw_module.profile.stats.mode, local.defaults.iosxr.devices.configuration.hw_module.profile.stats.mode, null) == "tx-scale-enhanced-ingress-sr" ? true : null
      }
    ] if try(local.device_config[device.name].hw_module.profile, null) != null
  ])
}

resource "iosxr_hw_module_profile" "hw_module_profile" {
  for_each                                                     = { for v in local.hw_module_profile : v.key => v }
  device                                                       = each.value.device_name
  bgp_mp_pic_auto_protect_enable                               = each.value.bgp_mp_pic_auto_protect_enable
  profile_bundle_hash_ignore_ingress_port                      = each.value.profile_bundle_hash_ignore_ingress_port
  profile_bundle_hash_index_locations                          = each.value.profile_bundle_hash_index_locations
  profile_bundle_hash_per_packet_round_robin                   = each.value.profile_bundle_hash_per_packet_round_robin
  fib_mpls_php_dscp_preserve                                   = each.value.fib_mpls_php_dscp_preserve
  fib_bgp_pic_level_3_l2services                               = each.value.fib_bgp_pic_level_3_l2services
  fib_bgp_pic_multipath_core_enable                            = each.value.fib_bgp_pic_multipath_core_enable
  profile_load_balance_algorithm_hash_polynomial_index         = each.value.profile_load_balance_algorithm_hash_polynomial_index
  profile_load_balance_algorithm_layer2                        = each.value.profile_load_balance_algorithm_layer2
  profile_load_balance_algorithm_ip_tunnel                     = each.value.profile_load_balance_algorithm_ip_tunnel
  profile_load_balance_algorithm_mpls_safe_speculative_parsing = each.value.profile_load_balance_algorithm_mpls_safe_speculative_parsing
  profile_load_balance_algorithm_l3_only                       = each.value.profile_load_balance_algorithm_l3_only
  profile_load_balance_algorithm_gtp                           = each.value.profile_load_balance_algorithm_gtp
  profile_load_balance_algorithm_gtp_mpls                      = each.value.profile_load_balance_algorithm_gtp_mpls
  profile_load_balance_algorithm_mpls_lsr_ler                  = each.value.profile_load_balance_algorithm_mpls_lsr_ler
  profile_load_balance_algorithm_mpls_lsr_ler_optimized        = each.value.profile_load_balance_algorithm_mpls_lsr_ler_optimized
  profile_load_balance_algorithm_fat_based_hash                = each.value.profile_load_balance_algorithm_fat_based_hash
  profile_load_balance_algorithm_inner_l2_field                = each.value.profile_load_balance_algorithm_inner_l2_field
  profile_load_balance_algorithm_pppoe                         = each.value.profile_load_balance_algorithm_pppoe
  profile_load_balance_algorithm_pppoe_decap_fatbased_hashing  = each.value.profile_load_balance_algorithm_pppoe_decap_fatbased_hashing
  profile_mdb_l3max_srv6                                       = each.value.profile_mdb_l3max_srv6
  profile_mdb_l3max_se_srv6                                    = each.value.profile_mdb_l3max_se_srv6
  profile_mdb_l2max_srv6                                       = each.value.profile_mdb_l2max_srv6
  profile_mdb_l2max_se_srv6                                    = each.value.profile_mdb_l2max_se_srv6
  npu_native_mode_enable                                       = each.value.npu_native_mode_enable
  netflow_ipfix315_enable                                      = each.value.netflow_ipfix315_enable
  netflow_ipfix315_enable_locations                            = each.value.netflow_ipfix315_enable_locations
  netflow_sflow_enable                                         = each.value.netflow_sflow_enable
  netflow_sflow_enable_locations                               = each.value.netflow_sflow_enable_locations
  oam_four8byte_cfm_maid_enable                                = each.value.oam_four8byte_cfm_maid_enable
  oam_sat_enable                                               = each.value.oam_sat_enable
  offload_one                                                  = each.value.offload_one
  offload_two                                                  = each.value.offload_two
  offload_three                                                = each.value.offload_three
  offload_four                                                 = each.value.offload_four
  profile_qos_arp_isis_priority_enable                         = each.value.profile_qos_arp_isis_priority_enable
  profile_qos_conform_aware_policer                            = each.value.profile_qos_conform_aware_policer
  profile_qos_ecn_marking_stats                                = each.value.profile_qos_ecn_marking_stats
  profile_qos_egress_compensation_setting_force                = each.value.profile_qos_egress_compensation_setting_force
  profile_qos_egress_exp_mark_disable                          = each.value.profile_qos_egress_exp_mark_disable
  profile_qos_free_buffer_int_threshold_clear                  = each.value.profile_qos_free_buffer_int_threshold_clear
  profile_qos_free_buffer_int_threshold_set                    = each.value.profile_qos_free_buffer_int_threshold_set
  profile_qos_gre_exp_classification_enable                    = each.value.profile_qos_gre_exp_classification_enable
  profile_qos_hqos_enable                                      = each.value.profile_qos_hqos_enable
  profile_qos_ingress_fadt_set                                 = each.value.profile_qos_ingress_fadt_set
  profile_qos_ingress_fadt_set_locations                       = each.value.profile_qos_ingress_fadt_set_locations
  profile_qos_lag_scheduler                                    = each.value.profile_qos_lag_scheduler
  profile_qos_max_classmap_size                                = each.value.profile_qos_max_classmap_size
  profile_qos_max_classmap_size_locations                      = each.value.profile_qos_max_classmap_size_locations
  profile_qos_nif_hp_fifo_reserve_locations                    = each.value.profile_qos_nif_hp_fifo_reserve_locations
  profile_qos_nif_hp_fifo_reserve_percent                      = each.value.profile_qos_nif_hp_fifo_reserve_percent
  profile_qos_policer_scale                                    = each.value.profile_qos_policer_scale
  profile_qos_qosg_dscp_mark_enable_first                      = each.value.profile_qos_qosg_dscp_mark_enable_first
  profile_qos_qosg_dscp_mark_enable_second                     = each.value.profile_qos_qosg_dscp_mark_enable_second
  profile_qos_shared_policer_per_class_stats                   = each.value.profile_qos_shared_policer_per_class_stats
  profile_qos_stats_collection                                 = each.value.profile_qos_stats_collection
  profile_qos_wred_stats_enable                                = each.value.profile_qos_wred_stats_enable
  sr_policy_v6_null_label_autopush                             = each.value.sr_policy_v6_null_label_autopush
  srv6_encapsulation_l2_traffic_class_propagate                = each.value.srv6_encapsulation_l2_traffic_class_propagate
  srv6_encapsulation_l2_traffic_class_value                    = each.value.srv6_encapsulation_l2_traffic_class_value
  srv6_encapsulation_l3_traffic_class_policy_map               = each.value.srv6_encapsulation_l3_traffic_class_policy_map
  srv6_encapsulation_l3_traffic_class_propagate                = each.value.srv6_encapsulation_l3_traffic_class_propagate
  srv6_encapsulation_l3_traffic_class_value                    = each.value.srv6_encapsulation_l3_traffic_class_value
  srv6_encapsulation_l3_traffic_class_with_hoplimit_propagate  = each.value.srv6_encapsulation_l3_traffic_class_with_hoplimit_propagate
  srv6_mode_micro_segment_format_f3216_path_mtu                = each.value.srv6_mode_micro_segment_format_f3216_path_mtu
  srv6_mode_base                                               = each.value.srv6_mode_base
  srv6_mode_base_and_micro_segment_f3216                       = each.value.srv6_mode_base_and_micro_segment_f3216
  srv6_mode_micro_segment_format_f3216                         = each.value.srv6_mode_micro_segment_format_f3216
  stats_acl_permit                                             = each.value.stats_acl_permit
  stats_qos_enhanced                                           = each.value.stats_qos_enhanced
  stats_ingress_sr                                             = each.value.stats_ingress_sr
  stats_enhanced_sr_policy                                     = each.value.stats_enhanced_sr_policy
  stats_ingress_sr_mspw                                        = each.value.stats_ingress_sr_mspw
  stats_tx_scale_enhanced                                      = each.value.stats_tx_scale_enhanced
  stats_tx_scale_enhanced_acl_permit                           = each.value.stats_tx_scale_enhanced_acl_permit
  stats_tx_scale_enhanced_qos_enhanced                         = each.value.stats_tx_scale_enhanced_qos_enhanced
  stats_tx_scale_enhanced_ingress_sr                           = each.value.stats_tx_scale_enhanced_ingress_sr
}

##### HW Module Profile 8000 #####

locals {
  hw_module_profile_8000 = flatten([
    for device in local.devices : [
      {
        key                                                         = device.name
        device_name                                                 = device.name
        profile_bw_threshold                                        = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.bw_threshold, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.bw_threshold, null)), null)
        profile_cef_bgplu                                           = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.cef.bgplu, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.bgplu, null)), null)
        profile_cef_bgplu_over_rsvpte                               = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.cef.bgplu_over_rsvpte, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.bgplu_over_rsvpte, null)), null)
        profile_cef_cbf                                             = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.cef.cbf, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.cbf, null)), null)
        profile_cef_cbf_forward_class_list                          = try(local.device_config[device.name].hw_module.profile_8000.cef.cbf_forward_class_list, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.cbf_forward_class_list, null)
        profile_cef_dark_bw                                         = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.cef.dark_bw, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.dark_bw, null)), null)
        profile_cef_hash_ip_field_duplication                       = local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.cef.hash_ip_field_duplication, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.hash_ip_field_duplication, null) : null
        profile_cef_ip_redirect                                     = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.cef.ip_redirect, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.ip_redirect, null)), null)
        profile_cef_iptunnel_scale                                  = local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.cef.iptunnel_scale, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.iptunnel_scale, null) : null
        profile_cef_ipv6_hop_limit                                  = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.cef.ipv6_hop_limit, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.ipv6_hop_limit, null)), null)
        profile_cef_lpts_acl                                        = try(local.device_config[device.name].hw_module.profile_8000.cef.lpts.acl, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.lpts.acl, null)
        profile_cef_lpts_pifib_entry_counters                       = try(local.device_config[device.name].hw_module.profile_8000.cef.lpts.pifib_entry_counters, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.lpts.pifib_entry_counters, null)
        profile_cef_mplsoudp_scale                                  = !local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.cef.mplsoudp_scale, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.mplsoudp_scale, null) : null
        profile_cef_source_rtbh_enable                              = try(local.device_config[device.name].hw_module.profile_8000.cef.source_rtbh_enable, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.source_rtbh_enable, null)
        profile_cef_sropt                                           = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.cef.sropt, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.sropt, null)), null)
        profile_cef_stats_label_app_default                         = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.cef.stats_label_app_default, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.stats_label_app_default, null)), null)
        profile_cef_te_tunnel_highscale_ldp_over_te_no_sr_over_srte = try(local.device_config[device.name].hw_module.profile_8000.cef.te_tunnel.highscale_ldp_over_te_no_sr_over_srte, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.te_tunnel.highscale_ldp_over_te_no_sr_over_srte, null)
        profile_cef_te_tunnel_highscale_no_ldp_over_te              = try(local.device_config[device.name].hw_module.profile_8000.cef.te_tunnel.highscale_no_ldp_over_te, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.te_tunnel.highscale_no_ldp_over_te, null)
        profile_cef_te_tunnel_label_over_te_counters                = try(local.device_config[device.name].hw_module.profile_8000.cef.te_tunnel.label_over_te_counters, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.te_tunnel.label_over_te_counters, null)
        profile_cef_ttl_tunnel_ip_decrement                         = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.cef.ttl_tunnel_ip_decrement, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.ttl_tunnel_ip_decrement, null)), null)
        profile_cef_unipath_surpf_enable                            = try(local.device_config[device.name].hw_module.profile_8000.cef.unipath_surpf_enable, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.unipath_surpf_enable, null)
        profile_cef_vxlan_ipv6_tnl_scale                            = try(local.device_config[device.name].hw_module.profile_8000.cef.vxlan_ipv6_tnl_scale, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.cef.vxlan_ipv6_tnl_scale, null)
        profile_encap_exact_interfaces                              = try(length(try(local.device_config[device.name].hw_module.profile_8000.encap_exact.interfaces, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.encap_exact.interfaces, null)) > 0 ? [for i in try(local.device_config[device.name].hw_module.profile_8000.encap_exact.interfaces, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.encap_exact.interfaces, null) : { interface_name = i }] : null, null)
        profile_encap_exact_locations                               = try(length([for l in try(local.device_config[device.name].hw_module.profile_8000.encap_exact.locations, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.encap_exact.locations, null) : l if !contains(["all", "all-virtual"], l)]) > 0 ? [for l in try(local.device_config[device.name].hw_module.profile_8000.encap_exact.locations, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.encap_exact.locations, null) : { location_name = l } if !contains(["all", "all-virtual"], l)] : null, null)
        profile_encap_exact_locations_all                           = try(contains(try(local.device_config[device.name].hw_module.profile_8000.encap_exact.locations, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.encap_exact.locations, null), "all") ? true : null, null)
        profile_encap_exact_locations_all_virtual                   = try(contains(try(local.device_config[device.name].hw_module.profile_8000.encap_exact.locations, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.encap_exact.locations, null), "all-virtual") ? true : null, null)
        profile_flowspec_ipv6_packet_len_enable                     = try(local.device_config[device.name].hw_module.profile_8000.flowspec_ipv6_packet_len_enable, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.flowspec_ipv6_packet_len_enable, null)
        profile_gue_udp_dest_port_ipv4                              = !local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.gue_udp_dest_port.ipv4, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.gue_udp_dest_port.ipv4, null) : null
        profile_gue_udp_dest_port_ipv6                              = !local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.gue_udp_dest_port.ipv6, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.gue_udp_dest_port.ipv6, null) : null
        profile_gue_udp_dest_port_mpls                              = !local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.gue_udp_dest_port.mpls, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.gue_udp_dest_port.mpls, null) : null
        profile_irb_throughput_optimized                            = try(local.device_config[device.name].hw_module.profile_8000.irb_throughput_optimized, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.irb_throughput_optimized, null)
        profile_l2fib_bridge_flush_convergence                      = try(local.device_config[device.name].hw_module.profile_8000.l2fib.bridge_flush_convergence, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.l2fib.bridge_flush_convergence, null)
        profile_l2fib_evpn_aging                                    = local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.l2fib.evpn_aging, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.l2fib.evpn_aging, null) : null
        profile_l2fib_higher_scale                                  = try(local.device_config[device.name].hw_module.profile_8000.l2fib.higher_scale, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.l2fib.higher_scale, null)
        profile_l2fib_pw_stats                                      = try(local.device_config[device.name].hw_module.profile_8000.l2fib.pw_stats, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.l2fib.pw_stats, null)
        profile_l2fib_vxlan_dc_leaf                                 = try(local.device_config[device.name].hw_module.profile_8000.l2fib.vxlan_dc_leaf, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.l2fib.vxlan_dc_leaf, null)
        multicast_route_scale                                       = try(local.device_config[device.name].hw_module.profile_8000.multicast_route_scale, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.multicast_route_scale, null)
        profile_npu_buffer_extended_locations                       = try(length(try(local.device_config[device.name].hw_module.profile_8000.npu.buffer_extended_locations, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.npu.buffer_extended_locations, null)) > 0 ? [for item in try(local.device_config[device.name].hw_module.profile_8000.npu.buffer_extended_locations, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.npu.buffer_extended_locations, null) : { location_name = try(item.name, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.npu.buffer_extended_locations.name, null), bandwidth_congestion_detection_enable = try(item.bandwidth_congestion_detection_enable, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.npu.buffer_extended_locations.bandwidth_congestion_detection_enable, null), bandwidth_congestion_protect_enable = try(item.bandwidth_congestion_protect_enable, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.npu.buffer_extended_locations.bandwidth_congestion_protect_enable, null) }] : null, null)
        profile_npu_compatibility                                   = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.npu.compatibility, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.npu.compatibility, null)), null)
        profile_priority_flow_control_locations                     = try(length(try(local.device_config[device.name].hw_module.profile_8000.priority_flow_control_locations, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations, null)) > 0 ? [for item in try(local.device_config[device.name].hw_module.profile_8000.priority_flow_control_locations, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations, null) : { location_name = try(item.name, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.name, null), buffer_extended_traffic_class = try(length(item.buffer_extended_traffic_classes) > 0 ? [for tc in item.buffer_extended_traffic_classes : { traffic_class_id = try(tc.traffic_class_id, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_extended_traffic_classes.traffic_class_id, null), kbytes_headroom = try(tc.kbytes_headroom, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_extended_traffic_classes.kbytes_headroom, null), mbytes_headroom = try(tc.mbytes_headroom, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_extended_traffic_classes.mbytes_headroom, null), ms_headroom = try(tc.ms_headroom, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_extended_traffic_classes.ms_headroom, null), pause_threshold = try(tc.pause_threshold, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_extended_traffic_classes.pause_threshold, null), pause_threshold_bytes = try(tc.pause_threshold_bytes, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_extended_traffic_classes.pause_threshold_bytes, null), us_headroom = try(tc.us_headroom, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_extended_traffic_classes.us_headroom, null) }] : null, null), buffer_internal_traffic_class = try(length(item.buffer_internal_traffic_classes) > 0 ? [for tc in item.buffer_internal_traffic_classes : { traffic_class_id = try(tc.traffic_class_id, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_internal_traffic_classes.traffic_class_id, null), pause_threshold = try(tc.pause_threshold, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_internal_traffic_classes.pause_threshold, null), headroom = try(tc.headroom, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_internal_traffic_classes.headroom, null), ecn = try(tc.ecn, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_internal_traffic_classes.ecn, null), max_threshold = try(tc.max_threshold, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_internal_traffic_classes.max_threshold, null), probability_percentage = try(tc.probability_percentage, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.buffer_internal_traffic_classes.probability_percentage, null) }] : null, null), non_pfc_tcs = local.device_is_25x[device.name] ? try(item.non_pfc_tcs.enable, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.non_pfc_tcs.enable, null) : null, non_pfc_tcs_max_non_pfc_voqs_hbm_buffers_percentage = local.device_is_25x[device.name] ? try(item.non_pfc_tcs.hbm_buffers_percentage, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.non_pfc_tcs.hbm_buffers_percentage, null) : null, non_pfc_tcs_max_non_pfc_voqs_number_of_evict_voqs = local.device_is_25x[device.name] ? try(item.non_pfc_tcs.number_of_evict_voqs, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.priority_flow_control_locations.non_pfc_tcs.number_of_evict_voqs, null) : null }] : null, null)
        profile_qos_high_water_marks                                = try(local.device_config[device.name].hw_module.profile_8000.qos.high_water_marks, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.qos.high_water_marks, null)
        profile_qos_intra_npu_over_fabric                           = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.qos.intra_npu_over_fabric, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.qos.intra_npu_over_fabric, null)), null)
        profile_qos_l2_mode                                         = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.qos.l2_mode, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.qos.l2_mode, null)), null)
        profile_qos_low_latency_mode                                = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.qos.low_latency_mode, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.qos.low_latency_mode, null)), null)
        profile_qos_mode                                            = local.device_is_25x[device.name] ? try(tostring(try(local.device_config[device.name].hw_module.profile_8000.qos.mode, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.qos.mode, null)), null) : null
        profile_qos_qos_stats_push_collection                       = try(local.device_config[device.name].hw_module.profile_8000.qos.qos_stats_push_collection, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.qos.qos_stats_push_collection, null)
        profile_qos_voq_mode_four                                   = try(local.device_config[device.name].hw_module.profile_8000.qos.voq_mode, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.qos.voq_mode, null) == "four" ? true : null
        profile_qos_voq_mode_eight                                  = try(local.device_config[device.name].hw_module.profile_8000.qos.voq_mode, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.qos.voq_mode, null) == "eight" ? true : null
        profile_qos_voq_mode_fair_four                              = try(local.device_config[device.name].hw_module.profile_8000.qos.voq_mode, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.qos.voq_mode, null) == "fair-four" ? true : null
        profile_qos_voq_mode_fair_eight                             = try(local.device_config[device.name].hw_module.profile_8000.qos.voq_mode, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.qos.voq_mode, null) == "fair-eight" ? true : null
        profile_route_scale_host_route                              = local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.route_scale.host_route, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.route_scale.host_route, null) : null
        profile_route_scale_ipv6_unicast_connected_prefix_high      = try(local.device_config[device.name].hw_module.profile_8000.route_scale.ipv6_unicast_connected_prefix_high, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.route_scale.ipv6_unicast_connected_prefix_high, null)
        profile_route_scale_lpm_full_scale                          = local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.route_scale.lpm_full_scale, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.route_scale.lpm_full_scale, null) : null
        profile_stats_acl_permit                                    = try(local.device_config[device.name].hw_module.profile_8000.stats.acl_permit, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.stats.acl_permit, null)
        profile_stats_no_bvi_ingress                                = try(local.device_config[device.name].hw_module.profile_8000.stats.no_bvi_ingress, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.stats.no_bvi_ingress, null)
        profile_stats_voqs_sharing_counters                         = try(tostring(try(local.device_config[device.name].hw_module.profile_8000.stats.voqs_sharing_counters, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.stats.voqs_sharing_counters, null)), null)
        profile_tcam_fib_ipv4_unicast_percent                       = !local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.tcam.fib_ipv4_unicast_percent, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.fib_ipv4_unicast_percent, null) : null
        profile_tcam_fib_ipv6_unicast_percent                       = !local.device_is_25x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.tcam.fib_ipv6_unicast_percent, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.fib_ipv6_unicast_percent, null) : null
        profile_tcam_format_access_list_ipv4_dst_addr               = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.dst_addr, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.dst_addr, null)
        profile_tcam_format_access_list_ipv4_dst_object_group       = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.dst_object_group, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.dst_object_group, null)
        profile_tcam_format_access_list_ipv4_dst_port               = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.dst_port, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.dst_port, null)
        profile_tcam_format_access_list_ipv4_frag_bit               = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.frag_bit, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.frag_bit, null)
        profile_tcam_format_access_list_ipv4_fragment_offset        = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.fragment_offset, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.fragment_offset, null)
        profile_tcam_format_access_list_ipv4_packet_len             = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.packet_len, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.packet_len, null)
        profile_tcam_format_access_list_ipv4_precedence             = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.precedence, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.precedence, null)
        profile_tcam_format_access_list_ipv4_proto                  = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.proto, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.proto, null)
        profile_tcam_format_access_list_ipv4_src_addr               = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.src_addr, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.src_addr, null)
        profile_tcam_format_access_list_ipv4_src_object_group       = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.src_object_group, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.src_object_group, null)
        profile_tcam_format_access_list_ipv4_src_port               = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.src_port, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.src_port, null)
        profile_tcam_format_access_list_ipv4_tcp_flags              = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.tcp_flags, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.tcp_flags, null)
        profile_tcam_format_access_list_ipv4_ttl_match              = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.ttl_match, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.ttl_match, null)
        profile_tcam_format_access_list_ipv4_udf1                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.udf1, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.udf1, null)
        profile_tcam_format_access_list_ipv4_udf2                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.udf2, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.udf2, null)
        profile_tcam_format_access_list_ipv4_udf3                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.udf3, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.udf3, null)
        profile_tcam_format_access_list_ipv4_udf4                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.udf4, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.udf4, null)
        profile_tcam_format_access_list_ipv4_udf5                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.udf5, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.udf5, null)
        profile_tcam_format_access_list_ipv4_udf6                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.udf6, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.udf6, null)
        profile_tcam_format_access_list_ipv4_udf7                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.udf7, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.udf7, null)
        profile_tcam_format_access_list_ipv4_udf8                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv4.udf8, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv4.udf8, null)
        profile_tcam_format_access_list_ipv6_dst_addr               = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.dst_addr, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.dst_addr, null)
        profile_tcam_format_access_list_ipv6_dst_object_group       = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.dst_object_group, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.dst_object_group, null)
        profile_tcam_format_access_list_ipv6_dst_port               = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.dst_port, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.dst_port, null)
        profile_tcam_format_access_list_ipv6_frag_bit               = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.frag_bit, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.frag_bit, null)
        profile_tcam_format_access_list_ipv6_next_hdr               = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.next_hdr, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.next_hdr, null)
        profile_tcam_format_access_list_ipv6_packet_len             = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.packet_len, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.packet_len, null)
        profile_tcam_format_access_list_ipv6_src_addr               = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.src_addr, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.src_addr, null)
        profile_tcam_format_access_list_ipv6_src_object_group       = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.src_object_group, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.src_object_group, null)
        profile_tcam_format_access_list_ipv6_tcp_flags              = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.tcp_flags, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.tcp_flags, null)
        profile_tcam_format_access_list_ipv6_traffic_class          = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.traffic_class, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.traffic_class, null)
        profile_tcam_format_access_list_ipv6_udf1                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.udf1, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.udf1, null)
        profile_tcam_format_access_list_ipv6_udf2                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.udf2, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.udf2, null)
        profile_tcam_format_access_list_ipv6_udf3                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.udf3, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.udf3, null)
        profile_tcam_format_access_list_ipv6_udf4                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.udf4, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.udf4, null)
        profile_tcam_format_access_list_ipv6_udf5                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.udf5, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.udf5, null)
        profile_tcam_format_access_list_ipv6_udf6                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.udf6, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.udf6, null)
        profile_tcam_format_access_list_ipv6_udf7                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.udf7, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.udf7, null)
        profile_tcam_format_access_list_ipv6_udf8                   = try(local.device_config[device.name].hw_module.profile_8000.tcam.format.access_list_ipv6.udf8, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.access_list_ipv6.udf8, null)
        profile_tcam_format_og_compr_id_extension_egress            = local.device_is_26x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.tcam.format.og_compr_id_extension.egress, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.og_compr_id_extension.egress, null) : null
        profile_tcam_format_og_compr_id_extension                   = (local.device_is_25x[device.name] && !local.device_is_26x[device.name]) ? try(local.device_config[device.name].hw_module.profile_8000.tcam.format.og_compr_id_extension.enable, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.og_compr_id_extension.enable, null) : null
        profile_tcam_format_og_compr_id_extension_ingress           = local.device_is_26x[device.name] ? try(local.device_config[device.name].hw_module.profile_8000.tcam.format.og_compr_id_extension.ingress, local.defaults.iosxr.devices.configuration.hw_module.profile_8000.tcam.format.og_compr_id_extension.ingress, null) : null
      }
    ] if try(local.device_config[device.name].hw_module.profile_8000, null) != null
  ])
}

resource "iosxr_hw_module_profile_8000" "hw_module_profile_8000" {
  for_each                                                    = { for v in local.hw_module_profile_8000 : v.key => v }
  device                                                      = each.value.device_name
  profile_bw_threshold                                        = each.value.profile_bw_threshold
  profile_cef_bgplu                                           = each.value.profile_cef_bgplu
  profile_cef_bgplu_over_rsvpte                               = each.value.profile_cef_bgplu_over_rsvpte
  profile_cef_cbf                                             = each.value.profile_cef_cbf
  profile_cef_cbf_forward_class_list                          = each.value.profile_cef_cbf_forward_class_list
  profile_cef_dark_bw                                         = each.value.profile_cef_dark_bw
  profile_cef_hash_ip_field_duplication                       = each.value.profile_cef_hash_ip_field_duplication
  profile_cef_ip_redirect                                     = each.value.profile_cef_ip_redirect
  profile_cef_iptunnel_scale                                  = each.value.profile_cef_iptunnel_scale
  profile_cef_ipv6_hop_limit                                  = each.value.profile_cef_ipv6_hop_limit
  profile_cef_lpts_acl                                        = each.value.profile_cef_lpts_acl
  profile_cef_lpts_pifib_entry_counters                       = each.value.profile_cef_lpts_pifib_entry_counters
  profile_cef_mplsoudp_scale                                  = each.value.profile_cef_mplsoudp_scale
  profile_cef_source_rtbh_enable                              = each.value.profile_cef_source_rtbh_enable
  profile_cef_sropt                                           = each.value.profile_cef_sropt
  profile_cef_stats_label_app_default                         = each.value.profile_cef_stats_label_app_default
  profile_cef_te_tunnel_highscale_ldp_over_te_no_sr_over_srte = each.value.profile_cef_te_tunnel_highscale_ldp_over_te_no_sr_over_srte
  profile_cef_te_tunnel_highscale_no_ldp_over_te              = each.value.profile_cef_te_tunnel_highscale_no_ldp_over_te
  profile_cef_te_tunnel_label_over_te_counters                = each.value.profile_cef_te_tunnel_label_over_te_counters
  profile_cef_ttl_tunnel_ip_decrement                         = each.value.profile_cef_ttl_tunnel_ip_decrement
  profile_cef_unipath_surpf_enable                            = each.value.profile_cef_unipath_surpf_enable
  profile_cef_vxlan_ipv6_tnl_scale                            = each.value.profile_cef_vxlan_ipv6_tnl_scale
  profile_encap_exact_interfaces                              = each.value.profile_encap_exact_interfaces
  profile_encap_exact_locations                               = each.value.profile_encap_exact_locations
  profile_encap_exact_locations_all                           = each.value.profile_encap_exact_locations_all
  profile_encap_exact_locations_all_virtual                   = each.value.profile_encap_exact_locations_all_virtual
  profile_flowspec_ipv6_packet_len_enable                     = each.value.profile_flowspec_ipv6_packet_len_enable
  profile_gue_udp_dest_port_ipv4                              = each.value.profile_gue_udp_dest_port_ipv4
  profile_gue_udp_dest_port_ipv6                              = each.value.profile_gue_udp_dest_port_ipv6
  profile_gue_udp_dest_port_mpls                              = each.value.profile_gue_udp_dest_port_mpls
  profile_irb_throughput_optimized                            = each.value.profile_irb_throughput_optimized
  profile_l2fib_bridge_flush_convergence                      = each.value.profile_l2fib_bridge_flush_convergence
  profile_l2fib_evpn_aging                                    = each.value.profile_l2fib_evpn_aging
  profile_l2fib_higher_scale                                  = each.value.profile_l2fib_higher_scale
  profile_l2fib_pw_stats                                      = each.value.profile_l2fib_pw_stats
  profile_l2fib_vxlan_dc_leaf                                 = each.value.profile_l2fib_vxlan_dc_leaf
  multicast_route_scale                                       = each.value.multicast_route_scale
  profile_npu_buffer_extended_locations                       = each.value.profile_npu_buffer_extended_locations
  profile_npu_compatibility                                   = each.value.profile_npu_compatibility
  profile_priority_flow_control_locations                     = each.value.profile_priority_flow_control_locations
  profile_qos_high_water_marks                                = each.value.profile_qos_high_water_marks
  profile_qos_intra_npu_over_fabric                           = each.value.profile_qos_intra_npu_over_fabric
  profile_qos_l2_mode                                         = each.value.profile_qos_l2_mode
  profile_qos_low_latency_mode                                = each.value.profile_qos_low_latency_mode
  profile_qos_mode                                            = each.value.profile_qos_mode
  profile_qos_qos_stats_push_collection                       = each.value.profile_qos_qos_stats_push_collection
  profile_qos_voq_mode_four                                   = each.value.profile_qos_voq_mode_four
  profile_qos_voq_mode_eight                                  = each.value.profile_qos_voq_mode_eight
  profile_qos_voq_mode_fair_four                              = each.value.profile_qos_voq_mode_fair_four
  profile_qos_voq_mode_fair_eight                             = each.value.profile_qos_voq_mode_fair_eight
  profile_route_scale_host_route                              = each.value.profile_route_scale_host_route
  profile_route_scale_ipv6_unicast_connected_prefix_high      = each.value.profile_route_scale_ipv6_unicast_connected_prefix_high
  profile_route_scale_lpm_full_scale                          = each.value.profile_route_scale_lpm_full_scale
  profile_stats_acl_permit                                    = each.value.profile_stats_acl_permit
  profile_stats_no_bvi_ingress                                = each.value.profile_stats_no_bvi_ingress
  profile_stats_voqs_sharing_counters                         = each.value.profile_stats_voqs_sharing_counters
  profile_tcam_fib_ipv4_unicast_percent                       = each.value.profile_tcam_fib_ipv4_unicast_percent
  profile_tcam_fib_ipv6_unicast_percent                       = each.value.profile_tcam_fib_ipv6_unicast_percent
  profile_tcam_format_access_list_ipv4_dst_addr               = each.value.profile_tcam_format_access_list_ipv4_dst_addr
  profile_tcam_format_access_list_ipv4_dst_object_group       = each.value.profile_tcam_format_access_list_ipv4_dst_object_group
  profile_tcam_format_access_list_ipv4_dst_port               = each.value.profile_tcam_format_access_list_ipv4_dst_port
  profile_tcam_format_access_list_ipv4_frag_bit               = each.value.profile_tcam_format_access_list_ipv4_frag_bit
  profile_tcam_format_access_list_ipv4_fragment_offset        = each.value.profile_tcam_format_access_list_ipv4_fragment_offset
  profile_tcam_format_access_list_ipv4_packet_len             = each.value.profile_tcam_format_access_list_ipv4_packet_len
  profile_tcam_format_access_list_ipv4_precedence             = each.value.profile_tcam_format_access_list_ipv4_precedence
  profile_tcam_format_access_list_ipv4_proto                  = each.value.profile_tcam_format_access_list_ipv4_proto
  profile_tcam_format_access_list_ipv4_src_addr               = each.value.profile_tcam_format_access_list_ipv4_src_addr
  profile_tcam_format_access_list_ipv4_src_object_group       = each.value.profile_tcam_format_access_list_ipv4_src_object_group
  profile_tcam_format_access_list_ipv4_src_port               = each.value.profile_tcam_format_access_list_ipv4_src_port
  profile_tcam_format_access_list_ipv4_tcp_flags              = each.value.profile_tcam_format_access_list_ipv4_tcp_flags
  profile_tcam_format_access_list_ipv4_ttl_match              = each.value.profile_tcam_format_access_list_ipv4_ttl_match
  profile_tcam_format_access_list_ipv4_udf1                   = each.value.profile_tcam_format_access_list_ipv4_udf1
  profile_tcam_format_access_list_ipv4_udf2                   = each.value.profile_tcam_format_access_list_ipv4_udf2
  profile_tcam_format_access_list_ipv4_udf3                   = each.value.profile_tcam_format_access_list_ipv4_udf3
  profile_tcam_format_access_list_ipv4_udf4                   = each.value.profile_tcam_format_access_list_ipv4_udf4
  profile_tcam_format_access_list_ipv4_udf5                   = each.value.profile_tcam_format_access_list_ipv4_udf5
  profile_tcam_format_access_list_ipv4_udf6                   = each.value.profile_tcam_format_access_list_ipv4_udf6
  profile_tcam_format_access_list_ipv4_udf7                   = each.value.profile_tcam_format_access_list_ipv4_udf7
  profile_tcam_format_access_list_ipv4_udf8                   = each.value.profile_tcam_format_access_list_ipv4_udf8
  profile_tcam_format_access_list_ipv6_dst_addr               = each.value.profile_tcam_format_access_list_ipv6_dst_addr
  profile_tcam_format_access_list_ipv6_dst_object_group       = each.value.profile_tcam_format_access_list_ipv6_dst_object_group
  profile_tcam_format_access_list_ipv6_dst_port               = each.value.profile_tcam_format_access_list_ipv6_dst_port
  profile_tcam_format_access_list_ipv6_frag_bit               = each.value.profile_tcam_format_access_list_ipv6_frag_bit
  profile_tcam_format_access_list_ipv6_next_hdr               = each.value.profile_tcam_format_access_list_ipv6_next_hdr
  profile_tcam_format_access_list_ipv6_packet_len             = each.value.profile_tcam_format_access_list_ipv6_packet_len
  profile_tcam_format_access_list_ipv6_src_addr               = each.value.profile_tcam_format_access_list_ipv6_src_addr
  profile_tcam_format_access_list_ipv6_src_object_group       = each.value.profile_tcam_format_access_list_ipv6_src_object_group
  profile_tcam_format_access_list_ipv6_tcp_flags              = each.value.profile_tcam_format_access_list_ipv6_tcp_flags
  profile_tcam_format_access_list_ipv6_traffic_class          = each.value.profile_tcam_format_access_list_ipv6_traffic_class
  profile_tcam_format_access_list_ipv6_udf1                   = each.value.profile_tcam_format_access_list_ipv6_udf1
  profile_tcam_format_access_list_ipv6_udf2                   = each.value.profile_tcam_format_access_list_ipv6_udf2
  profile_tcam_format_access_list_ipv6_udf3                   = each.value.profile_tcam_format_access_list_ipv6_udf3
  profile_tcam_format_access_list_ipv6_udf4                   = each.value.profile_tcam_format_access_list_ipv6_udf4
  profile_tcam_format_access_list_ipv6_udf5                   = each.value.profile_tcam_format_access_list_ipv6_udf5
  profile_tcam_format_access_list_ipv6_udf6                   = each.value.profile_tcam_format_access_list_ipv6_udf6
  profile_tcam_format_access_list_ipv6_udf7                   = each.value.profile_tcam_format_access_list_ipv6_udf7
  profile_tcam_format_access_list_ipv6_udf8                   = each.value.profile_tcam_format_access_list_ipv6_udf8
  profile_tcam_format_og_compr_id_extension_egress            = each.value.profile_tcam_format_og_compr_id_extension_egress
  profile_tcam_format_og_compr_id_extension                   = each.value.profile_tcam_format_og_compr_id_extension
  profile_tcam_format_og_compr_id_extension_ingress           = each.value.profile_tcam_format_og_compr_id_extension_ingress
}

##### HW Module Shutdown #####

locals {
  hw_module_shutdown_locations = flatten([
    for device in local.devices : [
      for location in try(local.device_config[device.name].hw_module.shutdown.locations, []) : {
        key           = format("%s/%s", device.name, location)
        device_name   = device.name
        location_name = location
      }
    ]
  ])
}

resource "iosxr_hw_module_shutdown" "hw_module_shutdown" {
  for_each      = { for v in local.hw_module_shutdown_locations : v.key => v }
  device        = each.value.device_name
  location_name = each.value.location_name
  shut          = true
}
