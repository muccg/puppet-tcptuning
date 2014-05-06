#
class tcptuning () {

  file {'/etc/sysctl.d/60-tcptuning.conf':
    source => template('tcptuning/60-tcptuning.conf.erb'),
    notify => Exec['tcp-tuning'],
  }

  exec {'tcp-tuning':
    command     => '/sbin/sysctl -p /etc/sysctl.d/60-tcptuning.conf',
    refreshonly => true,
  }
}
