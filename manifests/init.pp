class monit {
  case $::operatingsystem {
    debian,ubuntu: { include monit::debian }
    default: { include monit::base }
  }
}
