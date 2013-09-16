class firefox::install {
package {"firefox-17.0.7-1.el6.centos.x86_64": 
	ensure => 'installed', 

}
notify {"install firefox":}
}
