##### L2VPN #####

locals {
  l2vpn = flatten([
    for device in local.devices : [
      {
        key                             = device.name
        device_name                     = device.name
        description                     = try(local.device_config[device.name].l2vpn.description, local.defaults.iosxr.devices.configuration.l2vpn_description, null)
        router_id                       = try(local.device_config[device.name].l2vpn.router_id, local.defaults.iosxr.devices.configuration.l2vpn_router_id, null)
        load_balancing_flow_src_dst_ip  = try(local.device_config[device.name].l2vpn.load_balancing_flow, local.defaults.iosxr.devices.configuration.l2vpn_load_balancing_flow, null) == "src-dst-ip" ? true : null
        load_balancing_flow_src_dst_mac = try(local.device_config[device.name].l2vpn.load_balancing_flow, local.defaults.iosxr.devices.configuration.l2vpn_load_balancing_flow, null) == "src-dst-mac" ? true : null
      }
    ]
    if try(local.device_config[device.name].l2vpn, null) != null || try(local.defaults.iosxr.devices.configuration.l2vpn, null) != null
  ])
}

resource "iosxr_l2vpn" "l2vpn" {
  for_each                        = { for l2vpn in local.l2vpn : l2vpn.key => l2vpn }
  device                          = each.value.device_name
  description                     = each.value.description
  router_id                       = each.value.router_id
  load_balancing_flow_src_dst_ip  = each.value.load_balancing_flow_src_dst_ip
  load_balancing_flow_src_dst_mac = each.value.load_balancing_flow_src_dst_mac

  depends_on = [
    iosxr_route_policy.route_policy
  ]
}

##### L2VPN Bridge Group Bridge Domain #####

