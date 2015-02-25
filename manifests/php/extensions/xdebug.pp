class web_server::php::extensions::xdebug (
  $ensure,
  $provider,
) {
  class{ 'php::extension::xdebug':
    ensure => $ensure,
    provider => $provider,
  }
}
