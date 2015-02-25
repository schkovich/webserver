class web_server::php::extensions::memcache (
  $ensure,
  $provider,
) {
  class{ 'php::extension::memcache':
    ensure => $ensure,
    provider => $provider,
  }
}
