class web_server::php::extensions::curl (
  $ensure
) {

  include 'php::extension::curl'

  case $ensure {
    absent, purged, held: {
      exec {"sudo php5dismod curl":
        path => ['/usr/bin', '/usr/sbin'],
        require => Class['php::extension::curl'],
      }
    }
    present, installed, latest: {
      exec {"sudo php5enmod curl":
        path => ['/usr/bin', '/usr/sbin'],
        require => Class['php::extension::curl'],
      }
    }
  }

  Package['curl'] -> Class['web_server::php::extensions::curl']
}