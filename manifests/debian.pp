class monit::debian inherits monit::base {
  file {"/etc/default/monit":
    ensure => present,
    source => "puppet:///modules/monit/debian/monit.default",
    require => Package["monit"],
  }
}
