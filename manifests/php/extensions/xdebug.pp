class web_server::php::extensions::xdebug {

  #  todo: Set ensure on this class instead directly on php::extension::xdebug
  include 'php::extension::xdebug'

  case $php::extension::xdebug::params::ensure {
    absent, purged, held: { $noop = false }
    present, installed, latest: { $noop = true }
  }

  exec {"sudo php5enmod xdebug":
    path => ['/usr/bin', '/usr/sbin'],
    require => Class['php::extension::xdebug'],
    noop => $noop
  }

}
