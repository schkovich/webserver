class web_server::vhosts::apache (
  $host,
  $domain,
  $www_root,
  $listen_port,
  $user = $web_server::user::conf::runas,
  $group = $web_server::user::conf::group
) {
  apache::vhost { "${host}.${domain}":
    port          => $listen_port,
    docroot       => $www_root,
    docroot_owner => $user,
    docroot_group => $group,
  }
}