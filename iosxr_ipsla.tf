##### IPSLA #####

locals {
  ipsla = { for device in local.devices : device.name => {
    low_memory                    = try(local.device_config[device.name].ipsla.low_memory, local.defaults.iosxr.devices.configuration.ipsla.low_memory, null)
    key_chain                     = try(local.device_config[device.name].ipsla.key_chain, local.defaults.iosxr.devices.configuration.ipsla.key_chain, null)
    hw_timestamp_disable          = try(local.device_config[device.name].ipsla.hw_timestamp_disable, local.defaults.iosxr.devices.configuration.ipsla.hw_timestamp_disable, null)
    server_twamp                  = try(local.device_config[device.name].ipsla.server_twamp, local.defaults.iosxr.devices.configuration.ipsla.server_twamp, null) != null ? true : null
    server_twamp_port             = try(local.device_config[device.name].ipsla.server_twamp.port, local.defaults.iosxr.devices.configuration.ipsla.server_twamp.port, null)
    server_twamp_timer_inactivity = try(local.device_config[device.name].ipsla.server_twamp.inactivity_timer, local.defaults.iosxr.devices.configuration.ipsla.server_twamp.inactivity_timer, null)
    operations = try(length(local.device_config[device.name].ipsla.operations) == 0, true) ? null : [for op in local.device_config[device.name].ipsla.operations : {
      operation_number                                  = try(op.id, local.defaults.iosxr.devices.configuration.ipsla.operations.id, null)
      icmp_echo                                         = try(op.type_icmp_echo, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo, null) != null ? true : null
      icmp_echo_tag                                     = try(op.type_icmp_echo.tag, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.tag, null)
      icmp_echo_frequency                               = try(op.type_icmp_echo.frequency, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.frequency, null)
      icmp_echo_datasize_request                        = try(op.type_icmp_echo.datasize_request, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.datasize_request, null)
      icmp_echo_timeout                                 = try(op.type_icmp_echo.timeout, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.timeout, null)
      icmp_echo_source_ipv4                             = can(regex(":", try(op.type_icmp_echo.source_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.source_address, ""))) == false ? try(op.type_icmp_echo.source_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.source_address, null) : null
      icmp_echo_source_ipv6                             = can(regex(":", try(op.type_icmp_echo.source_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.source_address, ""))) == true ? try(op.type_icmp_echo.source_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.source_address, null) : null
      icmp_echo_tos                                     = try(op.type_icmp_echo.tos, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.tos, null)
      icmp_echo_vrf                                     = try(op.type_icmp_echo.vrf, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.vrf, null)
      icmp_echo_destination_ipv4                        = can(regex(":", try(op.type_icmp_echo.destination_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.destination_address, ""))) == false ? try(op.type_icmp_echo.destination_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.destination_address, null) : null
      icmp_echo_destination_ipv6                        = can(regex(":", try(op.type_icmp_echo.destination_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.destination_address, ""))) == true ? try(op.type_icmp_echo.destination_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.destination_address, null) : null
      icmp_echo_history_buckets                         = try(op.type_icmp_echo.history.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.history.buckets, null)
      icmp_echo_history_filter_all                      = try(op.type_icmp_echo.history.filter_all, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.history.filter_all, null)
      icmp_echo_history_filter_failures                 = try(op.type_icmp_echo.history.filter_failures, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.history.filter_failures, null)
      icmp_echo_history_lives                           = try(op.type_icmp_echo.history.lives, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.history.lives, null)
      icmp_echo_statistics_hourly_buckets               = try(op.type_icmp_echo.statistics.hourly.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.statistics.hourly.buckets, null)
      icmp_echo_statistics_hourly_distribution_count    = try(op.type_icmp_echo.statistics.hourly.distribution_count, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.statistics.hourly.distribution_count, null)
      icmp_echo_statistics_hourly_distribution_interval = try(op.type_icmp_echo.statistics.hourly.distribution_interval, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.statistics.hourly.distribution_interval, null)
      icmp_echo_statistics_intervals = try(length(op.type_icmp_echo.statistics.intervals) == 0, true) ? null : [for i in op.type_icmp_echo.statistics.intervals : {
        interval = try(i.interval, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.statistics.intervals.interval, null)
        buckets  = try(i.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_echo.statistics.intervals.buckets, null)
      }]
      icmp_path_echo                                         = try(op.type_icmp_path_echo, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo, null) != null ? true : null
      icmp_path_echo_tag                                     = try(op.type_icmp_path_echo.tag, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.tag, null)
      icmp_path_echo_frequency                               = try(op.type_icmp_path_echo.frequency, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.frequency, null)
      icmp_path_echo_datasize_request                        = try(op.type_icmp_path_echo.datasize_request, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.datasize_request, null)
      icmp_path_echo_timeout                                 = try(op.type_icmp_path_echo.timeout, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.timeout, null)
      icmp_path_echo_source_ipv4                             = try(op.type_icmp_path_echo.source_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.source_address, null)
      icmp_path_echo_tos                                     = try(op.type_icmp_path_echo.tos, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.tos, null)
      icmp_path_echo_destination_ipv4                        = try(op.type_icmp_path_echo.destination_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.destination_address, null)
      icmp_path_echo_history_buckets                         = try(op.type_icmp_path_echo.history.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.history.buckets, null)
      icmp_path_echo_history_filter_all                      = try(op.type_icmp_path_echo.history.filter_all, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.history.filter_all, null)
      icmp_path_echo_history_filter_failures                 = try(op.type_icmp_path_echo.history.filter_failures, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.history.filter_failures, null)
      icmp_path_echo_history_lives                           = try(op.type_icmp_path_echo.history.lives, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.history.lives, null)
      icmp_path_echo_history_samples                         = try(op.type_icmp_path_echo.history.samples, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.history.samples, null)
      icmp_path_echo_statistics_hourly_buckets               = try(op.type_icmp_path_echo.statistics.hourly.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.statistics.hourly.buckets, null)
      icmp_path_echo_statistics_hourly_distribution_count    = try(op.type_icmp_path_echo.statistics.hourly.distribution_count, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.statistics.hourly.distribution_count, null)
      icmp_path_echo_statistics_hourly_distribution_interval = try(op.type_icmp_path_echo.statistics.hourly.distribution_interval, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.statistics.hourly.distribution_interval, null)
      icmp_path_echo_statistics_hourly_maximum_hops          = try(op.type_icmp_path_echo.statistics.hourly.maximum_hops, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.statistics.hourly.maximum_hops, null)
      icmp_path_echo_statistics_hourly_maximum_paths         = try(op.type_icmp_path_echo.statistics.hourly.maximum_paths, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_echo.statistics.hourly.maximum_paths, null)
      icmp_path_jitter                                       = try(op.type_icmp_path_jitter, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_jitter, null) != null ? true : null
      icmp_path_jitter_tag                                   = try(op.type_icmp_path_jitter.tag, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_jitter.tag, null)
      icmp_path_jitter_frequency                             = try(op.type_icmp_path_jitter.frequency, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_jitter.frequency, null)
      icmp_path_jitter_datasize_request                      = try(op.type_icmp_path_jitter.datasize_request, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_jitter.datasize_request, null)
      icmp_path_jitter_timeout                               = try(op.type_icmp_path_jitter.timeout, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_jitter.timeout, null)
      icmp_path_jitter_source_ipv4                           = try(op.type_icmp_path_jitter.source_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_jitter.source_address, null)
      icmp_path_jitter_packet_count                          = try(op.type_icmp_path_jitter.packet_count, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_jitter.packet_count, null)
      icmp_path_jitter_packet_interval                       = try(op.type_icmp_path_jitter.packet_interval, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_jitter.packet_interval, null)
      icmp_path_jitter_tos                                   = try(op.type_icmp_path_jitter.tos, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_jitter.tos, null)
      icmp_path_jitter_destination_ipv4                      = try(op.type_icmp_path_jitter.destination_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_icmp_path_jitter.destination_address, null)
      udp_echo                                               = try(op.type_udp_echo, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo, null) != null ? true : null
      udp_echo_tag                                           = try(op.type_udp_echo.tag, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.tag, null)
      udp_echo_frequency                                     = try(op.type_udp_echo.frequency, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.frequency, null)
      udp_echo_datasize_request                              = try(op.type_udp_echo.datasize_request, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.datasize_request, null)
      udp_echo_timeout                                       = try(op.type_udp_echo.timeout, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.timeout, null)
      udp_echo_source_ipv4                                   = try(op.type_udp_echo.source_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.source_address, null)
      udp_echo_source_port                                   = try(op.type_udp_echo.source_port, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.source_port, null)
      udp_echo_destination_ipv4                              = try(op.type_udp_echo.destination_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.destination_address, null)
      udp_echo_destination_port                              = try(op.type_udp_echo.destination_port, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.destination_port, null)
      udp_echo_control_disable                               = try(op.type_udp_echo.control_disable, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.control_disable, null)
      udp_echo_verify_data                                   = try(op.type_udp_echo.verify_data, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.verify_data, null)
      udp_echo_tos                                           = try(op.type_udp_echo.tos, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.tos, null)
      udp_echo_vrf                                           = try(op.type_udp_echo.vrf, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.vrf, null)
      udp_echo_statistics_hourly_buckets                     = try(op.type_udp_echo.statistics.hourly.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.statistics.hourly.buckets, null)
      udp_echo_statistics_hourly_distribution_count          = try(op.type_udp_echo.statistics.hourly.distribution_count, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.statistics.hourly.distribution_count, null)
      udp_echo_statistics_hourly_distribution_interval       = try(op.type_udp_echo.statistics.hourly.distribution_interval, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.statistics.hourly.distribution_interval, null)
      udp_echo_statistics_intervals = try(length(op.type_udp_echo.statistics.intervals) == 0, true) ? null : [for i in op.type_udp_echo.statistics.intervals : {
        interval = try(i.interval, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.statistics.intervals.interval, null)
        buckets  = try(i.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.statistics.intervals.buckets, null)
      }]
      udp_echo_history_buckets                           = try(op.type_udp_echo.history.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.history.buckets, null)
      udp_echo_history_filter_all                        = try(op.type_udp_echo.history.filter_all, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.history.filter_all, null)
      udp_echo_history_filter_failures                   = try(op.type_udp_echo.history.filter_failures, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.history.filter_failures, null)
      udp_echo_history_lives                             = try(op.type_udp_echo.history.lives, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_echo.history.lives, null)
      udp_jitter                                         = try(op.type_udp_jitter, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter, null) != null ? true : null
      udp_jitter_tag                                     = try(op.type_udp_jitter.tag, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.tag, null)
      udp_jitter_frequency                               = try(op.type_udp_jitter.frequency, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.frequency, null)
      udp_jitter_datasize_request                        = try(op.type_udp_jitter.datasize_request, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.datasize_request, null)
      udp_jitter_timeout                                 = try(op.type_udp_jitter.timeout, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.timeout, null)
      udp_jitter_source_ipv4                             = try(op.type_udp_jitter.source_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.source_address, null)
      udp_jitter_source_port                             = try(op.type_udp_jitter.source_port, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.source_port, null)
      udp_jitter_destination_ipv4                        = try(op.type_udp_jitter.destination_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.destination_address, null)
      udp_jitter_destination_port                        = try(op.type_udp_jitter.destination_port, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.destination_port, null)
      udp_jitter_packet_count                            = try(op.type_udp_jitter.packet_count, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.packet_count, null)
      udp_jitter_packet_interval                         = try(op.type_udp_jitter.packet_interval, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.packet_interval, null)
      udp_jitter_tos                                     = try(op.type_udp_jitter.tos, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.tos, null)
      udp_jitter_vrf                                     = try(op.type_udp_jitter.vrf, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.vrf, null)
      udp_jitter_control_disable                         = try(op.type_udp_jitter.control_disable, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.control_disable, null)
      udp_jitter_verify_data                             = try(op.type_udp_jitter.verify_data, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.verify_data, null)
      udp_jitter_statistics_hourly_buckets               = try(op.type_udp_jitter.statistics.hourly.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.statistics.hourly.buckets, null)
      udp_jitter_statistics_hourly_distribution_count    = try(op.type_udp_jitter.statistics.hourly.distribution_count, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.statistics.hourly.distribution_count, null)
      udp_jitter_statistics_hourly_distribution_interval = try(op.type_udp_jitter.statistics.hourly.distribution_interval, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.statistics.hourly.distribution_interval, null)
      udp_jitter_statistics_intervals = try(length(op.type_udp_jitter.statistics.intervals) == 0, true) ? null : [for i in op.type_udp_jitter.statistics.intervals : {
        interval = try(i.interval, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.statistics.intervals.interval, null)
        buckets  = try(i.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_udp_jitter.statistics.intervals.buckets, null)
      }]
      mpls_lsp_ping                                         = try(op.type_mpls_lsp_ping, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping, null) != null ? true : null
      mpls_lsp_ping_tag                                     = try(op.type_mpls_lsp_ping.tag, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.tag, null)
      mpls_lsp_ping_frequency                               = try(op.type_mpls_lsp_ping.frequency, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.frequency, null)
      mpls_lsp_ping_datasize_request                        = try(op.type_mpls_lsp_ping.datasize_request, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.datasize_request, null)
      mpls_lsp_ping_timeout                                 = try(op.type_mpls_lsp_ping.timeout, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.timeout, null)
      mpls_lsp_ping_source_ipv4                             = try(op.type_mpls_lsp_ping.source_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.source_address, null)
      mpls_lsp_ping_target_ipv4                             = try(op.type_mpls_lsp_ping.target.ipv4.address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.target.ipv4.address, null)
      mpls_lsp_ping_target_ipv4_mask                        = try(op.type_mpls_lsp_ping.target.ipv4.mask, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.target.ipv4.mask, null)
      mpls_lsp_ping_target_te_tunnel                        = try(op.type_mpls_lsp_ping.target.te_tunnel, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.target.te_tunnel, null)
      mpls_lsp_ping_target_pseudowire_address               = try(op.type_mpls_lsp_ping.target.pseudowire.address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.target.pseudowire.address, null)
      mpls_lsp_ping_target_pseudowire_vc_id                 = try(op.type_mpls_lsp_ping.target.pseudowire.vc_id, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.target.pseudowire.vc_id, null)
      mpls_lsp_ping_statistics_hourly_buckets               = try(op.type_mpls_lsp_ping.statistics.hourly.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.statistics.hourly.buckets, null)
      mpls_lsp_ping_statistics_hourly_distribution_count    = try(op.type_mpls_lsp_ping.statistics.hourly.distribution_count, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.statistics.hourly.distribution_count, null)
      mpls_lsp_ping_statistics_hourly_distribution_interval = try(op.type_mpls_lsp_ping.statistics.hourly.distribution_interval, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.statistics.hourly.distribution_interval, null)
      mpls_lsp_ping_statistics_intervals = try(length(op.type_mpls_lsp_ping.statistics.intervals) == 0, true) ? null : [for i in op.type_mpls_lsp_ping.statistics.intervals : {
        interval = try(i.interval, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.statistics.intervals.interval, null)
        buckets  = try(i.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_ping.statistics.intervals.buckets, null)
      }]
      mpls_lsp_trace                                         = try(op.type_mpls_lsp_trace, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace, null) != null ? true : null
      mpls_lsp_trace_tag                                     = try(op.type_mpls_lsp_trace.tag, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace.tag, null)
      mpls_lsp_trace_frequency                               = try(op.type_mpls_lsp_trace.frequency, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace.frequency, null)
      mpls_lsp_trace_timeout                                 = try(op.type_mpls_lsp_trace.timeout, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace.timeout, null)
      mpls_lsp_trace_source_ipv4                             = try(op.type_mpls_lsp_trace.source_address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace.source_address, null)
      mpls_lsp_trace_target_ipv4                             = try(op.type_mpls_lsp_trace.target.ipv4.address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace.target.ipv4.address, null)
      mpls_lsp_trace_target_ipv4_mask                        = try(op.type_mpls_lsp_trace.target.ipv4.mask, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace.target.ipv4.mask, null)
      mpls_lsp_trace_target_te_tunnel                        = try(op.type_mpls_lsp_trace.target.te_tunnel, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace.target.te_tunnel, null)
      mpls_lsp_trace_target_pseudowire_address               = try(op.type_mpls_lsp_trace.target.pseudowire.address, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace.target.pseudowire.address, null)
      mpls_lsp_trace_target_pseudowire_vc_id                 = try(op.type_mpls_lsp_trace.target.pseudowire.vc_id, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace.target.pseudowire.vc_id, null)
      mpls_lsp_trace_statistics_hourly_buckets               = try(op.type_mpls_lsp_trace.statistics.hourly.buckets, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace.statistics.hourly.buckets, null)
      mpls_lsp_trace_statistics_hourly_distribution_count    = try(op.type_mpls_lsp_trace.statistics.hourly.distribution_count, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace.statistics.hourly.distribution_count, null)
      mpls_lsp_trace_statistics_hourly_distribution_interval = try(op.type_mpls_lsp_trace.statistics.hourly.distribution_interval, local.defaults.iosxr.devices.configuration.ipsla.operations.type_mpls_lsp_trace.statistics.hourly.distribution_interval, null)
    }]
    schedules = try(length(local.device_config[device.name].ipsla.schedules) == 0, true) ? null : [for s in local.device_config[device.name].ipsla.schedules : {
      operation_number   = try(s.operation, local.defaults.iosxr.devices.configuration.ipsla.schedules.operation, null)
      life_forever       = try(s.life.forever, local.defaults.iosxr.devices.configuration.ipsla.schedules.life.forever, null)
      life_time          = try(s.life.time, local.defaults.iosxr.devices.configuration.ipsla.schedules.life.time, null)
      start_hour         = try(s.start_time.date.hour, local.defaults.iosxr.devices.configuration.ipsla.schedules.start_time.date.hour, null)
      start_minute       = try(s.start_time.date.minute, local.defaults.iosxr.devices.configuration.ipsla.schedules.start_time.date.minute, null)
      start_second       = try(s.start_time.date.second, local.defaults.iosxr.devices.configuration.ipsla.schedules.start_time.date.second, null)
      start_month        = try(s.start_time.date.month, local.defaults.iosxr.devices.configuration.ipsla.schedules.start_time.date.month, null)
      start_day_of_month = try(s.start_time.date.day_of_month, local.defaults.iosxr.devices.configuration.ipsla.schedules.start_time.date.day_of_month, null)
      start_year         = try(s.start_time.date.year, local.defaults.iosxr.devices.configuration.ipsla.schedules.start_time.date.year, null)
      start_pending      = try(s.start_time.pending, local.defaults.iosxr.devices.configuration.ipsla.schedules.start_time.pending, null)
      start_after_hour   = try(s.start_time.after.hour, local.defaults.iosxr.devices.configuration.ipsla.schedules.start_time.after.hour, null)
      start_after_minute = try(s.start_time.after.minute, local.defaults.iosxr.devices.configuration.ipsla.schedules.start_time.after.minute, null)
      start_after_second = try(s.start_time.after.second, local.defaults.iosxr.devices.configuration.ipsla.schedules.start_time.after.second, null)
      start_now          = try(s.start_time.now, local.defaults.iosxr.devices.configuration.ipsla.schedules.start_time.now, null)
      recurring          = try(s.recurring, local.defaults.iosxr.devices.configuration.ipsla.schedules.recurring, null)
      ageout             = try(s.ageout, local.defaults.iosxr.devices.configuration.ipsla.schedules.ageout, null)
    }]
  } if try(length([for k in keys(local.device_config[device.name].ipsla) : k if k != "responder"]) > 0, false) || try(length([for k in keys(local.defaults.iosxr.devices.configuration.ipsla) : k if k != "responder"]) > 0, false) }
}

