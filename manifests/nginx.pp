class web_server::nginx (
  $pool_name,
  $pool,
  $mime_types,
  $client_max_body_size
) {

  class { '::nginx': }

#  class {'::nginx::mimetypes':
#    mime_types => $mime_types
#  }

  nginx::resource::upstream { $pool_name :
    ensure  => 'present',
    members => $pool,
  }

}
