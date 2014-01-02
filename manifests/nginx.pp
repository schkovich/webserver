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

  file {"${nginx::params::nx_conf_dir}/sites-enabled":
    ensure => 'directory',
  }

  nginx::resource::upstream { $pool_name :
    ensure  => 'present',
    members => $pool,
  }

}
