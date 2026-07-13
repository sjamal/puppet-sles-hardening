# Class: puppet_sles_hardening::workload_profile
# Configures advanced system profiles for demanding hosting engines like IBM DB2 and SAP software.
class puppet_sles_hardening::workload_profile {

  # File configuration parameter template instantiation for low-level memory maps
  file { '/etc/sysctl.d/99-sles-enterprise-workload.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('puppet_sles_hardening/sysctl_sles_sap.conf.erb'),
  }

  # Ensure transparent hugepage definitions are optimized for heavy database execution
  exec { 'optimize_transparent_hugepages':
    command => '/echo never > /sys/kernel/mm/transparent_hugepage/enabled',
    unless  => '/grep -q "\[never\]" /sys/kernel/mm/transparent_hugepage/enabled',
    path    => ['/bin', '/usr/bin', '/sbin'],
  }
}

