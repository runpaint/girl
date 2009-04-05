Prints the fully-qualified domain name (FQDN) of the system.

* `dnsdomainname` - Displays the domain name part of the FQDN
* `dnsdomainname --fqdn` - Displays the complete FQDN.

The method used to change the FQDN depends on the contents of
`/etc/host.conf`, but the `man` page reports that "usually (if the hosts file
is parsed before DNS or NIS) you can change it in `/etc/hosts`".

