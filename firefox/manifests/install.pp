class firefox::install {
case $operatingsystem {
        /(CentOS|RedHat)/: { $firefox = "firefox" }
        /(Debian|Ubuntu)/: { $firefox = "firefox" }
        default: { fail("Unrecognized operating system for fastesmirror") }
}
  package {'firefox':
  name   => "${firefox}",
  ensure => 'installed',
}

notify {"install firefox":}
}
