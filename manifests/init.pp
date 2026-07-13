# Class: puppet_sles_hardening
# Main execution profile for isolating and scaling security settings across SLES platforms.
class puppet_sles_hardening (
  Boolean $enforce_cis          = true,
  Boolean $database_optimizations = true,
  String  $security_level       = 'high'
) {
  
  # Ensure module exclusively interacts with supported enterprise Linux families
  if $facts['os']['family'] != 'Suse' or $facts['os']['release']['major'] != '15' {
    fail("Target OS architecture unsupported. This operational module strictly targets SLES 15 frameworks.")
  }

  # Orchestrated class executions
  contain puppet_sles_hardening::system_access
  contain puppet_sles_hardening::kernel_tuning

  if $database_optimizations {
    contain puppet_sles_hardening::workload_profile
  }
}

