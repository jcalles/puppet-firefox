# Class: localusers
#
# This module manages localusers
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class firefox {
####### Set ipdddress or fqdn #############################
$homepage='confc01srv01:8443'
include firefox::config
include firefox::install
Class["firefox::install"] ->
Class["firefox::config"]


}
