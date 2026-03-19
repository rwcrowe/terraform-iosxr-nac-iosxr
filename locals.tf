locals {
  dscp_map = {
    "0"  = "default", "8" = "cs1", "10" = "af11",
    "12" = "af12", "14" = "af13", "16" = "cs2",
    "18" = "af21", "20" = "af22", "22" = "af23",
    "24" = "cs3", "26" = "af31", "28" = "af32",
    "30" = "af33", "32" = "cs4", "34" = "af41",
    "36" = "af42", "38" = "af43", "40" = "cs5",
    "46" = "ef", "48" = "cs6", "56" = "cs7"
  }
  precedence_map = {
    "0" = "routine", "1" = "priority",
    "2" = "immediate", "3" = "flash",
    "4" = "flash-override", "5" = "critical",
    "6" = "internet", "7" = "network"
  }
  # Used by iosxr_key_chain to convert MM-DD-YYYY date format to YANG month enum
  keychain_month_names = {
    "01" = "january", "02" = "february", "03" = "march",
    "04" = "april", "05" = "may", "06" = "june",
    "07" = "july", "08" = "august", "09" = "september",
    "10" = "october", "11" = "november", "12" = "december"
  }
  # iosxr_segment_routing_te: maps flex-algo metric type names to YANG uint32 values
  flex_algo_metric_type_map = {
    "igp"       = "0"
    "latency"   = "1"
    "te"        = "2"
    "bandwidth" = "3"
  }
  # iosxr_segment_routing_te: maps SRv6 SID format CLI names to YANG enum values
  srv6_sid_format_map = {
    "usid-f3216" = "micro-sid"
  }
  # iosxr_segment_routing_te: maps effective-metric type YAML names to YANG enum values
  metric_type_map = {
    "unknown" = "default"
  }
}
