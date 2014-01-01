class web_server::php::fpm::pool (
  $pool_name,
  $listen,
  $error_log,
  $inifile,
  $settings
) {

  include 'php::fpm::daemon'

  php::config { 'php-fpm':
    inifile  => $inifile,
    settings => $settings;
  }

  php::fpm::conf { $pool_name:
    ensure => "present",
    listen => $listen,
    error_log => $error_log;
  }

  php::fpm::conf { 'www':
    ensure => "absent";
  }

  Class['php::fpm::daemon'] -> Php::Config['php-fpm']

}
