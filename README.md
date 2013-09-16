ChangLog
--------
Include install.pp and more fix 

firefox
-------

This module allows control of the profiles and global preferences firefox. Testing onFirefox 17 CentOS6.4. Basically controls two files:
        
     CentOS/RedHat: firefox.js file in /usr/lib64/firefox/defaults/preferences/ or /usr/lib/firefox/defaults/pref/ 

     Debian/Ubuntu: firefox.cfg file in /usr/lib64/firefox/ or  /usr/lib/firefox/

Depends:
-------
 
-.CentOS/Redhat: EPEL repository or package firefox-17.0.8-1.el6.centos.x86_64.rpm
Ubuntu/Debian: sourcelist

-. One was developed for (CentOS/RedHat)6.4, however it can be exported to other platforms.

firefox.cfg.erb (firefox/templates/)

firefox.js  (firefox/files/)

bookmarks.html file can be generated from any firefox browser and copy files 
within the directory


License
-------
Apache License, Version 2.0

Contact
-------
Javier Calles javier.calles@smartmatic.com

Support
-------

 [Projects site](https://groups.google.com/forum/#!forum/puppet-venezuela)
 
Example
---------
    node /fqdn/ {
    include firefox        
    }
    
