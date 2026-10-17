##### Router PIM IPv4 #####

locals {
  router_pim_ipv4 = { for device in local.devices : device.name => {
    accept_register                                = try(local.device_config[device.name].router_pim.address_family_ipv4.accept_register, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.accept_register, null)
    allow_rp                                       = try(local.device_config[device.name].router_pim.address_family_ipv4.allow_rp, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.allow_rp, null)
    allow_rp_group_list                            = try(local.device_config[device.name].router_pim.address_family_ipv4.allow_rp_group_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.allow_rp_group_list, null)
    allow_rp_list                                  = try(local.device_config[device.name].router_pim.address_family_ipv4.allow_rp_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.allow_rp_list, null)
    auto_rp_listen_disable                         = try(local.device_config[device.name].router_pim.address_family_ipv4.auto_rp_listen_disable, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_listen_disable, null)
    auto_rp_mapping_agent_interface                = try(local.device_config[device.name].router_pim.address_family_ipv4.auto_rp_mapping_agent_interface, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_mapping_agent_interface, null)
    auto_rp_mapping_agent_interval                 = try(local.device_config[device.name].router_pim.address_family_ipv4.auto_rp_mapping_agent_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_mapping_agent_interval, null)
    auto_rp_mapping_agent_scope                    = try(local.device_config[device.name].router_pim.address_family_ipv4.auto_rp_mapping_agent_scope, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_mapping_agent_scope, null)
    bsr_candidate_bsr_address                      = try(local.device_config[device.name].router_pim.address_family_ipv4.bsr_candidate_bsr_address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.bsr_candidate_bsr_address, null)
    bsr_candidate_bsr_hash_mask_len                = try(local.device_config[device.name].router_pim.address_family_ipv4.bsr_candidate_bsr_hash_mask_len, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.bsr_candidate_bsr_hash_mask_len, null)
    bsr_candidate_bsr_priority                     = try(local.device_config[device.name].router_pim.address_family_ipv4.bsr_candidate_bsr_priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.bsr_candidate_bsr_priority, null)
    convergence_link_down_prune_delay              = try(local.device_config[device.name].router_pim.address_family_ipv4.convergence_link_down_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.convergence_link_down_prune_delay, null)
    convergence_rpf_conflict_join_delay            = try(local.device_config[device.name].router_pim.address_family_ipv4.convergence_rpf_conflict_join_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.convergence_rpf_conflict_join_delay, null)
    dr_priority                                    = try(local.device_config[device.name].router_pim.address_family_ipv4.dr_priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.dr_priority, null)
    global_maximum_bsr_crp_cache_maximum           = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_bsr_crp_cache_maximum, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_bsr_crp_cache_maximum, null)
    global_maximum_bsr_crp_cache_threshold         = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_bsr_crp_cache_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_bsr_crp_cache_threshold, null)
    global_maximum_group_mappings_autorp           = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_group_mappings_autorp, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_group_mappings_autorp, null)
    global_maximum_group_mappings_autorp_threshold = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_group_mappings_autorp_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_group_mappings_autorp_threshold, null)
    global_maximum_group_mappings_bsr              = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_group_mappings_bsr, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_group_mappings_bsr, null)
    global_maximum_group_mappings_bsr_threshold    = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_group_mappings_bsr_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_group_mappings_bsr_threshold, null)
    global_maximum_packet_queue_high_priority      = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_packet_queue_high_priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_packet_queue_high_priority, null)
    global_maximum_packet_queue_low_priority       = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_packet_queue_low_priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_packet_queue_low_priority, null)
    global_maximum_register_states                 = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_register_states, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_register_states, null)
    global_maximum_register_states_threshold       = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_register_states_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_register_states_threshold, null)
    global_maximum_route_interfaces                = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_route_interfaces, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_route_interfaces, null)
    global_maximum_route_interfaces_threshold      = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_route_interfaces_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_route_interfaces_threshold, null)
    global_maximum_routes                          = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_routes, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_routes, null)
    global_maximum_routes_threshold                = try(local.device_config[device.name].router_pim.address_family_ipv4.global_maximum_routes_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.global_maximum_routes_threshold, null)
    hello_interval                                 = try(local.device_config[device.name].router_pim.address_family_ipv4.hello_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.hello_interval, null)
    join_prune_interval                            = try(local.device_config[device.name].router_pim.address_family_ipv4.join_prune_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.join_prune_interval, null)
    join_prune_mtu                                 = try(local.device_config[device.name].router_pim.address_family_ipv4.join_prune_mtu, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.join_prune_mtu, null)
    log_neighbor_changes                           = try(local.device_config[device.name].router_pim.address_family_ipv4.log_neighbor_changes, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.log_neighbor_changes, null)
    maximum_bsr_crp_cache_maximum                  = try(local.device_config[device.name].router_pim.address_family_ipv4.maximum_bsr_crp_cache_maximum, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.maximum_bsr_crp_cache_maximum, null)
    maximum_bsr_crp_cache_threshold                = try(local.device_config[device.name].router_pim.address_family_ipv4.maximum_bsr_crp_cache_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.maximum_bsr_crp_cache_threshold, null)
    maximum_group_mappings_autorp                  = try(local.device_config[device.name].router_pim.address_family_ipv4.maximum_group_mappings_autorp, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.maximum_group_mappings_autorp, null)
    maximum_group_mappings_autorp_threshold        = try(local.device_config[device.name].router_pim.address_family_ipv4.maximum_group_mappings_autorp_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.maximum_group_mappings_autorp_threshold, null)
    maximum_group_mappings_bsr                     = try(local.device_config[device.name].router_pim.address_family_ipv4.maximum_group_mappings_bsr, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.maximum_group_mappings_bsr, null)
    maximum_group_mappings_bsr_threshold           = try(local.device_config[device.name].router_pim.address_family_ipv4.maximum_group_mappings_bsr_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.maximum_group_mappings_bsr_threshold, null)
    maximum_register_states                        = try(local.device_config[device.name].router_pim.address_family_ipv4.maximum_register_states, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.maximum_register_states, null)
    maximum_register_states_threshold              = try(local.device_config[device.name].router_pim.address_family_ipv4.maximum_register_states_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.maximum_register_states_threshold, null)
    maximum_route_interfaces                       = try(local.device_config[device.name].router_pim.address_family_ipv4.maximum_route_interfaces, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.maximum_route_interfaces, null)
    maximum_route_interfaces_threshold             = try(local.device_config[device.name].router_pim.address_family_ipv4.maximum_route_interfaces_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.maximum_route_interfaces_threshold, null)
    maximum_routes                                 = try(local.device_config[device.name].router_pim.address_family_ipv4.maximum_routes, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.maximum_routes, null)
    maximum_routes_threshold                       = try(local.device_config[device.name].router_pim.address_family_ipv4.maximum_routes_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.maximum_routes_threshold, null)
    mdt_c_multicast_announce_pim_join_tlv          = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.announce_pim_join_tlv, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.announce_pim_join_tlv, local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.announce_pim_join_tlv, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.announce_pim_join_tlv, null)
    mdt_c_multicast_hello_enable                   = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.hello_enable, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.hello_enable, null)
    mdt_c_multicast_migration_route_policy         = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.migration_route_policy, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.migration_route_policy, local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.migration_route_policy, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.migration_route_policy, null)
    mdt_c_multicast_shared_tree_prune              = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.shared_tree_prune, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.shared_tree_prune, local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.shared_tree_prune, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.shared_tree_prune, null)
    mdt_c_multicast_shared_tree_prune_delay        = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.shared_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.shared_tree_prune_delay, local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.shared_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.shared_tree_prune_delay, null)
    mdt_c_multicast_source_tree_prune_delay        = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.source_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.source_tree_prune_delay, local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.source_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.source_tree_prune_delay, null)
    mdt_c_multicast_suppress_pim_data_signaling    = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.suppress_pim_data_signaling, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.suppress_pim_data_signaling, local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.suppress_pim_data_signaling, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.suppress_pim_data_signaling, null)
    mdt_c_multicast_suppress_shared_tree_join      = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.suppress_shared_tree_join, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_pim.suppress_shared_tree_join, local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.suppress_shared_tree_join, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp.suppress_shared_tree_join, null)
    mdt_c_multicast_type                           = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_pim, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_pim, null) != null ? "pim" : try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_c_multicast_routing_bgp, null) != null ? "bgp" : null
    mdt_data_announce_interval                     = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_data_announce_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_data_announce_interval, null)
    mdt_data_switchover_interval                   = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_data_switchover_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_data_switchover_interval, null)
    mdt_hello_interval                             = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_hello_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_hello_interval, null)
    mdt_neighbor_filter                            = try(local.device_config[device.name].router_pim.address_family_ipv4.mdt_neighbor_filter, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mdt_neighbor_filter, null)
    mofrr                                          = try(local.device_config[device.name].router_pim.address_family_ipv4.mofrr, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr, null)
    mofrr_flow                                     = try(local.device_config[device.name].router_pim.address_family_ipv4.mofrr_flow, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_flow, null)
    mofrr_non_revertive                            = try(local.device_config[device.name].router_pim.address_family_ipv4.mofrr_non_revertive, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_non_revertive, null)
    mofrr_protect                                  = try(local.device_config[device.name].router_pim.address_family_ipv4.mofrr_protect, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_protect, null)
    mofrr_protect_local_fault_only                 = try(local.device_config[device.name].router_pim.address_family_ipv4.mofrr_protect_local_fault_only, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_protect_local_fault_only, null)
    mofrr_rib                                      = try(local.device_config[device.name].router_pim.address_family_ipv4.mofrr_rib, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_rib, null)
    multipath                                      = try(local.device_config[device.name].router_pim.address_family_ipv4.multipath, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.multipath, null)
    multipath_hash_source                          = try(local.device_config[device.name].router_pim.address_family_ipv4.multipath_hash_source, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.multipath_hash_source, null)
    multipath_hash_source_group                    = try(local.device_config[device.name].router_pim.address_family_ipv4.multipath_hash_source_group, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.multipath_hash_source_group, null)
    multipath_hash_source_nexthop                  = try(local.device_config[device.name].router_pim.address_family_ipv4.multipath_hash_source_nexthop, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.multipath_hash_source_nexthop, null)
    neighbor_check_on_recv                         = try(local.device_config[device.name].router_pim.address_family_ipv4.neighbor_check_on_recv, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.neighbor_check_on_recv, null)
    neighbor_check_on_send                         = try(local.device_config[device.name].router_pim.address_family_ipv4.neighbor_check_on_send, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.neighbor_check_on_send, null)
    neighbor_filter                                = try(local.device_config[device.name].router_pim.address_family_ipv4.neighbor_filter, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.neighbor_filter, null)
    nsf_lifetime                                   = try(local.device_config[device.name].router_pim.address_family_ipv4.nsf_lifetime, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.nsf_lifetime, null)
    old_register_checksum                          = try(local.device_config[device.name].router_pim.address_family_ipv4.old_register_checksum, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.old_register_checksum, null)
    override_interval                              = try(local.device_config[device.name].router_pim.address_family_ipv4.override_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.override_interval, null)
    propagation_delay                              = try(local.device_config[device.name].router_pim.address_family_ipv4.propagation_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.propagation_delay, null)
    register_source                                = try(local.device_config[device.name].router_pim.address_family_ipv4.register_source, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.register_source, null)
    rp_static_deny                                 = try(local.device_config[device.name].router_pim.address_family_ipv4.rp_static_deny, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rp_static_deny, null)
    rpf_redirect_route_policy                      = try(local.device_config[device.name].router_pim.address_family_ipv4.rpf_redirect_route_policy, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rpf_redirect_route_policy, null)
    rpf_topology_route_policy                      = try(local.device_config[device.name].router_pim.address_family_ipv4.rpf_topology_route_policy, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rpf_topology_route_policy, null)
    rpf_vector_allow_ebgp                          = try(local.device_config[device.name].router_pim.address_family_ipv4.rpf_vector_allow_ebgp, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rpf_vector_allow_ebgp, null)
    rpf_vector_disable_ibgp                        = try(local.device_config[device.name].router_pim.address_family_ipv4.rpf_vector_disable_ibgp, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rpf_vector_disable_ibgp, null)
    rpf_vector_standard_encoding                   = try(local.device_config[device.name].router_pim.address_family_ipv4.rpf_vector_standard_encoding, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rpf_vector_standard_encoding, null)
    sg_expiry_timer                                = try(local.device_config[device.name].router_pim.address_family_ipv4.sg_expiry_timer, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sg_expiry_timer, null)
    sg_list                                        = try(local.device_config[device.name].router_pim.address_family_ipv4.sg_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sg_list, null)
    spt_threshold_infinity                         = try(local.device_config[device.name].router_pim.address_family_ipv4.spt_threshold_infinity, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.spt_threshold_infinity, null)
    spt_threshold_infinity_group_list              = try(local.device_config[device.name].router_pim.address_family_ipv4.spt_threshold_infinity_group_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.spt_threshold_infinity_group_list, null)
    ssm_allow_override                             = try(local.device_config[device.name].router_pim.address_family_ipv4.ssm_allow_override, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.ssm_allow_override, null)
    ssm_disable                                    = try(local.device_config[device.name].router_pim.address_family_ipv4.ssm_disable, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.ssm_disable, null)
    ssm_range                                      = try(local.device_config[device.name].router_pim.address_family_ipv4.ssm_range, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.ssm_range, null)
    suppress_data_registers                        = try(local.device_config[device.name].router_pim.address_family_ipv4.suppress_data_registers, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.suppress_data_registers, null)
    suppress_rpf_change_prunes                     = try(local.device_config[device.name].router_pim.address_family_ipv4.suppress_rpf_change_prunes, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.suppress_rpf_change_prunes, null)
    auto_rp_candidate_rps = try(length(local.device_config[device.name].router_pim.address_family_ipv4.auto_rp_candidate_rps) == 0, true) ? null : [for crp in local.device_config[device.name].router_pim.address_family_ipv4.auto_rp_candidate_rps : {
      bidir_group_list = try(crp.bidir_group_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_candidate_rps.bidir_group_list, null)
      bidir_interval   = try(crp.bidir_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_candidate_rps.bidir_interval, null)
      bidir_scope      = try(crp.bidir_scope, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_candidate_rps.bidir_scope, null)
      group_list       = try(crp.group_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_candidate_rps.group_list, null)
      interface_name   = try(crp.interface, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_candidate_rps.interface, null)
      interval         = try(crp.interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_candidate_rps.interval, null)
      scope            = try(crp.scope, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_candidate_rps.scope, null)
    }]
    auto_rp_relay_vrfs = try(length(local.device_config[device.name].router_pim.address_family_ipv4.auto_rp_relay_vrfs) == 0, true) ? null : [for relay in local.device_config[device.name].router_pim.address_family_ipv4.auto_rp_relay_vrfs : {
      listen   = try(relay.listen, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_relay_vrfs.listen, null)
      vrf_name = try(relay.vrf, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.auto_rp_relay_vrfs.vrf, null)
    }]
    bsr_candidate_rps = try(length(local.device_config[device.name].router_pim.address_family_ipv4.bsr_candidate_rps) == 0, true) ? null : [for crp in local.device_config[device.name].router_pim.address_family_ipv4.bsr_candidate_rps : {
      address          = try(crp.address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.bsr_candidate_rps.address, null)
      bidir_group_list = try(crp.bidir_group_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.bsr_candidate_rps.bidir_group_list, null)
      bidir_interval   = try(crp.bidir_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.bsr_candidate_rps.bidir_interval, null)
      bidir_priority   = try(crp.bidir_priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.bsr_candidate_rps.bidir_priority, null)
      group_list       = try(crp.group_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.bsr_candidate_rps.group_list, null)
      interval         = try(crp.interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.bsr_candidate_rps.interval, null)
      priority         = try(crp.priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.bsr_candidate_rps.priority, null)
    }]
    bsr_relay_vrfs = try(length(local.device_config[device.name].router_pim.address_family_ipv4.bsr_relay_vrfs) == 0, true) ? null : [for relay in local.device_config[device.name].router_pim.address_family_ipv4.bsr_relay_vrfs : {
      listen   = try(relay.listen, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.bsr_relay_vrfs.listen, null)
      vrf_name = try(relay.vrf, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.bsr_relay_vrfs.vrf, null)
    }]
    explicit_rpf_vector_injects = try(length(local.device_config[device.name].router_pim.address_family_ipv4.explicit_rpf_vector_injects) == 0, true) ? null : [for inject in local.device_config[device.name].router_pim.address_family_ipv4.explicit_rpf_vector_injects : {
      rpf_vectors    = try(inject.rpf_vectors, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.explicit_rpf_vector_injects.rpf_vectors, null)
      source_address = try(inject.source_address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.explicit_rpf_vector_injects.source_address, null)
      source_mask    = try(inject.source_mask, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.explicit_rpf_vector_injects.source_mask, null)
    }]
    interfaces = try(length(local.device_config[device.name].router_pim.address_family_ipv4.interfaces) == 0, true) ? null : [for intf in local.device_config[device.name].router_pim.address_family_ipv4.interfaces : {
      bfd_fast_detect                      = try(intf.bfd_fast_detect, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.bfd_fast_detect, null)
      bfd_minimum_interval                 = try(intf.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.bfd_minimum_interval, null)
      bfd_multiplier                       = try(intf.bfd_multiplier, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.bfd_multiplier, null)
      bsr_border                           = try(intf.bsr_border, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.bsr_border, null)
      disable                              = try(intf.disable, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.disable, null)
      dr_priority                          = try(intf.dr_priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.dr_priority, null)
      enable                               = try(intf.enable, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.enable, null)
      hello_interval                       = try(intf.hello_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.hello_interval, null)
      interface_name                       = try(intf.name, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.name, null)
      join_prune_interval                  = try(intf.join_prune_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.join_prune_interval, null)
      join_prune_mtu                       = try(intf.join_prune_mtu, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.join_prune_mtu, null)
      maximum_route_interfaces             = try(intf.maximum_route_interfaces, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.maximum_route_interfaces, null)
      maximum_route_interfaces_access_list = try(intf.maximum_route_interfaces_access_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.maximum_route_interfaces_access_list, null)
      maximum_route_interfaces_threshold   = try(intf.maximum_route_interfaces_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.maximum_route_interfaces_threshold, null)
      neighbor_filter                      = try(intf.neighbor_filter, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.neighbor_filter, null)
      override_interval                    = try(intf.override_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.override_interval, null)
      propagation_delay                    = try(intf.propagation_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.interfaces.propagation_delay, null)
    }]
    mofrr_clone_joins = try(length(local.device_config[device.name].router_pim.address_family_ipv4.mofrr_clone_joins) == 0, true) ? null : [for join in local.device_config[device.name].router_pim.address_family_ipv4.mofrr_clone_joins : {
      source_address = try(join.source_address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_clone_joins.source_address, null)
      to = try(length(join.to) == 0, true) ? null : [for to in join.to : {
        primary_address = try(to.primary_address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_clone_joins.to.primary_address, null)
        and = try(length(to.and) == 0, true) ? null : [for backup in to.and : {
          backup_address = try(backup.backup_address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_clone_joins.to.and.backup_address, null)
          masklen = try(length(backup.masklen) == 0, true) ? null : [for ml in backup.masklen : {
            mask_length = try(ml.mask_length, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_clone_joins.to.and.masklen.mask_length, null)
          }]
        }]
      }]
    }]
    mofrr_clone_sources = try(length(local.device_config[device.name].router_pim.address_family_ipv4.mofrr_clone_sources) == 0, true) ? null : [for source in local.device_config[device.name].router_pim.address_family_ipv4.mofrr_clone_sources : {
      source_address = try(source.source_address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_clone_sources.source_address, null)
      to = try(length(source.to) == 0, true) ? null : [for to in source.to : {
        primary_address = try(to.primary_address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_clone_sources.to.primary_address, null)
        and = try(length(to.and) == 0, true) ? null : [for backup in to.and : {
          backup_address = try(backup.backup_address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_clone_sources.to.and.backup_address, null)
          masklen = try(length(backup.masklen) == 0, true) ? null : [for ml in backup.masklen : {
            mask_length = try(ml.mask_length, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.mofrr_clone_sources.to.and.masklen.mask_length, null)
          }]
        }]
      }]
    }]
    rp_addresses = try(length(local.device_config[device.name].router_pim.address_family_ipv4.rp_addresses) == 0, true) ? null : [for rp in local.device_config[device.name].router_pim.address_family_ipv4.rp_addresses : {
      access_list = try(rp.access_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rp_addresses.access_list, null)
      address     = try(rp.address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rp_addresses.address, null)
      override    = try(rp.override, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rp_addresses.override, null)
    }]
    rp_addresses_bidir = try(length(local.device_config[device.name].router_pim.address_family_ipv4.rp_addresses_bidir) == 0, true) ? null : [for rp in local.device_config[device.name].router_pim.address_family_ipv4.rp_addresses_bidir : {
      access_list = try(rp.access_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rp_addresses_bidir.access_list, null)
      address     = try(rp.address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rp_addresses_bidir.address, null)
      override    = try(rp.override, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rp_addresses_bidir.override, null)
    }]
    rpf_vector_injects = try(length(local.device_config[device.name].router_pim.address_family_ipv4.rpf_vector_injects) == 0, true) ? null : [for inject in local.device_config[device.name].router_pim.address_family_ipv4.rpf_vector_injects : {
      rpf_vectors    = try(inject.rpf_vectors, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rpf_vector_injects.rpf_vectors, null)
      source_address = try(inject.source_address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rpf_vector_injects.source_address, null)
      source_mask    = try(inject.source_mask, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.rpf_vector_injects.source_mask, null)
    }]
    sr_p2mp_policies = try(length(local.device_config[device.name].router_pim.address_family_ipv4.sr_p2mp_policies) == 0, true) ? null : [for policy in local.device_config[device.name].router_pim.address_family_ipv4.sr_p2mp_policies : {
      policy_name = try(policy.policy_name, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.policy_name, null)
      static_groups = try(length(policy.static_groups) == 0, true) ? null : [for sg in policy.static_groups : {
        group_address      = try(sg.group_address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.group_address, null)
        group_address_only = try(sg.group_address_only, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.group_address_only, null)
        group_masks = try(length(sg.group_masks) == 0, true) ? null : [for gm in sg.group_masks : {
          group_count    = try(gm.group_count, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.group_masks.group_count, null)
          group_inc_mask = try(gm.group_inc_mask, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.group_masks.group_inc_mask, null)
        }]
        group_masks_source_addresses = try(length(sg.group_masks_source_addresses) == 0, true) ? null : [for gs in sg.group_masks_source_addresses : {
          group_count    = try(gs.group_count, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.group_masks_source_addresses.group_count, null)
          group_inc_mask = try(gs.group_inc_mask, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.group_masks_source_addresses.group_inc_mask, null)
          source_ip      = try(gs.source_ip, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.group_masks_source_addresses.source_ip, null)
        }]
        group_masks_source_masks = try(length(sg.group_masks_source_masks) == 0, true) ? null : [for gsm in sg.group_masks_source_masks : {
          group_count     = try(gsm.group_count, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.group_masks_source_masks.group_count, null)
          group_inc_mask  = try(gsm.group_inc_mask, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.group_masks_source_masks.group_inc_mask, null)
          source_count    = try(gsm.source_count, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.group_masks_source_masks.source_count, null)
          source_inc_mask = try(gsm.source_inc_mask, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.group_masks_source_masks.source_inc_mask, null)
          source_ip       = try(gsm.source_ip, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.group_masks_source_masks.source_ip, null)
        }]
        source_masks = try(length(sg.source_masks) == 0, true) ? null : [for sm in sg.source_masks : {
          source_count    = try(sm.source_count, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.source_masks.source_count, null)
          source_inc_mask = try(sm.source_inc_mask, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.source_masks.source_inc_mask, null)
          source_ip       = try(sm.source_ip, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4.sr_p2mp_policies.static_groups.source_masks.source_ip, null)
        }]
      }]
    }]
  } if try(local.device_config[device.name].router_pim.address_family_ipv4, null) != null || try(local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv4, null) != null }
}

