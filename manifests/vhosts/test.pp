class web_server::vhosts::test (
  $host,
  $domain,
  $www_root,
  $listen_port,
  $index_files,
  $ssl,
  $client_max_body_size,
  $try_files,
  $location_fpm,
  $location_ht
) {

  nginx::resource::vhost { $host :
    ensure                 => 'present',
    server_name            => ["${host}.${domain}"],
    www_root               => $www_root,
    index_files            => $index_files,
    listen_port            => $listen_port,
    ssl                    => $ssl,
    use_default_location   => false,
  }

  nginx::resource::location {'test-default':
    ensure              => 'present',
    vhost               => $host,
    location            => '/',
    location_custom_cfg => {try_files => $try_files},
    priority            => 590,
  }

  nginx::resource::location { 'test-fpm':
    ensure              => 'present',
    priority            => 591,
    ssl                 => $location_fpm['ssl'],
    ssl_only            => $location_fpm['ssl_only'],
    location            => $location_fpm['location'],
    vhost               => $host,
    fastcgi_script      => $location_fpm['fastcgi_script'],
    fastcgi_split_path  => $location_fpm['fastcgi_split_path'],
    fastcgi             => $location_fpm['fastcgi'],
    location_cfg_append => $location_fpm['location_cfg_append']
  }

  $deny_config = {
    'deny' => $location_ht['deny']
  }

  nginx::resource::location { 'test-ht':
    ensure        => 'present',
    priority      => 592,
    location      => $location_ht['location'],
    vhost         => $host,
    location_custom_cfg => $deny_config,
  }

  $off_config = {
    'access_log'    => 'off',
    'log_not_found' => 'off'
  }

  $img_config = {
    'access_log'    => 'off',
    'expires' => '30d'
  }

  nginx::resource::location {'test-favicon':
    ensure         => 'present',
    priority       => 593,
    location       => '/favicon.ico',
    vhost    => $host,
    location_custom_cfg => $off_config,
  }

  nginx::resource::location {'test-robots':
    ensure              => 'present',
    priority            => 594,
    location      => '/robots.txt',
    vhost    => $host,
    location_custom_cfg => $off_config,
  }

  nginx::resource::location {'test-images':
    ensure              => 'present',
    priority            => 595,
    location      => '~* ^.+.(jpg|jpeg|gif|css|png|js|ico)$',
    vhost    => $host,
    location_custom_cfg => $img_config,
  }

}
