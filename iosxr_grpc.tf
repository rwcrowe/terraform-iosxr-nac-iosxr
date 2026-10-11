locals {
  grpc = flatten([
    for device in local.devices : [
      {
        key                                        = device.name
        device_name                                = device.name
        name                                       = try(local.device_config[device.name].grpc.name, local.defaults.iosxr.devices.configuration.grpc.name, null)
        port                                       = try(local.device_config[device.name].grpc.port, local.defaults.iosxr.devices.configuration.grpc.port, null)
        vrf                                        = try(local.device_config[device.name].grpc.vrf, local.defaults.iosxr.devices.configuration.grpc.vrf, null)
        address_family_ipv4                        = try(local.device_config[device.name].grpc.address_family, local.defaults.iosxr.devices.configuration.grpc.address_family, null) == "ipv4" ? true : null
        address_family_ipv6                        = try(local.device_config[device.name].grpc.address_family, local.defaults.iosxr.devices.configuration.grpc.address_family, null) == "ipv6" ? true : null
        address_family_dual                        = try(local.device_config[device.name].grpc.address_family, local.defaults.iosxr.devices.configuration.grpc.address_family, null) == "dual" ? true : null
        no_tls                                     = try(local.device_config[device.name].grpc.no_tls, local.defaults.iosxr.devices.configuration.grpc.no_tls, null)
        local_connection                           = try(local.device_config[device.name].grpc.local_connection, local.defaults.iosxr.devices.configuration.grpc.local_connection, null)
        dscp                                       = try(lookup(local.dscp_map, tostring(try(local.device_config[device.name].grpc.dscp, local.defaults.iosxr.devices.configuration.grpc.dscp)), tostring(try(local.device_config[device.name].grpc.dscp, local.defaults.iosxr.devices.configuration.grpc.dscp))), null)
        ttl                                        = try(local.device_config[device.name].grpc.ttl, local.defaults.iosxr.devices.configuration.grpc.ttl, null)
        memory_limit                               = try(local.device_config[device.name].grpc.memory_limit, local.defaults.iosxr.devices.configuration.grpc.memory_limit, null)
        max_request_total                          = try(local.device_config[device.name].grpc.max_request_total, local.defaults.iosxr.devices.configuration.grpc.max_request_total, null)
        max_request_per_user                       = try(local.device_config[device.name].grpc.max_request_per_user, local.defaults.iosxr.devices.configuration.grpc.max_request_per_user, null)
        max_streams                                = try(local.device_config[device.name].grpc.max_streams, local.defaults.iosxr.devices.configuration.grpc.max_streams, null)
        max_streams_per_user                       = try(local.device_config[device.name].grpc.max_streams_per_user, local.defaults.iosxr.devices.configuration.grpc.max_streams_per_user, null)
        max_concurrent_streams                     = try(local.device_config[device.name].grpc.max_concurrent_streams, local.defaults.iosxr.devices.configuration.grpc.max_concurrent_streams, null)
        keepalive_time                             = try(local.device_config[device.name].grpc.keepalive.time, local.defaults.iosxr.devices.configuration.grpc.keepalive.time, null)
        keepalive_timeout                          = try(local.device_config[device.name].grpc.keepalive.timeout, local.defaults.iosxr.devices.configuration.grpc.keepalive.timeout, null)
        min_keepalive_interval                     = try(local.device_config[device.name].grpc.keepalive.min_interval, local.defaults.iosxr.devices.configuration.grpc.keepalive.min_interval, null)
        aaa_authentication_login                   = try(local.device_config[device.name].grpc.aaa.authentication_login, local.defaults.iosxr.devices.configuration.grpc.aaa.authentication_login, null)
        aaa_authorization_exec                     = try(local.device_config[device.name].grpc.aaa.authorization_exec, local.defaults.iosxr.devices.configuration.grpc.aaa.authorization_exec, null)
        aaa_accounting_queue_size                  = try(local.device_config[device.name].grpc.aaa.accounting.queue_size, local.defaults.iosxr.devices.configuration.grpc.aaa.accounting.queue_size, null)
        certificate_authentication                 = try(local.device_config[device.name].grpc.certificate.authentication, local.defaults.iosxr.devices.configuration.grpc.certificate.authentication, null)
        certificate_id                             = try(local.device_config[device.name].grpc.certificate.id, local.defaults.iosxr.devices.configuration.grpc.certificate.id, null)
        certificate_common_name                    = try(local.device_config[device.name].grpc.certificate.common_name, local.defaults.iosxr.devices.configuration.grpc.certificate.common_name, null)
        tls_min_version                            = try(local.device_config[device.name].grpc.tls.min_version, local.defaults.iosxr.devices.configuration.grpc.tls.min_version, null)
        tls_max_version                            = try(local.device_config[device.name].grpc.tls.max_version, local.defaults.iosxr.devices.configuration.grpc.tls.max_version, null)
        tls_mutual                                 = try(local.device_config[device.name].grpc.tls.mutual, local.defaults.iosxr.devices.configuration.grpc.tls.mutual, null)
        tls_trustpoint                             = try(local.device_config[device.name].grpc.tls.trustpoint, local.defaults.iosxr.devices.configuration.grpc.tls.trustpoint, null)
        tlsv1_disable                              = try(local.device_config[device.name].grpc.tls.v1_disable, local.defaults.iosxr.devices.configuration.grpc.tls.v1_disable, null)
        tls_cipher_default                         = try(local.device_config[device.name].grpc.tls.cipher.default, local.defaults.iosxr.devices.configuration.grpc.tls.cipher.default, null)
        tls_cipher_enable                          = try(local.device_config[device.name].grpc.tls.cipher.enable, local.defaults.iosxr.devices.configuration.grpc.tls.cipher.enable, null)
        tls_cipher_disable                         = try(local.device_config[device.name].grpc.tls.cipher.disable, local.defaults.iosxr.devices.configuration.grpc.tls.cipher.disable, null)
        gnsi_service_certz_ssl_profile_id          = try(local.device_config[device.name].grpc.gnsi.certz_ssl_profile_id, local.defaults.iosxr.devices.configuration.grpc.gnsi.certz_ssl_profile_id, null)
        listen_addresses                           = try(local.device_config[device.name].grpc.listen_addresses, local.defaults.iosxr.devices.configuration.grpc.listen_addresses, null)
        service_layer_auto_register                = try(local.device_config[device.name].grpc.service_layer.auto_register, local.defaults.iosxr.devices.configuration.grpc.service_layer.auto_register, null)
        service_layer                              = try(local.device_config[device.name].grpc.service_layer.enable, local.defaults.iosxr.devices.configuration.grpc.service_layer.enable, null) == true || try(local.device_config[device.name].grpc.service_layer.auto_register, local.defaults.iosxr.devices.configuration.grpc.service_layer.auto_register, null) != null ? true : null
        gribi_port                                 = try(local.device_config[device.name].grpc.gribi.port, local.defaults.iosxr.devices.configuration.grpc.gribi.port, null)
        gribi                                      = try(local.device_config[device.name].grpc.gribi.enable, local.defaults.iosxr.devices.configuration.grpc.gribi.enable, null) == true || try(local.device_config[device.name].grpc.gribi.port, local.defaults.iosxr.devices.configuration.grpc.gribi.port, null) != null ? true : null
        gnmi_port                                  = try(local.device_config[device.name].grpc.gnmi.port, local.defaults.iosxr.devices.configuration.grpc.gnmi.port, null)
        gnmi                                       = try(local.device_config[device.name].grpc.gnmi.enable, local.defaults.iosxr.devices.configuration.grpc.gnmi.enable, null) == true || try(local.device_config[device.name].grpc.gnmi.port, local.defaults.iosxr.devices.configuration.grpc.gnmi.port, null) != null || try(local.device_config[device.name].grpc.gnmi.get_limit_multiple, local.defaults.iosxr.devices.configuration.grpc.gnmi.get_limit_multiple, null) != null ? true : null
        segment_routing                            = try(local.device_config[device.name].grpc.segment_routing.traffic_eng, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng, null) != null ? true : null
        segment_routing_traffic_eng                = try(local.device_config[device.name].grpc.segment_routing.traffic_eng, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng, null) != null ? true : null
        segment_routing_traffic_eng_policy_service = try(local.device_config[device.name].grpc.segment_routing.traffic_eng.policy_service, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.policy_service, null)
        aaa_accounting_history_memory              = local.device_is_25x[device.name] ? try(local.device_config[device.name].grpc.aaa.accounting.history_memory, local.defaults.iosxr.devices.configuration.grpc.aaa.accounting.history_memory, null) : null
        default_server_disable                     = local.device_is_25x[device.name] ? try(local.device_config[device.name].grpc.default_server_disable, local.defaults.iosxr.devices.configuration.grpc.default_server_disable, null) : null
        remote_connection_disable                  = local.device_is_25x[device.name] ? try(local.device_config[device.name].grpc.remote_connection_disable, local.defaults.iosxr.devices.configuration.grpc.remote_connection_disable, null) : null
        listen_addresses_any                       = local.device_is_25x[device.name] ? try(local.device_config[device.name].grpc.listen_addresses_any, local.defaults.iosxr.devices.configuration.grpc.listen_addresses_any, null) : null
        gnmi_get_limit_multiple                    = local.device_is_25x[device.name] ? try(local.device_config[device.name].grpc.gnmi.get_limit_multiple, local.defaults.iosxr.devices.configuration.grpc.gnmi.get_limit_multiple, null) : null
        gnpsi_stream_queue_size                    = local.device_is_25x[device.name] ? try(local.device_config[device.name].grpc.gnpsi.stream_queue_size, local.defaults.iosxr.devices.configuration.grpc.gnpsi.stream_queue_size, null) : null
        gnpsi                                      = local.device_is_25x[device.name] ? (try(local.device_config[device.name].grpc.gnpsi.enable, local.defaults.iosxr.devices.configuration.grpc.gnpsi.enable, null) == true || try(local.device_config[device.name].grpc.gnpsi.stream_queue_size, local.defaults.iosxr.devices.configuration.grpc.gnpsi.stream_queue_size, null) != null ? true : null) : null
        segment_routing_traffic_eng_service_instances = local.device_is_25x[device.name] && !try(length(local.device_config[device.name].grpc.segment_routing.traffic_eng.service_instances) == 0, true) ? [for si in local.device_config[device.name].grpc.segment_routing.traffic_eng.service_instances : {
          service_instance_name = try(si.name, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.name, null)
          ipv4_addresses = length([for a in try(si.addresses, []) : a if can(regex(":", try(a.ip, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.ip, ""))) == false]) == 0 ? null : [for a in try(si.addresses, []) : {
            ipv4_address          = try(a.ip, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.ip, null)
            port                  = try(a.port, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.port, null)
            no_tls                = try(a.no_tls, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.no_tls, null)
            source_interface      = try(a.source_interface, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.source_interface, null)
            tls_hostname_override = try(a.tls_hostname_override, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.tls_hostname_override, null)
            vrf                   = try(a.vrf, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.vrf, null)
          } if can(regex(":", try(a.ip, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.ip, ""))) == false]
          ipv6_addresses = length([for a in try(si.addresses, []) : a if can(regex(":", try(a.ip, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.ip, ""))) == true]) == 0 ? null : [for a in try(si.addresses, []) : {
            ipv6_address          = try(a.ip, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.ip, null)
            port                  = try(a.port, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.port, null)
            no_tls                = try(a.no_tls, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.no_tls, null)
            source_interface      = try(a.source_interface, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.source_interface, null)
            tls_hostname_override = try(a.tls_hostname_override, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.tls_hostname_override, null)
            vrf                   = try(a.vrf, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.vrf, null)
          } if can(regex(":", try(a.ip, local.defaults.iosxr.devices.configuration.grpc.segment_routing.traffic_eng.service_instances.addresses.ip, ""))) == true]
        }] : null
      }
    ] if try(local.device_config[device.name].grpc, null) != null || try(local.defaults.iosxr.devices.configuration.grpc, null) != null
  ])
}