resource "iosxr_router_pim_ipv4" "router_pim_ipv4" {
  for_each                                       = local.router_pim_ipv4
  device                                         = each.key
  accept_register                                = each.value.accept_register
  allow_rp                                       = each.value.allow_rp
  allow_rp_group_list                            = each.value.allow_rp_group_list
  allow_rp_list                                  = each.value.allow_rp_list
  auto_rp_candidate_rps                          = each.value.auto_rp_candidate_rps
  auto_rp_listen_disable                         = each.value.auto_rp_listen_disable
  auto_rp_mapping_agent_interface                = each.value.auto_rp_mapping_agent_interface
  auto_rp_mapping_agent_interval                 = each.value.auto_rp_mapping_agent_interval
  auto_rp_mapping_agent_scope                    = each.value.auto_rp_mapping_agent_scope
  auto_rp_relay_vrfs                             = each.value.auto_rp_relay_vrfs
  bsr_candidate_bsr_address                      = each.value.bsr_candidate_bsr_address
  bsr_candidate_bsr_hash_mask_len                = each.value.bsr_candidate_bsr_hash_mask_len
  bsr_candidate_bsr_priority                     = each.value.bsr_candidate_bsr_priority
  bsr_candidate_rps                              = each.value.bsr_candidate_rps
  bsr_relay_vrfs                                 = each.value.bsr_relay_vrfs
  convergence_link_down_prune_delay              = each.value.convergence_link_down_prune_delay
  convergence_rpf_conflict_join_delay            = each.value.convergence_rpf_conflict_join_delay
  dr_priority                                    = each.value.dr_priority
  explicit_rpf_vector_injects                    = each.value.explicit_rpf_vector_injects
  global_maximum_bsr_crp_cache_maximum           = each.value.global_maximum_bsr_crp_cache_maximum
  global_maximum_bsr_crp_cache_threshold         = each.value.global_maximum_bsr_crp_cache_threshold
  global_maximum_group_mappings_autorp           = each.value.global_maximum_group_mappings_autorp
  global_maximum_group_mappings_autorp_threshold = each.value.global_maximum_group_mappings_autorp_threshold
  global_maximum_group_mappings_bsr              = each.value.global_maximum_group_mappings_bsr
  global_maximum_group_mappings_bsr_threshold    = each.value.global_maximum_group_mappings_bsr_threshold
  global_maximum_packet_queue_high_priority      = each.value.global_maximum_packet_queue_high_priority
  global_maximum_packet_queue_low_priority       = each.value.global_maximum_packet_queue_low_priority
  global_maximum_register_states                 = each.value.global_maximum_register_states
  global_maximum_register_states_threshold       = each.value.global_maximum_register_states_threshold
  global_maximum_route_interfaces                = each.value.global_maximum_route_interfaces
  global_maximum_route_interfaces_threshold      = each.value.global_maximum_route_interfaces_threshold
  global_maximum_routes                          = each.value.global_maximum_routes
  global_maximum_routes_threshold                = each.value.global_maximum_routes_threshold
  hello_interval                                 = each.value.hello_interval
  interfaces                                     = each.value.interfaces
  join_prune_interval                            = each.value.join_prune_interval
  join_prune_mtu                                 = each.value.join_prune_mtu
  log_neighbor_changes                           = each.value.log_neighbor_changes
  maximum_bsr_crp_cache_maximum                  = each.value.maximum_bsr_crp_cache_maximum
  maximum_bsr_crp_cache_threshold                = each.value.maximum_bsr_crp_cache_threshold
  maximum_group_mappings_autorp                  = each.value.maximum_group_mappings_autorp
  maximum_group_mappings_autorp_threshold        = each.value.maximum_group_mappings_autorp_threshold
  maximum_group_mappings_bsr                     = each.value.maximum_group_mappings_bsr
  maximum_group_mappings_bsr_threshold           = each.value.maximum_group_mappings_bsr_threshold
  maximum_register_states                        = each.value.maximum_register_states
  maximum_register_states_threshold              = each.value.maximum_register_states_threshold
  maximum_route_interfaces                       = each.value.maximum_route_interfaces
  maximum_route_interfaces_threshold             = each.value.maximum_route_interfaces_threshold
  maximum_routes                                 = each.value.maximum_routes
  maximum_routes_threshold                       = each.value.maximum_routes_threshold
  mdt_data_announce_interval                     = each.value.mdt_data_announce_interval
  mdt_data_switchover_interval                   = each.value.mdt_data_switchover_interval
  mdt_hello_interval                             = each.value.mdt_hello_interval
  mdt_neighbor_filter                            = each.value.mdt_neighbor_filter
  mofrr                                          = each.value.mofrr
  mofrr_clone_joins                              = each.value.mofrr_clone_joins
  mofrr_clone_sources                            = each.value.mofrr_clone_sources
  mofrr_flow                                     = each.value.mofrr_flow
  mofrr_non_revertive                            = each.value.mofrr_non_revertive
  mofrr_protect                                  = each.value.mofrr_protect
  mofrr_protect_local_fault_only                 = each.value.mofrr_protect_local_fault_only
  mofrr_rib                                      = each.value.mofrr_rib
  multipath                                      = each.value.multipath
  multipath_hash_source                          = each.value.multipath_hash_source
  multipath_hash_source_group                    = each.value.multipath_hash_source_group
  multipath_hash_source_nexthop                  = each.value.multipath_hash_source_nexthop
  neighbor_check_on_recv                         = each.value.neighbor_check_on_recv
  neighbor_check_on_send                         = each.value.neighbor_check_on_send
  neighbor_filter                                = each.value.neighbor_filter
  nsf_lifetime                                   = each.value.nsf_lifetime
  old_register_checksum                          = each.value.old_register_checksum
  override_interval                              = each.value.override_interval
  propagation_delay                              = each.value.propagation_delay
  register_source                                = each.value.register_source
  rp_addresses                                   = each.value.rp_addresses
  rp_addresses_bidir                             = each.value.rp_addresses_bidir
  rp_static_deny                                 = each.value.rp_static_deny
  rpf_redirect_route_policy                      = each.value.rpf_redirect_route_policy
  rpf_topology_route_policy                      = each.value.rpf_topology_route_policy
  rpf_vector_allow_ebgp                          = each.value.rpf_vector_allow_ebgp
  rpf_vector_disable_ibgp                        = each.value.rpf_vector_disable_ibgp
  rpf_vector_injects                             = each.value.rpf_vector_injects
  rpf_vector_standard_encoding                   = each.value.rpf_vector_standard_encoding
  sg_expiry_timer                                = each.value.sg_expiry_timer
  sg_list                                        = each.value.sg_list
  spt_threshold_infinity                         = each.value.spt_threshold_infinity
  spt_threshold_infinity_group_list              = each.value.spt_threshold_infinity_group_list
  sr_p2mp_policies                               = each.value.sr_p2mp_policies
  ssm_allow_override                             = each.value.ssm_allow_override
  ssm_disable                                    = each.value.ssm_disable
  ssm_range                                      = each.value.ssm_range
  suppress_data_registers                        = each.value.suppress_data_registers
  suppress_rpf_change_prunes                     = each.value.suppress_rpf_change_prunes
  mdt_c_multicast_type                           = each.value.mdt_c_multicast_type
  mdt_c_multicast_announce_pim_join_tlv          = each.value.mdt_c_multicast_announce_pim_join_tlv
  mdt_c_multicast_hello_enable                   = each.value.mdt_c_multicast_hello_enable
  mdt_c_multicast_migration_route_policy         = each.value.mdt_c_multicast_migration_route_policy
  mdt_c_multicast_shared_tree_prune              = each.value.mdt_c_multicast_shared_tree_prune
  mdt_c_multicast_shared_tree_prune_delay        = each.value.mdt_c_multicast_shared_tree_prune_delay
  mdt_c_multicast_source_tree_prune_delay        = each.value.mdt_c_multicast_source_tree_prune_delay
  mdt_c_multicast_suppress_pim_data_signaling    = each.value.mdt_c_multicast_suppress_pim_data_signaling
  mdt_c_multicast_suppress_shared_tree_join      = each.value.mdt_c_multicast_suppress_shared_tree_join

  depends_on = [
    iosxr_vrf.vrf,
    iosxr_route_policy.route_policy,
    iosxr_ipv4_access_list.ipv4_access_list
  ]
}

