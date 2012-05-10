define monit::config($ensure, $content = false, $source = false) {
  $filename = "/etc/monit/monitrc.d/puppet-${name}.conf"

  case $ensure {
    present: {
      file {$filename:
        ensure => present,
        owner  => root,
        group  => root,
        mode   => 600,
        notify => Service["monit"],
        require => Package["monit"],
      }
      if $source {
        File[$filename]{
          source => $source
        }
      } elsif $content {
        File[$filename]{
          content => $content
        }
      }
    }
    absent: {
      file {"/etc/monit/monitrc.d/puppet-${name}.conf":
        ensure => absent,
        notify  => Service["monit"],
        require => Package["monit"],
      }
    }
  }
}
