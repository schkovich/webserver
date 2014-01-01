class web_server::nginx (
  $pool_name,
  $pool,
  $client_max_body_size,
  $mime_types
) {

  class { '::nginx': }

  nginx::resource::upstream { $pool_name :
    ensure  => 'present',
    members => $pool,
  }

#  class {'::nginx::mimetypes':
#    mime_types => $mime_types
#  }

  file {"${nginx::params::nx_conf_dir}/sites-enabled":
    ensure => 'directory',
  }

  File["${nginx::params::nx_conf_dir}/sites-enabled"]
  -> Class['nginx::mimetypes']

}