##### Router PIM IPv6 #####

locals {
  router_pim_ipv6 = { for device in local.devices : device.name => {
    accept_register                             = try(local.device_config[device.name].router_pim.address_family_ipv6.accept_register, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.accept_register, null)
    allow_rp                                    = try(local.device_config[device.name].router_pim.address_family_ipv6.allow_rp, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.allow_rp, null)
    allow_rp_group_list                         = try(local.device_config[device.name].router_pim.address_family_ipv6.allow_rp_group_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.allow_rp_group_list, null)
    allow_rp_list                               = try(local.device_config[device.name].router_pim.address_family_ipv6.allow_rp_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.allow_rp_list, null)
    bsr_candidate_bsr_address                   = try(local.device_config[device.name].router_pim.address_family_ipv6.bsr_candidate_bsr_address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.bsr_candidate_bsr_address, null)
    bsr_candidate_bsr_hash_mask_len             = try(local.device_config[device.name].router_pim.address_family_ipv6.bsr_candidate_bsr_hash_mask_len, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.bsr_candidate_bsr_hash_mask_len, null)
    bsr_candidate_bsr_priority                  = try(local.device_config[device.name].router_pim.address_family_ipv6.bsr_candidate_bsr_priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.bsr_candidate_bsr_priority, null)
    convergence_link_down_prune_delay           = try(local.device_config[device.name].router_pim.address_family_ipv6.convergence_link_down_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.convergence_link_down_prune_delay, null)
    convergence_rpf_conflict_join_delay         = try(local.device_config[device.name].router_pim.address_family_ipv6.convergence_rpf_conflict_join_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.convergence_rpf_conflict_join_delay, null)
    dr_priority                                 = try(local.device_config[device.name].router_pim.address_family_ipv6.dr_priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.dr_priority, null)
    global_maximum_bsr_crp_cache_maximum        = try(local.device_config[device.name].router_pim.address_family_ipv6.global_maximum_bsr_crp_cache_maximum, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.global_maximum_bsr_crp_cache_maximum, null)
    global_maximum_bsr_crp_cache_threshold      = try(local.device_config[device.name].router_pim.address_family_ipv6.global_maximum_bsr_crp_cache_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.global_maximum_bsr_crp_cache_threshold, null)
    global_maximum_group_mappings_bsr           = try(local.device_config[device.name].router_pim.address_family_ipv6.global_maximum_group_mappings_bsr, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.global_maximum_group_mappings_bsr, null)
    global_maximum_group_mappings_bsr_threshold = try(local.device_config[device.name].router_pim.address_family_ipv6.global_maximum_group_mappings_bsr_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.global_maximum_group_mappings_bsr_threshold, null)
    global_maximum_packet_queue_high_priority   = try(local.device_config[device.name].router_pim.address_family_ipv6.global_maximum_packet_queue_high_priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.global_maximum_packet_queue_high_priority, null)
    global_maximum_packet_queue_low_priority    = try(local.device_config[device.name].router_pim.address_family_ipv6.global_maximum_packet_queue_low_priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.global_maximum_packet_queue_low_priority, null)
    global_maximum_register_states              = try(local.device_config[device.name].router_pim.address_family_ipv6.global_maximum_register_states, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.global_maximum_register_states, null)
    global_maximum_register_states_threshold    = try(local.device_config[device.name].router_pim.address_family_ipv6.global_maximum_register_states_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.global_maximum_register_states_threshold, null)
    global_maximum_route_interfaces             = try(local.device_config[device.name].router_pim.address_family_ipv6.global_maximum_route_interfaces, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.global_maximum_route_interfaces, null)
    global_maximum_route_interfaces_threshold   = try(local.device_config[device.name].router_pim.address_family_ipv6.global_maximum_route_interfaces_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.global_maximum_route_interfaces_threshold, null)
    global_maximum_routes                       = try(local.device_config[device.name].router_pim.address_family_ipv6.global_maximum_routes, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.global_maximum_routes, null)
    global_maximum_routes_threshold             = try(local.device_config[device.name].router_pim.address_family_ipv6.global_maximum_routes_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.global_maximum_routes_threshold, null)
    hello_interval                              = try(local.device_config[device.name].router_pim.address_family_ipv6.hello_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.hello_interval, null)
    join_prune_interval                         = try(local.device_config[device.name].router_pim.address_family_ipv6.join_prune_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.join_prune_interval, null)
    join_prune_mtu                              = try(local.device_config[device.name].router_pim.address_family_ipv6.join_prune_mtu, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.join_prune_mtu, null)
    log_neighbor_changes                        = try(local.device_config[device.name].router_pim.address_family_ipv6.log_neighbor_changes, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.log_neighbor_changes, null)
    maximum_bsr_crp_cache_maximum               = try(local.device_config[device.name].router_pim.address_family_ipv6.maximum_bsr_crp_cache_maximum, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.maximum_bsr_crp_cache_maximum, null)
    maximum_bsr_crp_cache_threshold             = try(local.device_config[device.name].router_pim.address_family_ipv6.maximum_bsr_crp_cache_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.maximum_bsr_crp_cache_threshold, null)
    maximum_group_mappings_bsr                  = try(local.device_config[device.name].router_pim.address_family_ipv6.maximum_group_mappings_bsr, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.maximum_group_mappings_bsr, null)
    maximum_group_mappings_bsr_threshold        = try(local.device_config[device.name].router_pim.address_family_ipv6.maximum_group_mappings_bsr_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.maximum_group_mappings_bsr_threshold, null)
    maximum_register_states                     = try(local.device_config[device.name].router_pim.address_family_ipv6.maximum_register_states, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.maximum_register_states, null)
    maximum_register_states_threshold           = try(local.device_config[device.name].router_pim.address_family_ipv6.maximum_register_states_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.maximum_register_states_threshold, null)
    maximum_route_interfaces                    = try(local.device_config[device.name].router_pim.address_family_ipv6.maximum_route_interfaces, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.maximum_route_interfaces, null)
    maximum_route_interfaces_threshold          = try(local.device_config[device.name].router_pim.address_family_ipv6.maximum_route_interfaces_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.maximum_route_interfaces_threshold, null)
    maximum_routes                              = try(local.device_config[device.name].router_pim.address_family_ipv6.maximum_routes, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.maximum_routes, null)
    maximum_routes_threshold                    = try(local.device_config[device.name].router_pim.address_family_ipv6.maximum_routes_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.maximum_routes_threshold, null)
    mdt_c_multicast_announce_pim_join_tlv       = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.announce_pim_join_tlv, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.announce_pim_join_tlv, local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.announce_pim_join_tlv, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.announce_pim_join_tlv, null)
    mdt_c_multicast_hello_enable                = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.hello_enable, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.hello_enable, null)
    mdt_c_multicast_migration_route_policy      = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.migration_route_policy, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.migration_route_policy, local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.migration_route_policy, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.migration_route_policy, null)
    mdt_c_multicast_shared_tree_prune           = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.shared_tree_prune, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.shared_tree_prune, local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.shared_tree_prune, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.shared_tree_prune, null)
    mdt_c_multicast_shared_tree_prune_delay     = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.shared_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.shared_tree_prune_delay, local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.shared_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.shared_tree_prune_delay, null)
    mdt_c_multicast_source_tree_prune_delay     = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.source_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.source_tree_prune_delay, local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.source_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.source_tree_prune_delay, null)
    mdt_c_multicast_suppress_pim_data_signaling = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.suppress_pim_data_signaling, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.suppress_pim_data_signaling, local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.suppress_pim_data_signaling, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.suppress_pim_data_signaling, null)
    mdt_c_multicast_suppress_shared_tree_join   = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.suppress_shared_tree_join, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_pim.suppress_shared_tree_join, local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.suppress_shared_tree_join, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp.suppress_shared_tree_join, null)
    mdt_c_multicast_type                        = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_pim, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_pim, null) != null ? "pim" : try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_c_multicast_routing_bgp, null) != null ? "bgp" : null
    mdt_data_announce_interval                  = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_data_announce_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_data_announce_interval, null)
    mdt_data_switchover_interval                = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_data_switchover_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_data_switchover_interval, null)
    mdt_hello_interval                          = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_hello_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_hello_interval, null)
    mdt_neighbor_filter                         = try(local.device_config[device.name].router_pim.address_family_ipv6.mdt_neighbor_filter, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.mdt_neighbor_filter, null)
    multipath                                   = try(local.device_config[device.name].router_pim.address_family_ipv6.multipath, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.multipath, null)
    multipath_hash_interface_extended           = try(local.device_config[device.name].router_pim.address_family_ipv6.multipath_hash_interface_extended, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.multipath_hash_interface_extended, null)
    multipath_hash_source_group                 = try(local.device_config[device.name].router_pim.address_family_ipv6.multipath_hash_source_group, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.multipath_hash_source_group, null)
    multipath_hash_source_nexthop               = try(local.device_config[device.name].router_pim.address_family_ipv6.multipath_hash_source_nexthop, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.multipath_hash_source_nexthop, null)
    neighbor_check_on_recv                      = try(local.device_config[device.name].router_pim.address_family_ipv6.neighbor_check_on_recv, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.neighbor_check_on_recv, null)
    neighbor_check_on_send                      = try(local.device_config[device.name].router_pim.address_family_ipv6.neighbor_check_on_send, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.neighbor_check_on_send, null)
    neighbor_filter                             = try(local.device_config[device.name].router_pim.address_family_ipv6.neighbor_filter, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.neighbor_filter, null)
    old_register_checksum                       = try(local.device_config[device.name].router_pim.address_family_ipv6.old_register_checksum, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.old_register_checksum, null)
    override_interval                           = try(local.device_config[device.name].router_pim.address_family_ipv6.override_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.override_interval, null)
    propagation_delay                           = try(local.device_config[device.name].router_pim.address_family_ipv6.propagation_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.propagation_delay, null)
    register_source                             = try(local.device_config[device.name].router_pim.address_family_ipv6.register_source, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.register_source, null)
    rp_static_deny                              = try(local.device_config[device.name].router_pim.address_family_ipv6.rp_static_deny, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.rp_static_deny, null)
    rpf_topology_route_policy                   = try(local.device_config[device.name].router_pim.address_family_ipv6.rpf_topology_route_policy, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.rpf_topology_route_policy, null)
    rpf_vector_allow_ebgp                       = try(local.device_config[device.name].router_pim.address_family_ipv6.rpf_vector_allow_ebgp, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.rpf_vector_allow_ebgp, null)
    rpf_vector_disable_ibgp                     = try(local.device_config[device.name].router_pim.address_family_ipv6.rpf_vector_disable_ibgp, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.rpf_vector_disable_ibgp, null)
    rpf_vector_standard_encoding                = try(local.device_config[device.name].router_pim.address_family_ipv6.rpf_vector_standard_encoding, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.rpf_vector_standard_encoding, null)
    sg_expiry_timer                             = try(local.device_config[device.name].router_pim.address_family_ipv6.sg_expiry_timer, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.sg_expiry_timer, null)
    sg_list                                     = try(local.device_config[device.name].router_pim.address_family_ipv6.sg_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.sg_list, null)
    spt_threshold_infinity                      = try(local.device_config[device.name].router_pim.address_family_ipv6.spt_threshold_infinity, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.spt_threshold_infinity, null)
    spt_threshold_infinity_group_list           = try(local.device_config[device.name].router_pim.address_family_ipv6.spt_threshold_infinity_group_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.spt_threshold_infinity_group_list, null)
    ssm_allow_override                          = try(local.device_config[device.name].router_pim.address_family_ipv6.ssm_allow_override, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.ssm_allow_override, null)
    ssm_disable                                 = try(local.device_config[device.name].router_pim.address_family_ipv6.ssm_disable, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.ssm_disable, null)
    ssm_range                                   = try(local.device_config[device.name].router_pim.address_family_ipv6.ssm_range, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.ssm_range, null)
    suppress_data_registers                     = try(local.device_config[device.name].router_pim.address_family_ipv6.suppress_data_registers, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.suppress_data_registers, null)
    suppress_rpf_change_prunes                  = try(local.device_config[device.name].router_pim.address_family_ipv6.suppress_rpf_change_prunes, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.suppress_rpf_change_prunes, null)
    bsr_candidate_rps = try(length(local.device_config[device.name].router_pim.address_family_ipv6.bsr_candidate_rps) == 0, true) ? null : [for crp in local.device_config[device.name].router_pim.address_family_ipv6.bsr_candidate_rps : {
      address          = try(crp.address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.bsr_candidate_rps.address, null)
      bidir_group_list = try(crp.bidir_group_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.bsr_candidate_rps.bidir_group_list, null)
      bidir_interval   = try(crp.bidir_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.bsr_candidate_rps.bidir_interval, null)
      bidir_priority   = try(crp.bidir_priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.bsr_candidate_rps.bidir_priority, null)
      group_list       = try(crp.group_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.bsr_candidate_rps.group_list, null)
      interval         = try(crp.interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.bsr_candidate_rps.interval, null)
      priority         = try(crp.priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.bsr_candidate_rps.priority, null)
    }]
    bsr_relay_vrfs = try(length(local.device_config[device.name].router_pim.address_family_ipv6.bsr_relay_vrfs) == 0, true) ? null : [for relay in local.device_config[device.name].router_pim.address_family_ipv6.bsr_relay_vrfs : {
      listen   = try(relay.listen, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.bsr_relay_vrfs.listen, null)
      vrf_name = try(relay.vrf, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.bsr_relay_vrfs.vrf, null)
    }]
    interfaces = try(length(local.device_config[device.name].router_pim.address_family_ipv6.interfaces) == 0, true) ? null : [for intf in local.device_config[device.name].router_pim.address_family_ipv6.interfaces : {
      bfd_fast_detect                      = try(intf.bfd_fast_detect, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.bfd_fast_detect, null)
      bfd_minimum_interval                 = try(intf.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.bfd_minimum_interval, null)
      bfd_multiplier                       = try(intf.bfd_multiplier, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.bfd_multiplier, null)
      bsr_border                           = try(intf.bsr_border, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.bsr_border, null)
      disable                              = try(intf.disable, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.disable, null)
      dr_priority                          = try(intf.dr_priority, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.dr_priority, null)
      enable                               = try(intf.enable, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.enable, null)
      hello_interval                       = try(intf.hello_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.hello_interval, null)
      interface_name                       = try(intf.name, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.name, null)
      join_prune_interval                  = try(intf.join_prune_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.join_prune_interval, null)
      join_prune_mtu                       = try(intf.join_prune_mtu, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.join_prune_mtu, null)
      maximum_route_interfaces             = try(intf.maximum_route_interfaces, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.maximum_route_interfaces, null)
      maximum_route_interfaces_access_list = try(intf.maximum_route_interfaces_access_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.maximum_route_interfaces_access_list, null)
      maximum_route_interfaces_threshold   = try(intf.maximum_route_interfaces_threshold, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.maximum_route_interfaces_threshold, null)
      neighbor_filter                      = try(intf.neighbor_filter, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.neighbor_filter, null)
      override_interval                    = try(intf.override_interval, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.override_interval, null)
      propagation_delay                    = try(intf.propagation_delay, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.interfaces.propagation_delay, null)
    }]
    rp_addresses = try(length(local.device_config[device.name].router_pim.address_family_ipv6.rp_addresses) == 0, true) ? null : [for rp in local.device_config[device.name].router_pim.address_family_ipv6.rp_addresses : {
      access_list = try(rp.access_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.rp_addresses.access_list, null)
      address     = try(rp.address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.rp_addresses.address, null)
      override    = try(rp.override, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.rp_addresses.override, null)
    }]
    rp_addresses_bidir = try(length(local.device_config[device.name].router_pim.address_family_ipv6.rp_addresses_bidir) == 0, true) ? null : [for rp in local.device_config[device.name].router_pim.address_family_ipv6.rp_addresses_bidir : {
      access_list = try(rp.access_list, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.rp_addresses_bidir.access_list, null)
      address     = try(rp.address, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.rp_addresses_bidir.address, null)
      override    = try(rp.override, local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6.rp_addresses_bidir.override, null)
    }]
  } if try(local.device_config[device.name].router_pim.address_family_ipv6, null) != null || try(local.defaults.iosxr.devices.configuration.router_pim.address_family_ipv6, null) != null }
}

