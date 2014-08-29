class web_server::php::fpm::pool (
  $pool_name,
  $ensure,
  $provider,
  $inifile,
  $settings
) {

  include 'php'
  include 'php::params'

  class { 'php::fpm':
    ensure => $ensure,
    provider => $provider,
    inifile  => $inifile,
    settings => $settings;
  }

  php::fpm::pool { 'www':
    ensure => "absent";
  }

  php::fpm::pool { $pool_name: }

  Php::Extension <| |> ~> Service['php5-fpm']

  exec { "restart-php5-fpm":
    command  => "service php5-fpm restart",
    path => "/bin:/sbin:/usr/bin:/usr/sbin",
    schedule => hourly
  }

}
