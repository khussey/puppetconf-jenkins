node default {
  group { 'puppet' : ensure => present; }
    include jenkins
  jenkins::plugin {
    'git' :
      require => Class['jenkins'];
  }
}