resource "iosxr_router_pim_ipv6" "router_pim_ipv6" {
  for_each                                    = local.router_pim_ipv6
  device                                      = each.key
  accept_register                             = each.value.accept_register
  allow_rp                                    = each.value.allow_rp
  allow_rp_group_list                         = each.value.allow_rp_group_list
  allow_rp_list                               = each.value.allow_rp_list
  bsr_candidate_bsr_address                   = each.value.bsr_candidate_bsr_address
  bsr_candidate_bsr_hash_mask_len             = each.value.bsr_candidate_bsr_hash_mask_len
  bsr_candidate_bsr_priority                  = each.value.bsr_candidate_bsr_priority
  bsr_candidate_rps                           = each.value.bsr_candidate_rps
  bsr_relay_vrfs                              = each.value.bsr_relay_vrfs
  convergence_link_down_prune_delay           = each.value.convergence_link_down_prune_delay
  convergence_rpf_conflict_join_delay         = each.value.convergence_rpf_conflict_join_delay
  dr_priority                                 = each.value.dr_priority
  global_maximum_bsr_crp_cache_maximum        = each.value.global_maximum_bsr_crp_cache_maximum
  global_maximum_bsr_crp_cache_threshold      = each.value.global_maximum_bsr_crp_cache_threshold
  global_maximum_group_mappings_bsr           = each.value.global_maximum_group_mappings_bsr
  global_maximum_group_mappings_bsr_threshold = each.value.global_maximum_group_mappings_bsr_threshold
  global_maximum_packet_queue_high_priority   = each.value.global_maximum_packet_queue_high_priority
  global_maximum_packet_queue_low_priority    = each.value.global_maximum_packet_queue_low_priority
  global_maximum_register_states              = each.value.global_maximum_register_states
  global_maximum_register_states_threshold    = each.value.global_maximum_register_states_threshold
  global_maximum_route_interfaces             = each.value.global_maximum_route_interfaces
  global_maximum_route_interfaces_threshold   = each.value.global_maximum_route_interfaces_threshold
  global_maximum_routes                       = each.value.global_maximum_routes
  global_maximum_routes_threshold             = each.value.global_maximum_routes_threshold
  hello_interval                              = each.value.hello_interval
  interfaces                                  = each.value.interfaces
  join_prune_interval                         = each.value.join_prune_interval
  join_prune_mtu                              = each.value.join_prune_mtu
  log_neighbor_changes                        = each.value.log_neighbor_changes
  maximum_bsr_crp_cache_maximum               = each.value.maximum_bsr_crp_cache_maximum
  maximum_bsr_crp_cache_threshold             = each.value.maximum_bsr_crp_cache_threshold
  maximum_group_mappings_bsr                  = each.value.maximum_group_mappings_bsr
  maximum_group_mappings_bsr_threshold        = each.value.maximum_group_mappings_bsr_threshold
  maximum_register_states                     = each.value.maximum_register_states
  maximum_register_states_threshold           = each.value.maximum_register_states_threshold
  maximum_route_interfaces                    = each.value.maximum_route_interfaces
  maximum_route_interfaces_threshold          = each.value.maximum_route_interfaces_threshold
  maximum_routes                              = each.value.maximum_routes
  maximum_routes_threshold                    = each.value.maximum_routes_threshold
  mdt_data_announce_interval                  = each.value.mdt_data_announce_interval
  mdt_data_switchover_interval                = each.value.mdt_data_switchover_interval
  mdt_hello_interval                          = each.value.mdt_hello_interval
  mdt_neighbor_filter                         = each.value.mdt_neighbor_filter
  multipath                                   = each.value.multipath
  multipath_hash_interface_extended           = each.value.multipath_hash_interface_extended
  multipath_hash_source_group                 = each.value.multipath_hash_source_group
  multipath_hash_source_nexthop               = each.value.multipath_hash_source_nexthop
  neighbor_check_on_recv                      = each.value.neighbor_check_on_recv
  neighbor_check_on_send                      = each.value.neighbor_check_on_send
  neighbor_filter                             = each.value.neighbor_filter
  old_register_checksum                       = each.value.old_register_checksum
  override_interval                           = each.value.override_interval
  propagation_delay                           = each.value.propagation_delay
  register_source                             = each.value.register_source
  rp_addresses                                = each.value.rp_addresses
  rp_addresses_bidir                          = each.value.rp_addresses_bidir
  rp_static_deny                              = each.value.rp_static_deny
  rpf_topology_route_policy                   = each.value.rpf_topology_route_policy
  rpf_vector_allow_ebgp                       = each.value.rpf_vector_allow_ebgp
  rpf_vector_disable_ibgp                     = each.value.rpf_vector_disable_ibgp
  rpf_vector_standard_encoding                = each.value.rpf_vector_standard_encoding
  sg_expiry_timer                             = each.value.sg_expiry_timer
  sg_list                                     = each.value.sg_list
  spt_threshold_infinity                      = each.value.spt_threshold_infinity
  spt_threshold_infinity_group_list           = each.value.spt_threshold_infinity_group_list
  ssm_allow_override                          = each.value.ssm_allow_override
  ssm_disable                                 = each.value.ssm_disable
  ssm_range                                   = each.value.ssm_range
  suppress_data_registers                     = each.value.suppress_data_registers
  suppress_rpf_change_prunes                  = each.value.suppress_rpf_change_prunes
  mdt_c_multicast_type                        = each.value.mdt_c_multicast_type
  mdt_c_multicast_announce_pim_join_tlv       = each.value.mdt_c_multicast_announce_pim_join_tlv
  mdt_c_multicast_hello_enable                = each.value.mdt_c_multicast_hello_enable
  mdt_c_multicast_migration_route_policy      = each.value.mdt_c_multicast_migration_route_policy
  mdt_c_multicast_shared_tree_prune           = each.value.mdt_c_multicast_shared_tree_prune
  mdt_c_multicast_shared_tree_prune_delay     = each.value.mdt_c_multicast_shared_tree_prune_delay
  mdt_c_multicast_source_tree_prune_delay     = each.value.mdt_c_multicast_source_tree_prune_delay
  mdt_c_multicast_suppress_pim_data_signaling = each.value.mdt_c_multicast_suppress_pim_data_signaling
  mdt_c_multicast_suppress_shared_tree_join   = each.value.mdt_c_multicast_suppress_shared_tree_join

  depends_on = [
    iosxr_vrf.vrf,
    iosxr_route_policy.route_policy,
    iosxr_ipv6_access_list.ipv6_access_list,
    iosxr_router_pim_ipv4.router_pim_ipv4
  ]
}

