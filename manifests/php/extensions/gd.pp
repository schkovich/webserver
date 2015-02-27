class web_server::php::extensions::gd (
  $ensure,
  $provider,
) {
  class{ 'php::extension::gd':
    ensure => $ensure,
    provider => $provider,
  }
}
