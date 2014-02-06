# VagranTRT -- A Vagrant setup for the WordPress.org Theme Review Team 

## Overview

I started this project in order to allow the WordPress.org Theme Review Team (TRT) to better standardize on a reviewing environment. VagranTRT should give a unified platform for TRT members using Vagrant and should (hopefully) lead to faster theme review turn-around times.

## What You Get

*   CentOS 6.5
*   WordPress Developer Plugin, Theme Check Plugin 
*   WP-CLI
*   MySQL
*   PHP
*   Nginx
*   Apache
*   Puppet
*   [WPTest test data](http://wptest.io/)
*   Official [Theme Unit Test data](http://codex.wordpress.org/Theme_Unit_Test)

## Requirements

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://downloads.vagrantup.com/)
* [Git](http://git-scm.com/downloads)
* [Subversion](http://subversion.apache.org/packages.html)

## Getting Started

### Unix

If you’re on a Unix-based machine with a Bash shell, setup is pretty easy:

1.  Clone the [VagranTRT repo](https://github.com/zamoose/vagrantrt)

## Usernames and Passwords

### MySQL
* root:blank
* wordpress:wordpress
* wordpress2:wordpress2
* wordpress_multi:wordpress_multi

### WordPress
* wordpress:wordpress

## Vagrant Primer

The [Vagrant CLI documentation](http://docs.vagrantup.com/v2/cli/index.html) will be useful for developers that haven't used Vagrant before.

Some useful commands:

* `vagrant up` - Start and provisions the VM
* `vagrant halt` - Stops the VM
* `vagrant reload` - Restarts and provisions the VM
* `vagrant provision` - Provisions the VM
* `vagrant ssh` - Logs into the VM with ssh
* `vagrant destroy` - Deletes the VM

## Submodules

The puppet modules are all set up as submodules in `puppet/modules`. In general, you shouldn't have to worry about this because the `vip-init` script will update the submodules automatically. Just noting here for documentation purposes at this point.

## Acknowledgements

I have stood upon the shoulders of giants -- much of the inspiration and format of this project is based upon the hard work those contributing to the [VIP Quickstart](https://github.com/Automattic/vip-quickstart) project have put in and I thank them greatly for that work.

The following projects are either inspirations, Git submodules employed in this project, or the very tools the project itself is built upon:

* [Vagrant](http://vagrantup.com/)
* [Puppet](http://puppetlabs.com/)
* [Varying Vagrant Vagrants](https://github.com/10up/varying-vagrant-vagrants)
* [VIP Quickstart](https://github.com/Automattic/vip-quickstart)
* [WP-CLI](http://wp-cli.org)
* [WP-CLI Theme Test](https://github.com/pixline/wp-cli-theme-test-command)
* [puppet-firewall](https://github.com/example42/puppet-firewall)
* [puppet-mysql](https://github.com/example42/puppet-mysql)
* [puppet-nginx](https://github.com/example42/puppet-nginx)
* [puppet-php](https://github.com/jippi/puppet-php)
* [puppet-wp](https://github.com/rmccue/puppet-wp)
* [puppetlabs-stdlib](https://github.com/puppetlabs/puppetlabs-stdlib)
* [puppi](https://github.com/example42/puppi)