locals {
  l2vpn_bridge_group_bridge_domain = flatten([
    for device in local.devices : [
      for bridge_group in try(local.device_config[device.name].l2vpn.bridge_groups, []) : [
        for bridge_domain in try(bridge_group.bridge_domains, []) : {
          key                                = format("%s/%s/%s", device.name, bridge_group.name, bridge_domain.name)
          device_name                        = device.name
          bridge_group_name                  = try(bridge_group.name, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.name, null)
          bridge_domain_name                 = try(bridge_domain.name, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.name, null)
          mtu                                = try(bridge_domain.mtu, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.mtu, null)
          storm_control_broadcast_kbps       = try(bridge_domain.storm_control_broadcast_kbps, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.storm_control_broadcast_kbps, null)
          storm_control_broadcast_pps        = try(bridge_domain.storm_control_broadcast_pps, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.storm_control_broadcast_pps, null)
          storm_control_multicast_kbps       = try(bridge_domain.storm_control_multicast_kbps, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.storm_control_multicast_kbps, null)
          storm_control_multicast_pps        = try(bridge_domain.storm_control_multicast_pps, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.storm_control_multicast_pps, null)
          storm_control_unknown_unicast_kbps = try(bridge_domain.storm_control_unknown_unicast_kbps, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.storm_control_unknown_unicast_kbps, null)
          storm_control_unknown_unicast_pps  = try(bridge_domain.storm_control_unknown_unicast_pps, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.storm_control_unknown_unicast_pps, null)
          evis = try(length(bridge_domain.evis) == 0, true) ? null : [for evi in bridge_domain.evis : {
            vpn_id = try(evi.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.evis.vpn_id, null)
            }
          ]
          interfaces = try(length(bridge_domain.interfaces) == 0, true) ? null : [for interface in bridge_domain.interfaces : {
            interface_name      = try(interface.name, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.interfaces.name, null)
            split_horizon_group = try(interface.split_horizon_group, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.interfaces.split_horizon_group, null)
            }
          ]
          routed_interface = try(length(bridge_domain.routed_interfaces) == 0, true) ? null : [for ri in bridge_domain.routed_interfaces : {
            interface_name           = try(ri.name, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.routed_interfaces.name, null)
            split_horizon_group_core = try(ri.split_horizon_group_core, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.routed_interfaces.split_horizon_group_core, null)
            }
          ]
          srv6_evis = try(length(bridge_domain.srv6_evis) == 0, true) ? null : [for srv6_evi in bridge_domain.srv6_evis : {
            vpn_id = try(srv6_evi.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.srv6_evis.vpn_id, null)
            }
          ]
          vnis = try(length(bridge_domain.vnis) == 0, true) ? null : [for vni in bridge_domain.vnis : {
            vni_id = try(vni.vni_id, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.vnis.vni_id, null)
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_l2vpn_bridge_group_bridge_domain" "l2vpn_bridge_group_bridge_domain" {
  for_each                           = { for item in local.l2vpn_bridge_group_bridge_domain : item.key => item }
  device                             = each.value.device_name
  bridge_group_name                  = each.value.bridge_group_name
  bridge_domain_name                 = each.value.bridge_domain_name
  mtu                                = each.value.mtu
  storm_control_broadcast_kbps       = each.value.storm_control_broadcast_kbps
  storm_control_broadcast_pps        = each.value.storm_control_broadcast_pps
  storm_control_multicast_kbps       = each.value.storm_control_multicast_kbps
  storm_control_multicast_pps        = each.value.storm_control_multicast_pps
  storm_control_unknown_unicast_kbps = each.value.storm_control_unknown_unicast_kbps
  storm_control_unknown_unicast_pps  = each.value.storm_control_unknown_unicast_pps
  evis                               = each.value.evis
  interfaces                         = each.value.interfaces
  routed_interface                   = each.value.routed_interface
  srv6_evis                          = each.value.srv6_evis
  vnis                               = each.value.vnis

  depends_on = [
    iosxr_l2vpn.l2vpn
  ]
}

##### L2VPN PW Class #####

locals {
  l2vpn_pw_class = flatten([
    for device in local.devices : [
      for pw_class in try(local.device_config[device.name].l2vpn.pw_classes, []) : {
        key                                                = format("%s/%s", device.name, pw_class.name)
        device_name                                        = device.name
        name                                               = try(pw_class.name, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.name, null)
        encapsulation_mpls                                 = try(pw_class.encapsulation_mpls.enable, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.enable, try(pw_class.encapsulation_mpls, null) != null ? true : null)
        encapsulation_mpls_transport_mode_ethernet         = try(pw_class.encapsulation_mpls.transport_mode, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.transport_mode, null) == "ethernet" ? true : null
        encapsulation_mpls_transport_mode_vlan             = try(pw_class.encapsulation_mpls.transport_mode, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.transport_mode, null) == "vlan" ? true : null
        encapsulation_mpls_transport_mode_vlan_passthrough = try(pw_class.encapsulation_mpls.transport_mode, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.transport_mode, null) == "vlan-passthrough" ? true : null
        encapsulation_mpls_load_balancing_pw_label         = try(pw_class.encapsulation_mpls.load_balancing.pw_label, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.pw_label, null)
        encapsulation_mpls_load_balancing_flow_label_both  = try(pw_class.encapsulation_mpls.load_balancing.flow_label.direction, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.direction, null) == "both" ? true : null
        encapsulation_mpls_load_balancing_flow_label_both_static = (
          try(pw_class.encapsulation_mpls.load_balancing.flow_label.direction, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.direction, null) == "both"
          && try(pw_class.encapsulation_mpls.load_balancing.flow_label.static, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.static, false)
        ) ? true : null
        encapsulation_mpls_load_balancing_flow_label_receive = try(pw_class.encapsulation_mpls.load_balancing.flow_label.direction, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.direction, null) == "receive" ? true : null
        encapsulation_mpls_load_balancing_flow_label_receive_static = (
          try(pw_class.encapsulation_mpls.load_balancing.flow_label.direction, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.direction, null) == "receive"
          && try(pw_class.encapsulation_mpls.load_balancing.flow_label.static, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.static, false)
        ) ? true : null
        encapsulation_mpls_load_balancing_flow_label_transmit = try(pw_class.encapsulation_mpls.load_balancing.flow_label.direction, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.direction, null) == "transmit" ? true : null
        encapsulation_mpls_load_balancing_flow_label_transmit_static = (
          try(pw_class.encapsulation_mpls.load_balancing.flow_label.direction, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.direction, null) == "transmit"
          && try(pw_class.encapsulation_mpls.load_balancing.flow_label.static, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.static, false)
        ) ? true : null
        encapsulation_mpls_load_balancing_flow_label_code_17         = contains(["enable", "disable"], try(pw_class.encapsulation_mpls.load_balancing.flow_label.code_17, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.code_17, "")) ? true : null
        encapsulation_mpls_load_balancing_flow_label_code_17_disable = try(pw_class.encapsulation_mpls.load_balancing.flow_label.code_17, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.code_17, null) == "disable" ? true : null
      }
    ]
  ])
}

resource "iosxr_l2vpn_pw_class" "l2vpn_pw_class" {
  for_each                                                     = { for pw_class in local.l2vpn_pw_class : pw_class.key => pw_class }
  device                                                       = each.value.device_name
  name                                                         = each.value.name
  encapsulation_mpls                                           = each.value.encapsulation_mpls
  encapsulation_mpls_transport_mode_ethernet                   = each.value.encapsulation_mpls_transport_mode_ethernet
  encapsulation_mpls_transport_mode_vlan                       = each.value.encapsulation_mpls_transport_mode_vlan
  encapsulation_mpls_transport_mode_vlan_passthrough           = each.value.encapsulation_mpls_transport_mode_vlan_passthrough
  encapsulation_mpls_load_balancing_pw_label                   = each.value.encapsulation_mpls_load_balancing_pw_label
  encapsulation_mpls_load_balancing_flow_label_both            = each.value.encapsulation_mpls_load_balancing_flow_label_both
  encapsulation_mpls_load_balancing_flow_label_both_static     = each.value.encapsulation_mpls_load_balancing_flow_label_both_static
  encapsulation_mpls_load_balancing_flow_label_code_17         = each.value.encapsulation_mpls_load_balancing_flow_label_code_17
  encapsulation_mpls_load_balancing_flow_label_code_17_disable = each.value.encapsulation_mpls_load_balancing_flow_label_code_17_disable
  encapsulation_mpls_load_balancing_flow_label_receive         = each.value.encapsulation_mpls_load_balancing_flow_label_receive
  encapsulation_mpls_load_balancing_flow_label_receive_static  = each.value.encapsulation_mpls_load_balancing_flow_label_receive_static
  encapsulation_mpls_load_balancing_flow_label_transmit        = each.value.encapsulation_mpls_load_balancing_flow_label_transmit
  encapsulation_mpls_load_balancing_flow_label_transmit_static = each.value.encapsulation_mpls_load_balancing_flow_label_transmit_static

  depends_on = [
    iosxr_l2vpn.l2vpn
  ]
}

##### L2VPN Xconnect Group #####

locals {
  l2vpn_xconnect_group = flatten([
    for device in local.devices : [
      for xconnect_group in try(local.device_config[device.name].l2vpn.xconnect_groups, []) : {
        key         = format("%s/%s", device.name, xconnect_group.name)
        device_name = device.name
        group_name  = try(xconnect_group.name, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.name, null)
        p2ps = try(length(xconnect_group.p2ps) == 0, true) ? null : [for p2p in xconnect_group.p2ps : {
          p2p_xconnect_name     = try(p2p.name, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.name, null)
          description           = try(p2p.description, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.description, null)
          interworking_ipv4     = try(p2p.interworking, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.interworking, null) == "ipv4" ? true : null
          interworking_ethernet = try(p2p.interworking, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.interworking, null) == "ethernet" ? true : null
          interfaces = try(length(p2p.interfaces) == 0, true) ? null : [for interface in p2p.interfaces : {
            interface_name = try(interface.name, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.interfaces.name, null)
            }
          ]
          backup_interfaces = try(length(p2p.backup_interfaces) == 0, true) ? null : [for backup_interface in p2p.backup_interfaces : {
            interface_name = try(backup_interface.name, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.backup_interfaces.name, null)
            }
          ]
          ipv4_neighbors = try(length(p2p.ipv4_neighbors) == 0, true) ? null : [for ipv4_neighbor in p2p.ipv4_neighbors : {
            address                  = try(ipv4_neighbor.address, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv4_neighbors.address, null)
            pw_id                    = try(ipv4_neighbor.pw_id, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv4_neighbors.pw_id, null)
            pw_class                 = try(ipv4_neighbor.pw_class, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv4_neighbors.pw_class, null)
            bandwidth                = try(ipv4_neighbor.bandwidth, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv4_neighbors.bandwidth, null)
            mpls_static_label_local  = try(ipv4_neighbor.mpls_static_label_local, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv4_neighbors.mpls_static_label_local, null)
            mpls_static_label_remote = try(ipv4_neighbor.mpls_static_label_remote, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv4_neighbors.mpls_static_label_remote, null)
            tag_impose_vlan          = try(ipv4_neighbor.tag_impose_vlan, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv4_neighbors.tag_impose_vlan, null)
            backup_neighbors = try(length(ipv4_neighbor.backup_neighbors) == 0, true) ? null : [for backup_neighbor in ipv4_neighbor.backup_neighbors : {
              address                  = try(backup_neighbor.address, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv4_neighbors.backup_neighbors.address, null)
              pw_id                    = try(backup_neighbor.pw_id, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv4_neighbors.backup_neighbors.pw_id, null)
              pw_class                 = try(backup_neighbor.pw_class, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv4_neighbors.backup_neighbors.pw_class, null)
              mpls_static_label_local  = try(backup_neighbor.mpls_static_label_local, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv4_neighbors.backup_neighbors.mpls_static_label_local, null)
              mpls_static_label_remote = try(backup_neighbor.mpls_static_label_remote, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv4_neighbors.backup_neighbors.mpls_static_label_remote, null)
              }
            ]
            }
          ]
          ipv6_neighbors = try(length(p2p.ipv6_neighbors) == 0, true) ? null : [for ipv6_neighbor in p2p.ipv6_neighbors : {
            address                  = try(ipv6_neighbor.address, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv6_neighbors.address, null)
            pw_id                    = try(ipv6_neighbor.pw_id, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv6_neighbors.pw_id, null)
            pw_class                 = try(ipv6_neighbor.pw_class, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv6_neighbors.pw_class, null)
            source_ipv6_address      = try(ipv6_neighbor.source_ipv6_address, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv6_neighbors.source_ipv6_address, null)
            mpls_static_label_local  = try(ipv6_neighbor.mpls_static_label_local, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv6_neighbors.mpls_static_label_local, null)
            mpls_static_label_remote = try(ipv6_neighbor.mpls_static_label_remote, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv6_neighbors.mpls_static_label_remote, null)
            tag_impose_vlan          = try(ipv6_neighbor.tag_impose_vlan, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv6_neighbors.tag_impose_vlan, null)
            backup_neighbors = try(length(ipv6_neighbor.backup_neighbors) == 0, true) ? null : [for backup_neighbor in ipv6_neighbor.backup_neighbors : {
              address                  = try(backup_neighbor.address, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv6_neighbors.backup_neighbors.address, null)
              pw_id                    = try(backup_neighbor.pw_id, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv6_neighbors.backup_neighbors.pw_id, null)
              pw_class                 = try(backup_neighbor.pw_class, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv6_neighbors.backup_neighbors.pw_class, null)
              mpls_static_label_local  = try(backup_neighbor.mpls_static_label_local, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv6_neighbors.backup_neighbors.mpls_static_label_local, null)
              mpls_static_label_remote = try(backup_neighbor.mpls_static_label_remote, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.ipv6_neighbors.backup_neighbors.mpls_static_label_remote, null)
              }
            ]
            }
          ]
          # EVPN neighbors: an entry with segment_routing_srv6 goes to the provider's segment routing list
          evpn_target_neighbors = length([for evpn_neighbor in try(p2p.evpn_target_neighbors, []) : evpn_neighbor if try(evpn_neighbor.segment_routing_srv6, null) == null]) == 0 ? null : [for evpn_neighbor in try(p2p.evpn_target_neighbors, []) : {
            vpn_id       = try(evpn_neighbor.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_target_neighbors.vpn_id, null)
            remote_ac_id = try(evpn_neighbor.remote_ac_id, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_target_neighbors.remote_ac_id, null)
            source       = try(evpn_neighbor.source, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_target_neighbors.source, null)
            pw_class     = try(evpn_neighbor.pw_class, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_target_neighbors.pw_class, null)
          } if try(evpn_neighbor.segment_routing_srv6, null) == null]
          evpn_target_neighbors_segment_routing = length([for evpn_neighbor in try(p2p.evpn_target_neighbors, []) : evpn_neighbor if try(evpn_neighbor.segment_routing_srv6, null) != null]) == 0 ? null : [for evpn_neighbor in try(p2p.evpn_target_neighbors, []) : {
            vpn_id                       = try(evpn_neighbor.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_target_neighbors.vpn_id, null)
            remote_ac_id                 = try(evpn_neighbor.remote_ac_id, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_target_neighbors.remote_ac_id, null)
            source                       = try(evpn_neighbor.source, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_target_neighbors.source, null)
            segment_routing_srv6_locator = try(evpn_neighbor.segment_routing_srv6.locator, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_target_neighbors.segment_routing_srv6.locator, null)
          } if try(evpn_neighbor.segment_routing_srv6, null) != null]
          evpn_service_neighbors = length([for evpn_neighbor in try(p2p.evpn_service_neighbors, []) : evpn_neighbor if try(evpn_neighbor.segment_routing_srv6, null) == null]) == 0 ? null : [for evpn_neighbor in try(p2p.evpn_service_neighbors, []) : {
            vpn_id     = try(evpn_neighbor.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_service_neighbors.vpn_id, null)
            service_id = try(evpn_neighbor.service_id, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_service_neighbors.service_id, null)
            pw_class   = try(evpn_neighbor.pw_class, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_service_neighbors.pw_class, null)
          } if try(evpn_neighbor.segment_routing_srv6, null) == null]
          evpn_service_neighbors_segment_routing = length([for evpn_neighbor in try(p2p.evpn_service_neighbors, []) : evpn_neighbor if try(evpn_neighbor.segment_routing_srv6, null) != null]) == 0 ? null : [for evpn_neighbor in try(p2p.evpn_service_neighbors, []) : {
            vpn_id                       = try(evpn_neighbor.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_service_neighbors.vpn_id, null)
            service_id                   = try(evpn_neighbor.service_id, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_service_neighbors.service_id, null)
            segment_routing_srv6_locator = try(evpn_neighbor.segment_routing_srv6.locator, local.defaults.iosxr.devices.configuration.l2vpn.xconnect_groups.p2ps.evpn_service_neighbors.segment_routing_srv6.locator, null)
          } if try(evpn_neighbor.segment_routing_srv6, null) != null]
          }
        ]
      }
    ]
  ])
}

resource "iosxr_l2vpn_xconnect_group" "l2vpn_xconnect_group" {
  for_each   = { for item in local.l2vpn_xconnect_group : item.key => item }
  device     = each.value.device_name
  group_name = each.value.group_name
  p2ps       = each.value.p2ps

  depends_on = [
    iosxr_l2vpn.l2vpn,
    iosxr_l2vpn_pw_class.l2vpn_pw_class,
    iosxr_interface_bundle_ether.bundle_ether,
    iosxr_interface_bundle_ether_subinterface.bundle_ether_subinterface,
    iosxr_interface_ethernet.ethernet,
    iosxr_interface_ethernet_subinterface.ethernet_subinterface
  ]
}