##### Router PIM VRF IPv4 #####

locals {
  router_pim_vrf_ipv4 = flatten([
    for device in local.devices : [
      for vrf in try(local.device_config[device.name].router_pim.vrfs, []) : {
        key                                         = format("%s/%s", device.name, vrf.name)
        device_name                                 = device.name
        vrf_name                                    = try(vrf.name, local.defaults.iosxr.devices.configuration.router_pim.vrfs.name, null)
        accept_register                             = try(vrf.address_family_ipv4.accept_register, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.accept_register, null)
        allow_rp                                    = try(vrf.address_family_ipv4.allow_rp, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.allow_rp, null)
        allow_rp_group_list                         = try(vrf.address_family_ipv4.allow_rp_group_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.allow_rp_group_list, null)
        allow_rp_list                               = try(vrf.address_family_ipv4.allow_rp_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.allow_rp_list, null)
        auto_rp_listen_disable                      = try(vrf.address_family_ipv4.auto_rp_listen_disable, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.auto_rp_listen_disable, null)
        bsr_candidate_bsr_address                   = try(vrf.address_family_ipv4.bsr_candidate_bsr_address, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.bsr_candidate_bsr_address, null)
        bsr_candidate_bsr_hash_mask_len             = try(vrf.address_family_ipv4.bsr_candidate_bsr_hash_mask_len, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.bsr_candidate_bsr_hash_mask_len, null)
        bsr_candidate_bsr_priority                  = try(vrf.address_family_ipv4.bsr_candidate_bsr_priority, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.bsr_candidate_bsr_priority, null)
        convergence_link_down_prune_delay           = try(vrf.address_family_ipv4.convergence_link_down_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.convergence_link_down_prune_delay, null)
        convergence_rpf_conflict_join_delay         = try(vrf.address_family_ipv4.convergence_rpf_conflict_join_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.convergence_rpf_conflict_join_delay, null)
        dr_priority                                 = try(vrf.address_family_ipv4.dr_priority, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.dr_priority, null)
        hello_interval                              = try(vrf.address_family_ipv4.hello_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.hello_interval, null)
        join_prune_interval                         = try(vrf.address_family_ipv4.join_prune_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.join_prune_interval, null)
        join_prune_mtu                              = try(vrf.address_family_ipv4.join_prune_mtu, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.join_prune_mtu, null)
        log_neighbor_changes                        = try(vrf.address_family_ipv4.log_neighbor_changes, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.log_neighbor_changes, null)
        maximum_bsr_crp_cache                       = try(vrf.address_family_ipv4.maximum_bsr_crp_cache, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.maximum_bsr_crp_cache, null)
        maximum_bsr_crp_cache_threshold             = try(vrf.address_family_ipv4.maximum_bsr_crp_cache_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.maximum_bsr_crp_cache_threshold, null)
        maximum_group_mappings_autorp               = try(vrf.address_family_ipv4.maximum_group_mappings_autorp, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.maximum_group_mappings_autorp, null)
        maximum_group_mappings_autorp_threshold     = try(vrf.address_family_ipv4.maximum_group_mappings_autorp_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.maximum_group_mappings_autorp_threshold, null)
        maximum_group_mappings_bsr                  = try(vrf.address_family_ipv4.maximum_group_mappings_bsr, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.maximum_group_mappings_bsr, null)
        maximum_group_mappings_bsr_threshold        = try(vrf.address_family_ipv4.maximum_group_mappings_bsr_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.maximum_group_mappings_bsr_threshold, null)
        maximum_register_states                     = try(vrf.address_family_ipv4.maximum_register_states, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.maximum_register_states, null)
        maximum_register_states_threshold           = try(vrf.address_family_ipv4.maximum_register_states_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.maximum_register_states_threshold, null)
        maximum_route_interfaces                    = try(vrf.address_family_ipv4.maximum_route_interfaces, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.maximum_route_interfaces, null)
        maximum_route_interfaces_threshold          = try(vrf.address_family_ipv4.maximum_route_interfaces_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.maximum_route_interfaces_threshold, null)
        maximum_routes                              = try(vrf.address_family_ipv4.maximum_routes, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.maximum_routes, null)
        maximum_routes_threshold                    = try(vrf.address_family_ipv4.maximum_routes_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.maximum_routes_threshold, null)
        mdt_c_multicast_announce_pim_join_tlv       = try(vrf.address_family_ipv4.mdt_c_multicast_routing_pim.announce_pim_join_tlv, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_pim.announce_pim_join_tlv, vrf.address_family_ipv4.mdt_c_multicast_routing_bgp.announce_pim_join_tlv, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_bgp.announce_pim_join_tlv, null)
        mdt_c_multicast_hello_enable                = try(vrf.address_family_ipv4.mdt_c_multicast_routing_bgp.hello_enable, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_bgp.hello_enable, null)
        mdt_c_multicast_migration_route_policy      = try(vrf.address_family_ipv4.mdt_c_multicast_routing_pim.migration_route_policy, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_pim.migration_route_policy, vrf.address_family_ipv4.mdt_c_multicast_routing_bgp.migration_route_policy, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_bgp.migration_route_policy, null)
        mdt_c_multicast_shared_tree_prune           = try(vrf.address_family_ipv4.mdt_c_multicast_routing_pim.shared_tree_prune, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_pim.shared_tree_prune, vrf.address_family_ipv4.mdt_c_multicast_routing_bgp.shared_tree_prune, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_bgp.shared_tree_prune, null)
        mdt_c_multicast_shared_tree_prune_delay     = try(vrf.address_family_ipv4.mdt_c_multicast_routing_pim.shared_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_pim.shared_tree_prune_delay, vrf.address_family_ipv4.mdt_c_multicast_routing_bgp.shared_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_bgp.shared_tree_prune_delay, null)
        mdt_c_multicast_source_tree_prune_delay     = try(vrf.address_family_ipv4.mdt_c_multicast_routing_pim.source_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_pim.source_tree_prune_delay, vrf.address_family_ipv4.mdt_c_multicast_routing_bgp.source_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_bgp.source_tree_prune_delay, null)
        mdt_c_multicast_suppress_pim_data_signaling = try(vrf.address_family_ipv4.mdt_c_multicast_routing_pim.suppress_pim_data_signaling, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_pim.suppress_pim_data_signaling, vrf.address_family_ipv4.mdt_c_multicast_routing_bgp.suppress_pim_data_signaling, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_bgp.suppress_pim_data_signaling, null)
        mdt_c_multicast_suppress_shared_tree_join   = try(vrf.address_family_ipv4.mdt_c_multicast_routing_pim.suppress_shared_tree_join, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_pim.suppress_shared_tree_join, vrf.address_family_ipv4.mdt_c_multicast_routing_bgp.suppress_shared_tree_join, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_bgp.suppress_shared_tree_join, null)
        mdt_c_multicast_type                        = try(vrf.address_family_ipv4.mdt_c_multicast_routing_pim, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_pim, null) != null ? "pim" : try(vrf.address_family_ipv4.mdt_c_multicast_routing_bgp, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_c_multicast_routing_bgp, null) != null ? "bgp" : null
        mdt_data_announce_interval                  = try(vrf.address_family_ipv4.mdt_data_announce_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_data_announce_interval, null)
        mdt_data_switchover_interval                = try(vrf.address_family_ipv4.mdt_data_switchover_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_data_switchover_interval, null)
        mdt_neighbor_filter                         = try(vrf.address_family_ipv4.mdt_neighbor_filter, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.mdt_neighbor_filter, null)
        multipath                                   = try(vrf.address_family_ipv4.multipath, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.multipath, null)
        multipath_hash_source                       = try(vrf.address_family_ipv4.multipath_hash_source, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.multipath_hash_source, null)
        multipath_hash_source_group                 = try(vrf.address_family_ipv4.multipath_hash_source_group, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.multipath_hash_source_group, null)
        multipath_hash_source_nexthop               = try(vrf.address_family_ipv4.multipath_hash_source_nexthop, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.multipath_hash_source_nexthop, null)
        neighbor_check_on_recv                      = try(vrf.address_family_ipv4.neighbor_check_on_recv, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.neighbor_check_on_recv, null)
        neighbor_check_on_send                      = try(vrf.address_family_ipv4.neighbor_check_on_send, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.neighbor_check_on_send, null)
        neighbor_filter                             = try(vrf.address_family_ipv4.neighbor_filter, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.neighbor_filter, null)
        old_register_checksum                       = try(vrf.address_family_ipv4.old_register_checksum, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.old_register_checksum, null)
        override_interval                           = try(vrf.address_family_ipv4.override_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.override_interval, null)
        propagation_delay                           = try(vrf.address_family_ipv4.propagation_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.propagation_delay, null)
        register_source                             = try(vrf.address_family_ipv4.register_source, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.register_source, null)
        rp_static_deny                              = try(vrf.address_family_ipv4.rp_static_deny, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rp_static_deny, null)
        rpf_topology_route_policy                   = try(vrf.address_family_ipv4.rpf_topology_route_policy, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rpf_topology_route_policy, null)
        rpf_vector_allow_ebgp                       = try(vrf.address_family_ipv4.rpf_vector_allow_ebgp, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rpf_vector_allow_ebgp, null)
        rpf_vector_disable_ibgp                     = try(vrf.address_family_ipv4.rpf_vector_disable_ibgp, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rpf_vector_disable_ibgp, null)
        rpf_vector_standard_encoding                = try(vrf.address_family_ipv4.rpf_vector_standard_encoding, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rpf_vector_standard_encoding, null)
        sg_expiry_timer                             = try(vrf.address_family_ipv4.sg_expiry_timer, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.sg_expiry_timer, null)
        sg_list                                     = try(vrf.address_family_ipv4.sg_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.sg_list, null)
        spt_threshold_infinity                      = try(vrf.address_family_ipv4.spt_threshold_infinity, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.spt_threshold_infinity, null)
        spt_threshold_infinity_group_list           = try(vrf.address_family_ipv4.spt_threshold_infinity_group_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.spt_threshold_infinity_group_list, null)
        ssm_allow_override                          = try(vrf.address_family_ipv4.ssm_allow_override, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.ssm_allow_override, null)
        ssm_disable                                 = try(vrf.address_family_ipv4.ssm_disable, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.ssm_disable, null)
        ssm_range                                   = try(vrf.address_family_ipv4.ssm_range, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.ssm_range, null)
        suppress_data_registers                     = try(vrf.address_family_ipv4.suppress_data_registers, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.suppress_data_registers, null)
        suppress_rpf_change_prunes                  = try(vrf.address_family_ipv4.suppress_rpf_change_prunes, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.suppress_rpf_change_prunes, null)
        auto_rp_relay_vrfs = try(length(vrf.address_family_ipv4.auto_rp_relay_vrfs) == 0, true) ? null : [for relay in vrf.address_family_ipv4.auto_rp_relay_vrfs : {
          listen   = try(relay.listen, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.auto_rp_relay_vrfs.listen, null)
          vrf_name = try(relay.vrf, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.auto_rp_relay_vrfs.vrf, null)
        }]
        bsr_candidate_rps = try(length(vrf.address_family_ipv4.bsr_candidate_rps) == 0, true) ? null : [for crp in vrf.address_family_ipv4.bsr_candidate_rps : {
          address          = try(crp.address, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.bsr_candidate_rps.address, null)
          bidir_group_list = try(crp.bidir_group_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.bsr_candidate_rps.bidir_group_list, null)
          bidir_interval   = try(crp.bidir_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.bsr_candidate_rps.bidir_interval, null)
          bidir_priority   = try(crp.bidir_priority, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.bsr_candidate_rps.bidir_priority, null)
          group_list       = try(crp.group_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.bsr_candidate_rps.group_list, null)
          interval         = try(crp.interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.bsr_candidate_rps.interval, null)
          priority         = try(crp.priority, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.bsr_candidate_rps.priority, null)
        }]
        bsr_relay_vrfs = try(length(vrf.address_family_ipv4.bsr_relay_vrfs) == 0, true) ? null : [for relay in vrf.address_family_ipv4.bsr_relay_vrfs : {
          listen   = try(relay.listen, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.bsr_relay_vrfs.listen, null)
          vrf_name = try(relay.vrf, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.bsr_relay_vrfs.vrf, null)
        }]
        explicit_rpf_vector_injects = try(length(vrf.address_family_ipv4.explicit_rpf_vector_injects) == 0, true) ? null : [for inject in vrf.address_family_ipv4.explicit_rpf_vector_injects : {
          rpf_vectors    = try(inject.rpf_vectors, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.explicit_rpf_vector_injects.rpf_vectors, null)
          source_address = try(inject.source_address, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.explicit_rpf_vector_injects.source_address, null)
          source_mask    = try(inject.source_mask, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.explicit_rpf_vector_injects.source_mask, null)
        }]
        interfaces = try(length(vrf.address_family_ipv4.interfaces) == 0, true) ? null : [for intf in vrf.address_family_ipv4.interfaces : {
          bfd_fast_detect                      = try(intf.bfd_fast_detect, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.bfd_fast_detect, null)
          bfd_minimum_interval                 = try(intf.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.bfd_minimum_interval, null)
          bfd_multiplier                       = try(intf.bfd_multiplier, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.bfd_multiplier, null)
          bsr_border                           = try(intf.bsr_border, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.bsr_border, null)
          disable                              = try(intf.disable, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.disable, null)
          dr_priority                          = try(intf.dr_priority, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.dr_priority, null)
          enable                               = try(intf.enable, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.enable, null)
          hello_interval                       = try(intf.hello_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.hello_interval, null)
          interface_name                       = try(intf.name, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.name, null)
          join_prune_interval                  = try(intf.join_prune_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.join_prune_interval, null)
          join_prune_mtu                       = try(intf.join_prune_mtu, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.join_prune_mtu, null)
          maximum_route_interfaces             = try(intf.maximum_route_interfaces, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.maximum_route_interfaces, null)
          maximum_route_interfaces_access_list = try(intf.maximum_route_interfaces_access_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.maximum_route_interfaces_access_list, null)
          maximum_route_interfaces_threshold   = try(intf.maximum_route_interfaces_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.maximum_route_interfaces_threshold, null)
          neighbor_filter                      = try(intf.neighbor_filter, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.neighbor_filter, null)
          override_interval                    = try(intf.override_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.override_interval, null)
          propagation_delay                    = try(intf.propagation_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.interfaces.propagation_delay, null)
        }]
        rp_addresses = try(length(vrf.address_family_ipv4.rp_addresses) == 0, true) ? null : [for rp in vrf.address_family_ipv4.rp_addresses : {
          access_list = try(rp.access_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rp_addresses.access_list, null)
          address     = try(rp.address, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rp_addresses.address, null)
          override    = try(rp.override, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rp_addresses.override, null)
        }]
        rp_addresses_bidir = try(length(vrf.address_family_ipv4.rp_addresses_bidir) == 0, true) ? null : [for rp in vrf.address_family_ipv4.rp_addresses_bidir : {
          access_list = try(rp.access_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rp_addresses_bidir.access_list, null)
          address     = try(rp.address, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rp_addresses_bidir.address, null)
          override    = try(rp.override, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rp_addresses_bidir.override, null)
        }]
        rpf_vector_injects = try(length(vrf.address_family_ipv4.rpf_vector_injects) == 0, true) ? null : [for inject in vrf.address_family_ipv4.rpf_vector_injects : {
          rpf_vectors    = try(inject.rpf_vectors, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rpf_vector_injects.rpf_vectors, null)
          source_address = try(inject.source_address, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rpf_vector_injects.source_address, null)
          source_mask    = try(inject.source_mask, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv4.rpf_vector_injects.source_mask, null)
        }]
      } if try(vrf.address_family_ipv4, null) != null
    ]
  ])
}

