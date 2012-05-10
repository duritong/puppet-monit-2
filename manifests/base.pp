class monit::base {
  package {"monit":
    ensure => present
  }

  service {"monit":
    ensure  => running,
    require => Package["monit"]
  }

  file {"/etc/monit/monitrc":
    ensure => present,
    source => "puppet:///modules/monit/monitrc",
    owner  => root,
    group  => root,
    mode   => 600,
    require => Package["monit"],
  }

  file {"/etc/monit/monitrc.d":
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => 700,
    require => Package["monit"],
  }

  # Monit doesn't start when monitrc.d/ is empty
  monit::config{"default":
    ensure  => present,
    content => "",
  }
}
