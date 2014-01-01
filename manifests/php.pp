define web_server::php {

  include '::php'
  include '::php::cli'
  include '::php::dev'
  include '::php::pear'
  include 'arbor::php::fpm::pool'
  include 'arbor::php::extensions'
  include '::php::composer'
  include '::php::phpunit'

  package {'build-essential':
    ensure   => 'latest',
    provider => 'apt'
  }

  Package['build-essential'] -> Class['php'] -> Class['php::cli']
  -> Class['php::dev'] -> Class['php::pear'] -> Class['arbor::php::extensions']
  -> Class['arbor::php::fpm::pool'] -> Class['php::composer']
  -> Class['php::phpunit']
}