resource "iosxr_router_pim_vrf_ipv4" "router_pim_vrf_ipv4" {
  for_each                                    = { for vrf in local.router_pim_vrf_ipv4 : vrf.key => vrf }
  device                                      = each.value.device_name
  vrf_name                                    = each.value.vrf_name
  accept_register                             = each.value.accept_register
  allow_rp                                    = each.value.allow_rp
  allow_rp_group_list                         = each.value.allow_rp_group_list
  allow_rp_list                               = each.value.allow_rp_list
  auto_rp_listen_disable                      = each.value.auto_rp_listen_disable
  auto_rp_relay_vrfs                          = each.value.auto_rp_relay_vrfs
  bsr_candidate_bsr_address                   = each.value.bsr_candidate_bsr_address
  bsr_candidate_bsr_hash_mask_len             = each.value.bsr_candidate_bsr_hash_mask_len
  bsr_candidate_bsr_priority                  = each.value.bsr_candidate_bsr_priority
  bsr_candidate_rps                           = each.value.bsr_candidate_rps
  bsr_relay_vrfs                              = each.value.bsr_relay_vrfs
  convergence_link_down_prune_delay           = each.value.convergence_link_down_prune_delay
  convergence_rpf_conflict_join_delay         = each.value.convergence_rpf_conflict_join_delay
  dr_priority                                 = each.value.dr_priority
  explicit_rpf_vector_injects                 = each.value.explicit_rpf_vector_injects
  hello_interval                              = each.value.hello_interval
  interfaces                                  = each.value.interfaces
  join_prune_interval                         = each.value.join_prune_interval
  join_prune_mtu                              = each.value.join_prune_mtu
  log_neighbor_changes                        = each.value.log_neighbor_changes
  maximum_bsr_crp_cache                       = each.value.maximum_bsr_crp_cache
  maximum_bsr_crp_cache_threshold             = each.value.maximum_bsr_crp_cache_threshold
  maximum_group_mappings_autorp               = each.value.maximum_group_mappings_autorp
  maximum_group_mappings_autorp_threshold     = each.value.maximum_group_mappings_autorp_threshold
  maximum_group_mappings_bsr                  = each.value.maximum_group_mappings_bsr
  maximum_group_mappings_bsr_threshold        = each.value.maximum_group_mappings_bsr_threshold
  maximum_register_states                     = each.value.maximum_register_states
  maximum_register_states_threshold           = each.value.maximum_register_states_threshold
  maximum_route_interfaces                    = each.value.maximum_route_interfaces
  maximum_route_interfaces_threshold          = each.value.maximum_route_interfaces_threshold
  maximum_routes                              = each.value.maximum_routes
  maximum_routes_threshold                    = each.value.maximum_routes_threshold
  mdt_data_announce_interval                  = each.value.mdt_data_announce_interval
  mdt_data_switchover_interval                = each.value.mdt_data_switchover_interval
  mdt_neighbor_filter                         = each.value.mdt_neighbor_filter
  multipath                                   = each.value.multipath
  multipath_hash_source                       = each.value.multipath_hash_source
  multipath_hash_source_group                 = each.value.multipath_hash_source_group
  multipath_hash_source_nexthop               = each.value.multipath_hash_source_nexthop
  neighbor_check_on_recv                      = each.value.neighbor_check_on_recv
  neighbor_check_on_send                      = each.value.neighbor_check_on_send
  neighbor_filter                             = each.value.neighbor_filter
  old_register_checksum                       = each.value.old_register_checksum
  override_interval                           = each.value.override_interval
  propagation_delay                           = each.value.propagation_delay
  register_source                             = each.value.register_source
  rp_addresses                                = each.value.rp_addresses
  rp_addresses_bidir                          = each.value.rp_addresses_bidir
  rp_static_deny                              = each.value.rp_static_deny
  rpf_topology_route_policy                   = each.value.rpf_topology_route_policy
  rpf_vector_allow_ebgp                       = each.value.rpf_vector_allow_ebgp
  rpf_vector_disable_ibgp                     = each.value.rpf_vector_disable_ibgp
  rpf_vector_injects                          = each.value.rpf_vector_injects
  rpf_vector_standard_encoding                = each.value.rpf_vector_standard_encoding
  sg_expiry_timer                             = each.value.sg_expiry_timer
  sg_list                                     = each.value.sg_list
  spt_threshold_infinity                      = each.value.spt_threshold_infinity
  spt_threshold_infinity_group_list           = each.value.spt_threshold_infinity_group_list
  ssm_allow_override                          = each.value.ssm_allow_override
  ssm_disable                                 = each.value.ssm_disable
  ssm_range                                   = each.value.ssm_range
  suppress_data_registers                     = each.value.suppress_data_registers
  suppress_rpf_change_prunes                  = each.value.suppress_rpf_change_prunes
  mdt_c_multicast_type                        = each.value.mdt_c_multicast_type
  mdt_c_multicast_announce_pim_join_tlv       = each.value.mdt_c_multicast_announce_pim_join_tlv
  mdt_c_multicast_hello_enable                = each.value.mdt_c_multicast_hello_enable
  mdt_c_multicast_migration_route_policy      = each.value.mdt_c_multicast_migration_route_policy
  mdt_c_multicast_shared_tree_prune           = each.value.mdt_c_multicast_shared_tree_prune
  mdt_c_multicast_shared_tree_prune_delay     = each.value.mdt_c_multicast_shared_tree_prune_delay
  mdt_c_multicast_source_tree_prune_delay     = each.value.mdt_c_multicast_source_tree_prune_delay
  mdt_c_multicast_suppress_pim_data_signaling = each.value.mdt_c_multicast_suppress_pim_data_signaling
  mdt_c_multicast_suppress_shared_tree_join   = each.value.mdt_c_multicast_suppress_shared_tree_join

  depends_on = [
    iosxr_vrf.vrf,
    iosxr_route_policy.route_policy,
    iosxr_ipv4_access_list.ipv4_access_list,
    iosxr_router_pim_ipv4.router_pim_ipv4,
    iosxr_router_pim_ipv6.router_pim_ipv6
  ]
}

