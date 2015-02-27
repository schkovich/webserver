class web_server::php::extensions::tidy (
  $ensure,
  $provider,
) {
  class{ 'php::extension::tidy':
    ensure => $ensure,
    provider => $provider,
  }
}
