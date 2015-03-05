class web_server::php::extensions::solr (
  $ensure,
  $provider,
) {
  class{ 'php::extension::solr':
    ensure => $ensure,
    provider => $provider,
  }
}