##### Router PIM VRF IPv6 #####

locals {
  router_pim_vrf_ipv6 = flatten([
    for device in local.devices : [
      for vrf in try(local.device_config[device.name].router_pim.vrfs, []) : {
        key                                         = format("%s/%s", device.name, vrf.name)
        device_name                                 = device.name
        vrf_name                                    = try(vrf.name, local.defaults.iosxr.devices.configuration.router_pim.vrfs.name, null)
        accept_register                             = try(vrf.address_family_ipv6.accept_register, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.accept_register, null)
        allow_rp                                    = try(vrf.address_family_ipv6.allow_rp, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.allow_rp, null)
        allow_rp_group_list                         = try(vrf.address_family_ipv6.allow_rp_group_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.allow_rp_group_list, null)
        allow_rp_list                               = try(vrf.address_family_ipv6.allow_rp_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.allow_rp_list, null)
        bsr_candidate_bsr_address                   = try(vrf.address_family_ipv6.bsr_candidate_bsr_address, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.bsr_candidate_bsr_address, null)
        bsr_candidate_bsr_hash_mask_len             = try(vrf.address_family_ipv6.bsr_candidate_bsr_hash_mask_len, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.bsr_candidate_bsr_hash_mask_len, null)
        bsr_candidate_bsr_priority                  = try(vrf.address_family_ipv6.bsr_candidate_bsr_priority, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.bsr_candidate_bsr_priority, null)
        convergence_link_down_prune_delay           = try(vrf.address_family_ipv6.convergence_link_down_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.convergence_link_down_prune_delay, null)
        convergence_rpf_conflict_join_delay         = try(vrf.address_family_ipv6.convergence_rpf_conflict_join_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.convergence_rpf_conflict_join_delay, null)
        dr_priority                                 = try(vrf.address_family_ipv6.dr_priority, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.dr_priority, null)
        hello_interval                              = try(vrf.address_family_ipv6.hello_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.hello_interval, null)
        join_prune_interval                         = try(vrf.address_family_ipv6.join_prune_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.join_prune_interval, null)
        join_prune_mtu                              = try(vrf.address_family_ipv6.join_prune_mtu, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.join_prune_mtu, null)
        log_neighbor_changes                        = try(vrf.address_family_ipv6.log_neighbor_changes, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.log_neighbor_changes, null)
        maximum_bsr_crp_cache                       = try(vrf.address_family_ipv6.maximum_bsr_crp_cache, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.maximum_bsr_crp_cache, null)
        maximum_bsr_crp_cache_threshold             = try(vrf.address_family_ipv6.maximum_bsr_crp_cache_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.maximum_bsr_crp_cache_threshold, null)
        maximum_group_mappings_bsr                  = try(vrf.address_family_ipv6.maximum_group_mappings_bsr, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.maximum_group_mappings_bsr, null)
        maximum_group_mappings_bsr_threshold        = try(vrf.address_family_ipv6.maximum_group_mappings_bsr_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.maximum_group_mappings_bsr_threshold, null)
        maximum_register_states                     = try(vrf.address_family_ipv6.maximum_register_states, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.maximum_register_states, null)
        maximum_register_states_threshold           = try(vrf.address_family_ipv6.maximum_register_states_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.maximum_register_states_threshold, null)
        maximum_route_interfaces                    = try(vrf.address_family_ipv6.maximum_route_interfaces, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.maximum_route_interfaces, null)
        maximum_route_interfaces_threshold          = try(vrf.address_family_ipv6.maximum_route_interfaces_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.maximum_route_interfaces_threshold, null)
        maximum_routes                              = try(vrf.address_family_ipv6.maximum_routes, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.maximum_routes, null)
        maximum_routes_threshold                    = try(vrf.address_family_ipv6.maximum_routes_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.maximum_routes_threshold, null)
        mdt_c_multicast_announce_pim_join_tlv       = try(vrf.address_family_ipv6.mdt_c_multicast_routing_pim.announce_pim_join_tlv, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_pim.announce_pim_join_tlv, vrf.address_family_ipv6.mdt_c_multicast_routing_bgp.announce_pim_join_tlv, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_bgp.announce_pim_join_tlv, null)
        mdt_c_multicast_hello_enable                = try(vrf.address_family_ipv6.mdt_c_multicast_routing_bgp.hello_enable, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_bgp.hello_enable, null)
        mdt_c_multicast_migration_route_policy      = try(vrf.address_family_ipv6.mdt_c_multicast_routing_pim.migration_route_policy, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_pim.migration_route_policy, vrf.address_family_ipv6.mdt_c_multicast_routing_bgp.migration_route_policy, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_bgp.migration_route_policy, null)
        mdt_c_multicast_shared_tree_prune           = try(vrf.address_family_ipv6.mdt_c_multicast_routing_pim.shared_tree_prune, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_pim.shared_tree_prune, vrf.address_family_ipv6.mdt_c_multicast_routing_bgp.shared_tree_prune, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_bgp.shared_tree_prune, null)
        mdt_c_multicast_shared_tree_prune_delay     = try(vrf.address_family_ipv6.mdt_c_multicast_routing_pim.shared_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_pim.shared_tree_prune_delay, vrf.address_family_ipv6.mdt_c_multicast_routing_bgp.shared_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_bgp.shared_tree_prune_delay, null)
        mdt_c_multicast_source_tree_prune_delay     = try(vrf.address_family_ipv6.mdt_c_multicast_routing_pim.source_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_pim.source_tree_prune_delay, vrf.address_family_ipv6.mdt_c_multicast_routing_bgp.source_tree_prune_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_bgp.source_tree_prune_delay, null)
        mdt_c_multicast_suppress_pim_data_signaling = try(vrf.address_family_ipv6.mdt_c_multicast_routing_pim.suppress_pim_data_signaling, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_pim.suppress_pim_data_signaling, vrf.address_family_ipv6.mdt_c_multicast_routing_bgp.suppress_pim_data_signaling, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_bgp.suppress_pim_data_signaling, null)
        mdt_c_multicast_suppress_shared_tree_join   = try(vrf.address_family_ipv6.mdt_c_multicast_routing_pim.suppress_shared_tree_join, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_pim.suppress_shared_tree_join, vrf.address_family_ipv6.mdt_c_multicast_routing_bgp.suppress_shared_tree_join, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_bgp.suppress_shared_tree_join, null)
        mdt_c_multicast_type                        = try(vrf.address_family_ipv6.mdt_c_multicast_routing_pim, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_pim, null) != null ? "pim" : try(vrf.address_family_ipv6.mdt_c_multicast_routing_bgp, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_c_multicast_routing_bgp, null) != null ? "bgp" : null
        mdt_data_announce_interval                  = try(vrf.address_family_ipv6.mdt_data_announce_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_data_announce_interval, null)
        mdt_data_switchover_interval                = try(vrf.address_family_ipv6.mdt_data_switchover_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_data_switchover_interval, null)
        mdt_neighbor_filter                         = try(vrf.address_family_ipv6.mdt_neighbor_filter, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.mdt_neighbor_filter, null)
        multipath                                   = try(vrf.address_family_ipv6.multipath, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.multipath, null)
        multipath_hash_interface_extended           = try(vrf.address_family_ipv6.multipath_hash_interface_extended, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.multipath_hash_interface_extended, null)
        multipath_hash_source_group                 = try(vrf.address_family_ipv6.multipath_hash_source_group, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.multipath_hash_source_group, null)
        multipath_hash_source_nexthop               = try(vrf.address_family_ipv6.multipath_hash_source_nexthop, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.multipath_hash_source_nexthop, null)
        neighbor_check_on_recv                      = try(vrf.address_family_ipv6.neighbor_check_on_recv, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.neighbor_check_on_recv, null)
        neighbor_check_on_send                      = try(vrf.address_family_ipv6.neighbor_check_on_send, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.neighbor_check_on_send, null)
        neighbor_filter                             = try(vrf.address_family_ipv6.neighbor_filter, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.neighbor_filter, null)
        old_register_checksum                       = try(vrf.address_family_ipv6.old_register_checksum, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.old_register_checksum, null)
        override_interval                           = try(vrf.address_family_ipv6.override_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.override_interval, null)
        propagation_delay                           = try(vrf.address_family_ipv6.propagation_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.propagation_delay, null)
        register_source                             = try(vrf.address_family_ipv6.register_source, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.register_source, null)
        rp_static_deny                              = try(vrf.address_family_ipv6.rp_static_deny, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.rp_static_deny, null)
        rpf_topology_route_policy                   = try(vrf.address_family_ipv6.rpf_topology_route_policy, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.rpf_topology_route_policy, null)
        rpf_vector_allow_ebgp                       = try(vrf.address_family_ipv6.rpf_vector_allow_ebgp, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.rpf_vector_allow_ebgp, null)
        rpf_vector_disable_ibgp                     = try(vrf.address_family_ipv6.rpf_vector_disable_ibgp, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.rpf_vector_disable_ibgp, null)
        rpf_vector_standard_encoding                = try(vrf.address_family_ipv6.rpf_vector_standard_encoding, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.rpf_vector_standard_encoding, null)
        sg_expiry_timer                             = try(vrf.address_family_ipv6.sg_expiry_timer, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.sg_expiry_timer, null)
        sg_list                                     = try(vrf.address_family_ipv6.sg_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.sg_list, null)
        spt_threshold_infinity                      = try(vrf.address_family_ipv6.spt_threshold_infinity, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.spt_threshold_infinity, null)
        spt_threshold_infinity_group_list           = try(vrf.address_family_ipv6.spt_threshold_infinity_group_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.spt_threshold_infinity_group_list, null)
        ssm_allow_override                          = try(vrf.address_family_ipv6.ssm_allow_override, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.ssm_allow_override, null)
        ssm_disable                                 = try(vrf.address_family_ipv6.ssm_disable, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.ssm_disable, null)
        ssm_range                                   = try(vrf.address_family_ipv6.ssm_range, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.ssm_range, null)
        suppress_data_registers                     = try(vrf.address_family_ipv6.suppress_data_registers, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.suppress_data_registers, null)
        suppress_rpf_change_prunes                  = try(vrf.address_family_ipv6.suppress_rpf_change_prunes, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.suppress_rpf_change_prunes, null)
        bsr_candidate_rps = try(length(vrf.address_family_ipv6.bsr_candidate_rps) == 0, true) ? null : [for crp in vrf.address_family_ipv6.bsr_candidate_rps : {
          address          = try(crp.address, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.bsr_candidate_rps.address, null)
          bidir_group_list = try(crp.bidir_group_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.bsr_candidate_rps.bidir_group_list, null)
          bidir_interval   = try(crp.bidir_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.bsr_candidate_rps.bidir_interval, null)
          bidir_priority   = try(crp.bidir_priority, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.bsr_candidate_rps.bidir_priority, null)
          group_list       = try(crp.group_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.bsr_candidate_rps.group_list, null)
          interval         = try(crp.interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.bsr_candidate_rps.interval, null)
          priority         = try(crp.priority, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.bsr_candidate_rps.priority, null)
        }]
        bsr_relay_vrfs = try(length(vrf.address_family_ipv6.bsr_relay_vrfs) == 0, true) ? null : [for relay in vrf.address_family_ipv6.bsr_relay_vrfs : {
          listen   = try(relay.listen, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.bsr_relay_vrfs.listen, null)
          vrf_name = try(relay.vrf, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.bsr_relay_vrfs.vrf, null)
        }]
        interfaces = try(length(vrf.address_family_ipv6.interfaces) == 0, true) ? null : [for intf in vrf.address_family_ipv6.interfaces : {
          bfd_fast_detect                      = try(intf.bfd_fast_detect, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.bfd_fast_detect, null)
          bfd_minimum_interval                 = try(intf.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.bfd_minimum_interval, null)
          bfd_multiplier                       = try(intf.bfd_multiplier, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.bfd_multiplier, null)
          bsr_border                           = try(intf.bsr_border, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.bsr_border, null)
          disable                              = try(intf.disable, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.disable, null)
          dr_priority                          = try(intf.dr_priority, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.dr_priority, null)
          enable                               = try(intf.enable, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.enable, null)
          hello_interval                       = try(intf.hello_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.hello_interval, null)
          interface_name                       = try(intf.name, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.name, null)
          join_prune_interval                  = try(intf.join_prune_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.join_prune_interval, null)
          join_prune_mtu                       = try(intf.join_prune_mtu, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.join_prune_mtu, null)
          maximum_route_interfaces             = try(intf.maximum_route_interfaces, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.maximum_route_interfaces, null)
          maximum_route_interfaces_access_list = try(intf.maximum_route_interfaces_access_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.maximum_route_interfaces_access_list, null)
          maximum_route_interfaces_threshold   = try(intf.maximum_route_interfaces_threshold, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.maximum_route_interfaces_threshold, null)
          neighbor_filter                      = try(intf.neighbor_filter, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.neighbor_filter, null)
          override_interval                    = try(intf.override_interval, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.override_interval, null)
          propagation_delay                    = try(intf.propagation_delay, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.interfaces.propagation_delay, null)
        }]
        rp_addresses = try(length(vrf.address_family_ipv6.rp_addresses) == 0, true) ? null : [for rp in vrf.address_family_ipv6.rp_addresses : {
          access_list = try(rp.access_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.rp_addresses.access_list, null)
          address     = try(rp.address, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.rp_addresses.address, null)
          override    = try(rp.override, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.rp_addresses.override, null)
        }]
        rp_addresses_bidir = try(length(vrf.address_family_ipv6.rp_addresses_bidir) == 0, true) ? null : [for rp in vrf.address_family_ipv6.rp_addresses_bidir : {
          access_list = try(rp.access_list, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.rp_addresses_bidir.access_list, null)
          address     = try(rp.address, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.rp_addresses_bidir.address, null)
          override    = try(rp.override, local.defaults.iosxr.devices.configuration.router_pim.vrfs.address_family_ipv6.rp_addresses_bidir.override, null)
        }]
      } if try(vrf.address_family_ipv6, null) != null
    ]
  ])
}

