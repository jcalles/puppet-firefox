# Class: Firefox Preferences
#
# This module manages: User Preferences 
#
# Parameters:
#
# Actions: File Control firefox.js and firefox.cfg
#
# Requires: Repositories
#
# Sample Usage: change name jcalles-firefox-0.0.1 to firefox and put on /etc/puppetlabs/puppet/modules/ 
#               include this module on any node 
#    node  "fqdn" inherits   {
#      include firefox
#                 }
#
#
# [Remember: No empty lines between comments and class definition]
class firefox::config {
<<<<<<< HEAD
	case $::operatingsystem {
      	/(CentOS|Redhat)/: { 
		$pathfirefox = "/usr/lib64/firefox/" 
		$pathpref = "${pathfirefox}/defaults/preferences" }
      	/(Ubuntu|Debian)/: { 
		$pathfirefox = "/usr/lib/firefox/" 
		$pathpref = "${pathfirefox}/defaults/pref" }
=======
	case $operatingsystem {
      	/(CentOS|Redhat)/: { $pathfirefox = "/usr/lib64/firefox/defaults/preferences" }
      	/(Ubuntu|Debian)/: { $pathfirefox = "/usr/lib/firefox/defaults/pref" }
>>>>>>> 0628687adc6a48f7f5e9f112dc3240b3e86006a6
      	default: { fail("Unrecognized operating system for Firefox") }
}

	package {
	'firefox':
	ensure => installed,
}
	file {
	'firefox.cfg':
<<<<<<< HEAD
	path => "${pathfirefox}/firefox.cfg",
=======
	path => "$pathfirefox/firefox.cfg",
>>>>>>> 0628687adc6a48f7f5e9f112dc3240b3e86006a6
	content => template('firefox/firefox.cfg.erb'),
	mode => 644,
	owner => 'root',
	group => 'root',
	require => Package['firefox'],
}

	file {
	'firefox.js':
<<<<<<< HEAD
	path => "${pathpref}/firefox.js",
=======
	path => "$pathfirefox/firefox.js",
>>>>>>> 0628687adc6a48f7f5e9f112dc3240b3e86006a6
	source => 'puppet:///modules/firefox/firefox.js',
	mode => 644,
	owner => 'root',
	group => 'root',
	require => Package['firefox'],
}
	file {'/etc/firefox/':
	ensure => 'directory',
	group  => 'root',
	recurse => true,
	force => true,
	mode   => '775',
	owner  => 'root',
	require => Package['firefox'],
}
	file {'/etc/firefox/profile/':
	ensure => 'directory',
	group  => 'root',
	recurse => true,
	force => true,
	mode   => '775',
	owner  => 'root',
	require => [File['/etc/firefox/'],Package['firefox']],
}
	file {
	'bookmarks.html':
	path => '/etc/firefox/profile/bookmarks.html',
<<<<<<< HEAD
	source => 'puppet:///modules/firefox/bookmarks-all.html',
=======
	source => 'puppet:///modules/firefox/bookmarks.html',
>>>>>>> 0628687adc6a48f7f5e9f112dc3240b3e86006a6
	mode => 775,
	owner => 'root',
	group => 'root',
	require => [File['/etc/firefox/profile/'],Package['firefox']],
}
}
