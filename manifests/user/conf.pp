class web_server::user::conf {
  $runas = $operatingsystem ? {
  /(?i-mx:ubuntu|debian)/        => 'www-data',
  /(?i-mx:centos|fedora|redhat)/ => 'nobody',
  default => fail("Unsupported osfamily: ${::osfamily} operatingsystem:
        ${::operatingsystem}, module ${module_name} only support osfamily
        RedHat and Debian"
  )
  }
  #  todo: centos group that has read permissions on certificates?
  $group = $operatingsystem ? {
  /(?i-mx:ubuntu|debian)/        => 'ssl-cert',
  /(?i-mx:centos|fedora|redhat)/ => 'nobody',
  default => fail("Unsupported osfamily: ${::osfamily} operatingsystem:
        ${::operatingsystem}, module ${module_name} only support osfamily
        RedHat and Debian"
  )
  }
}