resource "iosxr_grpc" "grpc" {
  for_each                                      = { for g in local.grpc : g.key => g }
  device                                        = each.value.device_name
  name                                          = each.value.name
  port                                          = each.value.port
  vrf                                           = each.value.vrf
  address_family_ipv4                           = each.value.address_family_ipv4
  address_family_ipv6                           = each.value.address_family_ipv6
  address_family_dual                           = each.value.address_family_dual
  no_tls                                        = each.value.no_tls
  local_connection                              = each.value.local_connection
  dscp                                          = each.value.dscp
  ttl                                           = each.value.ttl
  memory_limit                                  = each.value.memory_limit
  max_request_total                             = each.value.max_request_total
  max_request_per_user                          = each.value.max_request_per_user
  max_streams                                   = each.value.max_streams
  max_streams_per_user                          = each.value.max_streams_per_user
  max_concurrent_streams                        = each.value.max_concurrent_streams
  keepalive_time                                = each.value.keepalive_time
  keepalive_timeout                             = each.value.keepalive_timeout
  min_keepalive_interval                        = each.value.min_keepalive_interval
  aaa_authentication_login                      = each.value.aaa_authentication_login
  aaa_authorization_exec                        = each.value.aaa_authorization_exec
  aaa_accounting_queue_size                     = each.value.aaa_accounting_queue_size
  aaa_accounting_history_memory                 = each.value.aaa_accounting_history_memory
  certificate_authentication                    = each.value.certificate_authentication
  certificate_id                                = each.value.certificate_id
  certificate_common_name                       = each.value.certificate_common_name
  tls_min_version                               = each.value.tls_min_version
  tls_max_version                               = each.value.tls_max_version
  tls_mutual                                    = each.value.tls_mutual
  tls_trustpoint                                = each.value.tls_trustpoint
  tlsv1_disable                                 = each.value.tlsv1_disable
  tls_cipher_default                            = each.value.tls_cipher_default
  tls_cipher_enable                             = each.value.tls_cipher_enable
  tls_cipher_disable                            = each.value.tls_cipher_disable
  gnsi_service_certz_ssl_profile_id             = each.value.gnsi_service_certz_ssl_profile_id
  default_server_disable                        = each.value.default_server_disable
  remote_connection_disable                     = each.value.remote_connection_disable
  listen_addresses                              = each.value.listen_addresses
  listen_addresses_any                          = each.value.listen_addresses_any
  gnmi                                          = each.value.gnmi
  gnmi_port                                     = each.value.gnmi_port
  gnmi_get_limit_multiple                       = each.value.gnmi_get_limit_multiple
  gribi                                         = each.value.gribi
  gribi_port                                    = each.value.gribi_port
  gnpsi                                         = each.value.gnpsi
  gnpsi_stream_queue_size                       = each.value.gnpsi_stream_queue_size
  service_layer                                 = each.value.service_layer
  service_layer_auto_register                   = each.value.service_layer_auto_register
  segment_routing                               = each.value.segment_routing
  segment_routing_traffic_eng                   = each.value.segment_routing_traffic_eng
  segment_routing_traffic_eng_policy_service    = each.value.segment_routing_traffic_eng_policy_service
  segment_routing_traffic_eng_service_instances = each.value.segment_routing_traffic_eng_service_instances
}
