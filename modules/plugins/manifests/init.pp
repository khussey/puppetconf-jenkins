# Class: plugins
#
# This module manages plugins
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class plugins {
  package { 'git':
    ensure => 'latest'
  }

  jenkins::plugin::install { 'git':
    require => Package['git']
  }
  jenkins::plugin::install { 'github-api':
  }
  jenkins::plugin::install { 'github':
    require => Jenkins::Plugin::Install['git', 'github-api']
  }
  jenkins::plugin::install { 'stackhammer':
  }
}