resource "iosxr_ipsla" "ipsla" {
  for_each                      = local.ipsla
  device                        = each.key
  low_memory                    = each.value.low_memory
  key_chain                     = each.value.key_chain
  hw_timestamp_disable          = each.value.hw_timestamp_disable
  server_twamp                  = each.value.server_twamp
  server_twamp_port             = each.value.server_twamp_port
  server_twamp_timer_inactivity = each.value.server_twamp_timer_inactivity
  operations                    = each.value.operations
  schedules                     = each.value.schedules
}

##### IPSLA RESPONDER #####

locals {
  ipsla_responder = { for device in local.devices : device.name => {
    twamp         = try(local.device_config[device.name].ipsla.responder.twamp, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp, null) != null ? true : null
    twamp_timeout = try(local.device_config[device.name].ipsla.responder.twamp.timeout, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp.timeout, null)
    type_udp_ipv4 = try(length(local.device_config[device.name].ipsla.responder.udp_ipv4) == 0, true) ? null : [for u in local.device_config[device.name].ipsla.responder.udp_ipv4 : {
      address = try(u.address, local.defaults.iosxr.devices.configuration.ipsla.responder.udp_ipv4.address, null)
      ports = try(length(u.ports) == 0, true) ? null : [for p in u.ports : {
        port_number = p
      }]
    }]
    twamp_light_sessions = try(length(local.device_config[device.name].ipsla.responder.twamp_light_sessions) == 0, true) ? null : [for ses in local.device_config[device.name].ipsla.responder.twamp_light_sessions : {
      session_id     = try(ses.id, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.id, null)
      authentication = try(ses.authentication, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.authentication, null)
      encryption     = try(ses.encryption, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.encryption, null)
      timeout        = try(ses.timeout, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.timeout, null)
      local_ipv4_addresses = try(length(ses.local_addresses) == 0, true) ? null : [for la in ses.local_addresses : {
        address    = try(la.address, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.address, null)
        local_port = try(la.port, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.port, null)
        remote_ipv4_addresses = try(length(la.remote_addresses) == 0, true) ? null : [for ra in la.remote_addresses : {
          address     = try(ra.address, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.remote_addresses.address, null)
          remote_port = try(ra.port, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.remote_addresses.port, null)
          vrf         = try(ra.vrf, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.remote_addresses.vrf, "default")
        } if can(regex(":", try(ra.address, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.remote_addresses.address, ""))) == false]
      } if can(regex(":", try(la.address, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.address, ""))) == false]
      local_ipv6_addresses = try(length(ses.local_addresses) == 0, true) ? null : [for la in ses.local_addresses : {
        address    = try(la.address, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.address, null)
        local_port = try(la.port, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.port, null)
        remote_ipv6_addresses = try(length(la.remote_addresses) == 0, true) ? null : [for ra in la.remote_addresses : {
          address     = try(ra.address, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.remote_addresses.address, null)
          remote_port = try(ra.port, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.remote_addresses.port, null)
          vrf         = try(ra.vrf, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.remote_addresses.vrf, "default")
        } if can(regex(":", try(ra.address, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.remote_addresses.address, ""))) == true]
      } if can(regex(":", try(la.address, local.defaults.iosxr.devices.configuration.ipsla.responder.twamp_light_sessions.local_addresses.address, ""))) == true]
    }]
  } if try(local.device_config[device.name].ipsla.responder, null) != null || try(local.defaults.iosxr.devices.configuration.ipsla.responder, null) != null }
}

resource "iosxr_ipsla_responder" "ipsla_responder" {
  for_each             = local.ipsla_responder
  device               = each.key
  twamp                = each.value.twamp
  twamp_timeout        = each.value.twamp_timeout
  type_udp_ipv4        = each.value.type_udp_ipv4
  twamp_light_sessions = each.value.twamp_light_sessions

  depends_on = [
    iosxr_vrf.vrf,
    iosxr_ipsla.ipsla
  ]
}
