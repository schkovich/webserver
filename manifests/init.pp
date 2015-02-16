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
  $host = $web_server::conf::host, $hostip = $web_server::conf::hostip,
  $port = 8080, $user = 'vagrant'
) inherits web_server::conf {

  # http://www.xenuser.org/open-source-development/using-environment-variables-in-puppet/
  Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

# todo: https://forge.puppetlabs.com/puppetlabs/git
  package { 'git':
    ensure => "present",
  }

  package {'build-essential':
    ensure   => 'latest',
    provider => 'apt'
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

  class { 'web_server::nginx': }

}
