class web_server::php::extensions::curl (
  $ensure,
  $provider,
) {
  class{ 'php::extension::curl':
    ensure => $ensure,
    provider => $provider,
  }
}
