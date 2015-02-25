class web_server::php::extensions {

  package { 'curl': }

  include 'web_server::php::extensions::xdebug'
  include 'web_server::php::extensions::curl'
}
