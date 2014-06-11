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
  $server = 'nginx', $host = $web_server::conf::host, $hostip = $web_server::conf::hostip,
  $port = 8080, $user = $web_server::conf::user
) inherits web_server::conf {

  # http://www.xenuser.org/open-source-development/using-environment-variables-in-puppet/
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

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

  class {"web_server::${server}": }

}
