class web_server::nginx (
  $pool_name,
  $pool,
  $client_max_body_size
) {

  class { '::nginx': }

  nginx::resource::upstream { $pool_name :
    ensure  => 'present',
    members => $pool,
    require => Class['::nginx'],
    before => File["${nginx::params::nx_conf_dir}/sites-enabled"]
  }

  file {"${nginx::params::nx_conf_dir}/sites-enabled":
    ensure => 'directory',
  }


}
