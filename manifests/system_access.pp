# Class: puppet_sles_hardening::system_access
# Standardizes file system permissions, access controls, and administrative settings.
class puppet_sles_hardening::system_access {

  # Strict secure execution properties for administrative login daemons
  file_line { 'disable_ssh_root_login':
    path  => '/etc/ssh/sshd_config',
    line  => 'PermitRootLogin no',
    match => '^#?PermitRootLogin',
    notify => Service['sshd'],
  }

  file_line { 'enforce_ssh_protocol_compliance':
    path  => '/etc/ssh/sshd_config',
    line  => 'Protocol 2',
    match => '^#?Protocol',
    notify => Service['sshd'],
  }

  service { 'sshd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
  }

  # Enforce restrictive standard execution masks for generic infrastructure parameters
  file { '/etc/securetty':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0400',
  }
}

