# Class: web_server
#
# This module manages web_server
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class web_server (
  $host = $web_server::conf::host, $port = 8080, $user = 'vagrant'
) inherits web_server::conf {

  package { 'git':
    ensure => "present",
  }

  class {"web_server::user":
    require => Package["git"],
  }

  file {
    "/home/${user}/opt":
    ensure => directory,
    group  => $user,
    owner  => $user,
    mode   => 0755,
    require => Class["web_server::user"],
  }

}
