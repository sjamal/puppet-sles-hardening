# Class: puppet_sles_hardening::kernel_tuning
# Injects low-level core settings to protect against stack errors and routing leaks.
class puppet_sles_hardening::kernel_tuning {

  # Implement core system configuration parameter values safely
  sysctl { 'net.ipv4.conf.all.accept_redirects':
    ensure => present,
    value  => '0',
  }

  sysctl { 'net.ipv4.conf.all.secure_redirects':
    ensure => present,
    value  => '0',
  }

  sysctl { 'net.ipv4.conf.all.log_martians':
    ensure => present,
    value  => '1',
  }

  sysctl { 'fs.suid_dumpable':
    ensure => present,
    value  => '0',
  }
}