resource "iosxr_router_pim_vrf_ipv6" "router_pim_vrf_ipv6" {
  for_each                                    = { for vrf in local.router_pim_vrf_ipv6 : vrf.key => vrf }
  device                                      = each.value.device_name
  vrf_name                                    = each.value.vrf_name
  accept_register                             = each.value.accept_register
  allow_rp                                    = each.value.allow_rp
  allow_rp_group_list                         = each.value.allow_rp_group_list
  allow_rp_list                               = each.value.allow_rp_list
  bsr_candidate_bsr_address                   = each.value.bsr_candidate_bsr_address
  bsr_candidate_bsr_hash_mask_len             = each.value.bsr_candidate_bsr_hash_mask_len
  bsr_candidate_bsr_priority                  = each.value.bsr_candidate_bsr_priority
  bsr_candidate_rps                           = each.value.bsr_candidate_rps
  bsr_relay_vrfs                              = each.value.bsr_relay_vrfs
  convergence_link_down_prune_delay           = each.value.convergence_link_down_prune_delay
  convergence_rpf_conflict_join_delay         = each.value.convergence_rpf_conflict_join_delay
  dr_priority                                 = each.value.dr_priority
  hello_interval                              = each.value.hello_interval
  interfaces                                  = each.value.interfaces
  join_prune_interval                         = each.value.join_prune_interval
  join_prune_mtu                              = each.value.join_prune_mtu
  log_neighbor_changes                        = each.value.log_neighbor_changes
  maximum_bsr_crp_cache                       = each.value.maximum_bsr_crp_cache
  maximum_bsr_crp_cache_threshold             = each.value.maximum_bsr_crp_cache_threshold
  maximum_group_mappings_bsr                  = each.value.maximum_group_mappings_bsr
  maximum_group_mappings_bsr_threshold        = each.value.maximum_group_mappings_bsr_threshold
  maximum_register_states                     = each.value.maximum_register_states
  maximum_register_states_threshold           = each.value.maximum_register_states_threshold
  maximum_route_interfaces                    = each.value.maximum_route_interfaces
  maximum_route_interfaces_threshold          = each.value.maximum_route_interfaces_threshold
  maximum_routes                              = each.value.maximum_routes
  maximum_routes_threshold                    = each.value.maximum_routes_threshold
  mdt_data_announce_interval                  = each.value.mdt_data_announce_interval
  mdt_data_switchover_interval                = each.value.mdt_data_switchover_interval
  mdt_neighbor_filter                         = each.value.mdt_neighbor_filter
  multipath                                   = each.value.multipath
  multipath_hash_interface_extended           = each.value.multipath_hash_interface_extended
  multipath_hash_source_group                 = each.value.multipath_hash_source_group
  multipath_hash_source_nexthop               = each.value.multipath_hash_source_nexthop
  neighbor_check_on_recv                      = each.value.neighbor_check_on_recv
  neighbor_check_on_send                      = each.value.neighbor_check_on_send
  neighbor_filter                             = each.value.neighbor_filter
  old_register_checksum                       = each.value.old_register_checksum
  override_interval                           = each.value.override_interval
  propagation_delay                           = each.value.propagation_delay
  register_source                             = each.value.register_source
  rp_addresses                                = each.value.rp_addresses
  rp_addresses_bidir                          = each.value.rp_addresses_bidir
  rp_static_deny                              = each.value.rp_static_deny
  rpf_topology_route_policy                   = each.value.rpf_topology_route_policy
  rpf_vector_allow_ebgp                       = each.value.rpf_vector_allow_ebgp
  rpf_vector_disable_ibgp                     = each.value.rpf_vector_disable_ibgp
  rpf_vector_standard_encoding                = each.value.rpf_vector_standard_encoding
  sg_expiry_timer                             = each.value.sg_expiry_timer
  sg_list                                     = each.value.sg_list
  spt_threshold_infinity                      = each.value.spt_threshold_infinity
  spt_threshold_infinity_group_list           = each.value.spt_threshold_infinity_group_list
  ssm_allow_override                          = each.value.ssm_allow_override
  ssm_disable                                 = each.value.ssm_disable
  ssm_range                                   = each.value.ssm_range
  suppress_data_registers                     = each.value.suppress_data_registers
  suppress_rpf_change_prunes                  = each.value.suppress_rpf_change_prunes
  mdt_c_multicast_type                        = each.value.mdt_c_multicast_type
  mdt_c_multicast_announce_pim_join_tlv       = each.value.mdt_c_multicast_announce_pim_join_tlv
  mdt_c_multicast_hello_enable                = each.value.mdt_c_multicast_hello_enable
  mdt_c_multicast_migration_route_policy      = each.value.mdt_c_multicast_migration_route_policy
  mdt_c_multicast_shared_tree_prune           = each.value.mdt_c_multicast_shared_tree_prune
  mdt_c_multicast_shared_tree_prune_delay     = each.value.mdt_c_multicast_shared_tree_prune_delay
  mdt_c_multicast_source_tree_prune_delay     = each.value.mdt_c_multicast_source_tree_prune_delay
  mdt_c_multicast_suppress_pim_data_signaling = each.value.mdt_c_multicast_suppress_pim_data_signaling
  mdt_c_multicast_suppress_shared_tree_join   = each.value.mdt_c_multicast_suppress_shared_tree_join

  depends_on = [
    iosxr_vrf.vrf,
    iosxr_route_policy.route_policy,
    iosxr_ipv6_access_list.ipv6_access_list,
    iosxr_router_pim_ipv4.router_pim_ipv4,
    iosxr_router_pim_ipv6.router_pim_ipv6,
    iosxr_router_pim_vrf_ipv4.router_pim_vrf_ipv4
  ]
}

