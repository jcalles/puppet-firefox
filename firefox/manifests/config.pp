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
	case $::operatingsystem {
      	/(CentOS|Redhat)/: { 
		$pathfirefox = "/usr/lib64/firefox/" 
		$pathpref = "${pathfirefox}/defaults/preferences" }
      	/(Ubuntu|Debian)/: { 
		$pathfirefox = "/usr/lib/firefox/" 
		$pathpref = "${pathfirefox}/defaults/pref" }
      	default: { fail("Unrecognized operating system for Firefox") }
}

#	package {
#	'firefox':
#	ensure => installed,
#}
	file {
	'firefox.cfg':
	path => "${pathfirefox}/firefox.cfg",
	content => template('firefox/firefox.cfg.erb'),
	mode => 644,
	owner => 'root',
	group => 'root',
	require => Class['firefox::install'],
}

	file {
	'firefox.js':
	path => "${pathpref}/firefox.js",
	source => 'puppet:///modules/firefox/firefox.js',
	mode => 644,
	owner => 'root',
	group => 'root',
	require => File['firefox.cfg'],
}
	file {'/etc/firefox/':
	ensure => 'directory',
	group  => 'root',
	recurse => true,
	force => true,
	mode   => '775',
	owner  => 'root',
}
	file {'/etc/firefox/profile/':
	ensure => 'directory',
	group  => 'root',
	recurse => true,
	force => true,
	mode   => '775',
	owner  => 'root',
	require => [File['/etc/firefox/'],File['firefox.cfg']],
}
	file {
	'bookmarks.html':
	path => '/etc/firefox/profile/bookmarks.html',
	source => 'puppet:///modules/firefox/bookmarks-all.html',
	mode => 775,
	owner => 'root',
	group => 'root',
	require => [File['/etc/firefox/profile/']],
}
}
