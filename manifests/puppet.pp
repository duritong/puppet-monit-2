class monit::puppet {
  include monit

  monit::config{"puppet":
    ensure => present,
    source => "puppet:///modules/monit/puppet.conf",
  }
}
