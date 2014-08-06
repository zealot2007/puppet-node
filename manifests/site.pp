if versioncmp($::puppetversion, '3.6.1') >= 0 {
  Package { allow_virtual => true }
}

rbenv::install { 'vagrant':
  group => 'vagrant',
  home => '/home/vagrant',
}

rbenv::compile { '2.1.2':
  user => 'vagrant',
  home => '/home/vagrant',
}

include redis
class { 'memcached': }
class { 'postgresql::server': }
class { 'nginx': }

file { "/var/www/$project":
  ensure => 'directory',
}
