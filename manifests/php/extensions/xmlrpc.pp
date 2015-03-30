class web_server::php::extensions::xmlrpc (
  $ensure,
  $provider,
) {
  class{ 'php::extension::xmlrpc':
    ensure => $ensure,
    provider => $provider,
  }
}
