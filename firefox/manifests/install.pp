class firefox::install {
case $operatingsystem {
        /(CentOS|RedHat)/: { $firefox = "firefox-17.0.7-1.el6.centos.x86_64" }
        /(Debian|Ubuntu)/: { $firefox = "firefox" }
        default: { fail("Unrecognized operating system for fastesmirror") }
}
  package {'firefox':
  name   => "${firefox}",
  ensure => 'installed',
}

notify {"install firefox":}
}
