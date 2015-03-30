class web_server::php::extensions::mysql (
  $ensure,
  $provider,
) {
  class{ 'php::extension::mysql':
    ensure => $ensure,
    provider => $provider,
  }
}
